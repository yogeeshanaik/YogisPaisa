import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/core/enum/box_types.dart';
import 'package:paisa/src/core/extensions/build_context_extension.dart';
import 'package:paisa/src/data/accounts/model/account_model.dart';
import 'package:paisa/src/data/category/model/category_model.dart';
import 'package:paisa/src/data/expense/model/expense_model.dart';
import 'package:paisa/src/data/settings/data.dart';
import 'package:paisa/src/data/settings/file_handler.dart';
import 'package:paisa/src/presentation/upload/datatable_widget.dart';
import 'package:paisa/src/presentation/upload/reorderableList.dart';
import 'package:paisa/src/presentation/upload/widgets/save_field_mapping_widget.dart';
import 'package:paisa/src/presentation/widgets/paisa_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';

/*
class LoadCsvDataScreen extends StatelessWidget {
  final String path;

  const LoadCsvDataScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSV DATA"),
      ),
      body: FutureBuilder(
        future: loadingCsvData(path),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          print(snapshot.data.toString());
          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: snapshot.data!
                        .map(
                          (data) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  data[0].toString(),
                                ),
                                Text(
                                  data[1].toString(),
                                ),
                                Text(
                                  data[2].toString(),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;

      final input = File(file.path!).openRead();
      final fields = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();

      print(fields);
    }
  }

  Future<List<List<dynamic>>> loadingCsvData(String path) async {
    final csvFile = File(path).openRead();
    return await csvFile
        .transform(utf8.decoder)
        .transform(
          const CsvToListConverter(),
        )
        .toList();
  }
}

*/

// import 'package:flutter/material.dart';
// import 'package:csv/csv.dart';

class LoadCsvDataScreen extends StatefulWidget {
  final String path;
  final int? accountId;
  const LoadCsvDataScreen({super.key, required this.path, this.accountId});

  @override
  State<LoadCsvDataScreen> createState() => _LoadCsvDataScreenState();
}

class _LoadCsvDataScreenState extends State<LoadCsvDataScreen> {
  List<List<dynamic>>? csvData;
  bool firstRowIsHeader = true;
  String? fieldMappingProfile;

  Future<List<List<dynamic>>> processCsv(String path) async {
    var result = File(path).readAsStringSync();
    // await DefaultAssetBundle.of(context).loadString(
    //   path,
    // );

    var list = const CsvToListConverter().convert(result);
    if (list.isEmpty || list.length < 3) {
      return const CsvToListConverter().convert(result, eol: '\n');
    }
    return list;
  }

  @override
  void initState() {
    processCsv(widget.path).then((result) {
      setState(() {
        csvData = result;
      });
    });
    super.initState();
  }

  void removeColumn(int index) {
    setState(() {
      if (csvData!.length >= index) {
        csvData?.map((row) {
          row.removeAt(index);
        }).toList();
      }
    });
  }

  void resetColumns() {
    processCsv(widget.path).then((result) {
      setState(() {
        csvData = result;
      });
    });
  }

  Future<List<Iterable<int>>> uploadData(List<List<dynamic>>? csvData,
      List<String> mappedColumns, int? accountId) async {
    if (csvData == null || csvData.isEmpty) {
      return [];
    }

    Data data = Data.fromList(csvData, mappedColumns, accountId);

    final accountBox = Hive.box<AccountModel>(BoxType.accounts.name);
    final categoryBox = Hive.box<CategoryModel>(BoxType.category.name);
    final expenseBox = Hive.box<ExpenseModel>(BoxType.expense.name);
    // await expenseBox.clear();
    // await categoryBox.clear();
    // await accountBox.clear();

    return Future.wait([
      expenseBox.addAll(data.expenses),
      categoryBox.addAll(data.categories),
      accountBox.addAll(data.accounts),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<String> expesneColumns = [
      "Amount",
      "Amount - Credit",
      "Amount - Debit",
      "Expense Name",
      "Description",
      "Date Time",
      "Date",
      "Time",
      "Account Number",
      "Account Type",
      "Category"
    ];

    List<String> csvColumns = [];

    if (csvData != null && csvData!.isNotEmpty) {
      if (firstRowIsHeader) {
        csvColumns = csvData!.first.map((e) => e.toString()).toList();
      } else {
        int columnsCount = csvData!.first.length;
        csvColumns = List.generate(columnsCount, (int index) {
          return 'Column ${index + 1}';
        });
      }
    }

    Box<dynamic> settings = getIt.get<Box<dynamic>>(
      instanceName: BoxType.settings.name,
    );
    const fieldMappingKey = "fieldMappingProfilesKey";
    Map<dynamic, dynamic> getFieldMappingConfigs() {
      Map<dynamic, dynamic> profiles =
          settings.get(fieldMappingKey, defaultValue: <dynamic, dynamic>{});
      return profiles;
    }

    final fieldMappingConfigs = getFieldMappingConfigs();
    if (fieldMappingProfile != null) {
      expesneColumns = fieldMappingConfigs[fieldMappingProfile];
    }

    return Scaffold(
      appBar: AppBar(
          title: Text("Csv reader - ${fieldMappingProfile ?? ""}"),
          actions: <Widget>[
            IconButton(
              tooltip: "Save column mappings",
              icon: const Icon(Icons.save),
              onPressed: () {
                showModalBottomSheet(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width >= 700
                        ? 700
                        : double.infinity,
                  ),
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  context: context,
                  builder: (_) => SaveFieldMappingPage(
                    fieldMappingList: expesneColumns,
                    settings: getIt.get<Box<dynamic>>(
                      instanceName: BoxType.settings.name,
                    ),
                    controller: TextEditingController(),
                  ),
                );
              },
            ),
            PopupMenuButton<dynamic>(
              icon: const Icon(Icons.settings),
              initialValue: fieldMappingProfile,
              // Callback that sets the selected popup menu item.
              onSelected: (dynamic item) {
                setState(() {
                  fieldMappingProfile = item.toString();
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<dynamic>>[
                ...fieldMappingConfigs.keys.map<PopupMenuItem<dynamic>>((e) {
                  return PopupMenuItem<dynamic>(
                    value: e,
                    child: Row(
                      children: [
                        //dwer4Icon(Icons.arrow_drop_down),
                        Text(e),
                        const Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: () {
                              paisaAlertDialog(
                                context,
                                title: Text(context.loc.dialogDeleteTitleLabel),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        "Deleting the configuration deletes all filed mapping list which tied to this configuration ",
                                    children: [
                                      TextSpan(
                                          text: e,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                                confirmationButton: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                  ),
                                  onPressed: () {
                                    fieldMappingConfigs.remove(e);
                                    fieldMappingProfile = null;
                                    settings
                                        .put(fieldMappingKey,
                                            fieldMappingConfigs)
                                        .then((value) {
                                      context.showMaterialSnackBar(
                                        "Delete successful",
                                      );
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text('Delete'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                    onTap: () {},
                  );
                })
              ],
              // child: Text(selectedMenu ?? "Select"),
            ),
          ]),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 1.2,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          child: ReorderableListWidget(
                        key: UniqueKey(),
                        title: "CSV Columns",
                        enableReorder: false,
                        itemList: csvColumns,
                        removeItemCallback: removeColumn,
                        resetCallback: resetColumns,
                      )),
                      Flexible(
                          child: ReorderableListWidget(
                              key: UniqueKey(),
                              title: "Exp Columns",
                              itemList: expesneColumns,
                              valueCallback: (List<String> items) {
                                expesneColumns = items;
                              })),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  color: Theme.of(context).cardColor,
                  child: CheckboxListTile(
                    title:
                        const Text("First row contains header"), //    <-- label
                    value: firstRowIsHeader,
                    onChanged: (bool? value) {
                      setState(() {
                        firstRowIsHeader = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: csvData == null
                  ? const CircularProgressIndicator()
                  : DataTableWidget(
                      csvData: csvData?.take(50).toList(),
                      firstRowHeader: firstRowIsHeader,
                    )),

          /*
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: csvData == null
                  ? const CircularProgressIndicator()
                  : DataTable(
                      columns: csvData![0]
                          .map(
                            (item) => DataColumn(
                              label: Text(
                                item.toString(),
                              ),
                            ),
                          )
                          .toList(),
                      rows: csvData!
                          .skip(1)
                          .map(
                            (csvrow) => DataRow(
                              cells: csvrow
                                  .map(
                                    (csvItem) => DataCell(
                                      Text(
                                        csvItem.toString(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
        */
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Upload'),
        icon: const Icon(Icons.upload),
        onPressed: () async {
          // csvData = await processCsv(widget.path);
          // setState(() {});

          if (firstRowIsHeader) {
            csvData?.removeAt(0);
          }

          if (csvData?.first.length != expesneColumns.length) {
            context.showMaterialSnackBar(
              'Column mapping list is mismatchig.',
            );
            return;
          }

          uploadData(csvData, expesneColumns, widget.accountId).then((value) {
            if (value.isEmpty) {
              context.showMaterialSnackBar(
                'Error while uploading file ',
              );
            } else {
              context.showMaterialSnackBar(
                "Upload successful",
              );
            }
            Navigator.pop(context);
          });
        },
      ),
    );
  }
}
