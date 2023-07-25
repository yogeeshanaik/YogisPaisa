import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/core/common.dart';
import 'package:paisa/src/domain/expense/entities/expense.dart';
import 'package:paisa/src/presentation/accounts/bloc/accounts_bloc.dart';
import 'package:paisa/src/presentation/expense/bloc/expense_bloc.dart';
import 'package:paisa/src/presentation/home/bloc/home_bloc.dart';
import 'package:paisa/src/presentation/upload/loadCsvDataScreen.dart';
import 'package:paisa/src/presentation/widgets/paisa_bottom_sheet.dart';

class MoreMenuWidget extends StatelessWidget {
  final int accountId;
  const MoreMenuWidget({super.key, required this.accountId});

  loadCsvFromStorage(BuildContext context, int? accountId) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['csv'],
      type: FileType.custom,
    );
    if (result != null) {
      String? path = result!.files.first.path;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return LoadCsvDataScreen(
              path: path!,
              accountId: accountId,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String? selectedMenu;
    return BlocBuilder(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (context, state) {
        if (state is CurrentIndexState &&
            state.currentPage == PageType.accounts) {
          return PopupMenuButton<dynamic>(
            //.withOpacity(0.7),
            icon: const Icon(Icons.more_vert),
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (dynamic item) {
              selectedMenu = item.toString();
              if (selectedMenu == "Upload expenses") {
                loadCsvFromStorage(context, accountId);
              } else if (selectedMenu == "Delete all expenses") {
                paisaAlertDialog(
                  context,
                  title: Text(context.loc.dialogDeleteTitleLabel),
                  child: RichText(
                    text: TextSpan(
                      text:
                          "Are you sure you want to delete all expenses list which tied to this account ",
                      children: const [
                        TextSpan(
                            text: "Account name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  confirmationButton: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onPressed: () {
                      final ExpenseBloc expenseBloc = getIt.get<ExpenseBloc>();
                      final AccountsBloc accountBloc =
                          getIt.get<AccountsBloc>();
                      final List<Expense> expenses =
                          accountBloc.fetchExpenseFromAccountId(accountId);
                      for (var e in expenses) {
                        expenseBloc
                            .add(ClearExpenseEvent(e.superId.toString()));
                      }
                      context.showMaterialSnackBar(
                        "Delete successful",
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Delete'),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: "Upload expenses",
                child: Row(
                  children: <Widget>[
                    Icon(Icons.upload_file),
                    Text('Upload expenses'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: "Delete all expenses",
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    Text('Delete all expenses'),
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
