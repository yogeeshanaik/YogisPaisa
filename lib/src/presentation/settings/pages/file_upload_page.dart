import 'package:flutter/material.dart';
// import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:paisa/src/core/enum/box_types.dart';
import 'package:paisa/src/core/enum/tran_source.dart';
import 'package:paisa/src/presentation/settings/widgets/settings_group_card.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../main.dart';
import '../../../core/common.dart';
import '../../../data/settings/file_handler.dart';

import 'package:hive/hive.dart';

class FileUploadPage extends StatelessWidget {
  const FileUploadPage({super.key});

  Future<List<Iterable<int>>> _selectedFileAndUploadData() async {
    final FileHandler fileHandler = getIt.get<FileHandler>();
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    var statusManageExternalStorage =
        await Permission.manageExternalStorage.request();
    // if (statusManageExternalStorage.isGranted &&
    //     androidInfo.version.sdkInt > 29) {
    //   return fileHandler.importFromFile();
    // } else if (androidInfo.version.sdkInt < 30) {
    return fileHandler.importFromFile();
    // }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final currentSource = TranSource.values[getIt
        .get<Box<dynamic>>(instanceName: BoxType.settings.name)
        .get(tranSourceKey, defaultValue: 0)];

    return Material(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text(
              "Transaction upload",
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ChooseTranSourceWidget(
                  currentSource: currentSource,
                ),
                SettingsGroup(
                  title: "CSV upload",
                  options: [
                    const ListTile(
                      title: Text("The file should be csv."),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor:
                                    Theme.of(context).colorScheme.primary,
                                elevation: 0,
                                padding: const EdgeInsets.all(10),
                              ),
                              onPressed: () {
                                _selectedFileAndUploadData().then((value) {
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
                              label: const Text("Upload"),
                              icon: const Icon(MdiIcons.fileImport),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChooseTranSourceWidget extends StatefulWidget {
  const ChooseTranSourceWidget({
    Key? key,
    required this.currentSource,
  }) : super(key: key);
  final TranSource currentSource;

  @override
  ChooseTranSourceWidgetState createState() => ChooseTranSourceWidgetState();
}

class ChooseTranSourceWidgetState extends State<ChooseTranSourceWidget> {
  late TranSource currentIndex = widget.currentSource;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              "Select source",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...TranSource.values
              .map(
                (e) => RadioListTile(
                  value: e,
                  activeColor: Theme.of(context).colorScheme.primary,
                  groupValue: currentIndex,
                  onChanged: (TranSource? value) {
                    currentIndex = value!;
                    setState(() {
                      getIt
                          .get<Box<dynamic>>(
                              instanceName: BoxType.settings.name)
                          .put(tranSourceKey, currentIndex.index);
                    });
                  },
                  title: Text(
                    e.sourceName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
