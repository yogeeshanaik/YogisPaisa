import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:paisa/src/data/expense/model/expense_model.dart';
import 'package:paisa/src/domain/expense/entities/expense.dart';
import 'package:paisa/src/presentation/category/widgets/tag_suggestion_widget.dart';
import 'package:paisa/src/presentation/summary/widgets/expense_list_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../main.dart';
import '../../../../core/common.dart';
import '../../../summary/widgets/expense_month_card.dart';
import '../../../widgets/paisa_big_button_widget.dart';
import '../../../widgets/paisa_text_field.dart';
import '../../bloc/category_tag_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AddCategoryTagPage extends StatefulWidget {
  const AddCategoryTagPage({
    Key? key,
    required this.categoryId,
    this.categoryTagId,
  }) : super(key: key);

  final String? categoryId;
  final String? categoryTagId;

  @override
  State<AddCategoryTagPage> createState() => _AddCategoryTagPageState();
}

class _AddCategoryTagPageState extends State<AddCategoryTagPage> {
  late final bool isAddCategoryTag = widget.categoryTagId == null;
  late final categoryTagBloc = getIt.get<CategoryTagBloc>()
    ..add(FetchCategoryTagFromIdEvent(widget.categoryTagId));

  final categoryTagController = TextEditingController();

  @override
  void dispose() {
    categoryTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryTagBloc,
      child: BlocConsumer(
        bloc: categoryTagBloc,
        listener: (context, state) {
          if (state is CategoryTagAddedState) {
            context.showMaterialSnackBar(
              isAddCategoryTag
                  ? context.loc.successAddCategoryLabel
                  : context.loc.updatedCategoryLabel,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            );
            context.pop();
          } else if (state is CategoryTagErrorState) {
            context.showMaterialSnackBar(
              state.errorString,
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              color: Theme.of(context).colorScheme.onErrorContainer,
            );
          } else if (state is CategoryTagSuccessState) {
            categoryTagController.text = state.categoryTag.name;
            categoryTagController.selection = TextSelection.collapsed(
              offset: state.categoryTag.name.length,
            );
          }
        },
        builder: (context, state) {
          List<Expense> expenses = [];
          if (!isAddCategoryTag)
            expenses = getIt
                .get<Box<ExpenseModel>>()
                .listenable()
                .value
                .search(categoryTagController.text.toLowerCase());
          return ScreenTypeLayout(
            mobile: Scaffold(
              appBar: appBar(),
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //const SizedBox(height: 16),
                            CategoryTagNameWidget(
                                controller: categoryTagController),
                            // const SizedBox(height: 16),
                            // CategoryTagsWidget(
                            //   categoryId:
                            //       (int.tryParse(widget.categoryId ?? '') ?? -1),
                            // ),

                            TagSuggestionWidget(
                                categoryId: int.parse(widget.categoryId!)),

                            if (!isAddCategoryTag)
                              ExpenseMonthCardWidget(
                                title: categoryTagController.text,
                                total: expenses.totalExpense,
                                expenses: expenses,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PaisaBigButton(
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();
                      if (!isValid) {
                        return;
                      }
                      BlocProvider.of<CategoryTagBloc>(context).categoryId =
                          int.parse(widget.categoryId!);
                      BlocProvider.of<CategoryTagBloc>(context)
                          .add(AddOrUpdateCategoryTagEvent(isAddCategoryTag));
                    },
                    title: isAddCategoryTag
                        ? context.loc.addTagLabel
                        : context.loc.updateLabel,
                  ),
                ),
              ),
            ),
            tablet: Scaffold(
              appBar: context.materialYouAppBar(
                isAddCategoryTag
                    ? context.loc.addTagLabel
                    : context.loc.updateTagLabel,
              ),
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PaisaBigButton(
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();
                      if (!isValid) {
                        return;
                      }

                      BlocProvider.of<CategoryTagBloc>(context)
                          .add(AddOrUpdateCategoryTagEvent(isAddCategoryTag));
                    },
                    title: isAddCategoryTag
                        ? context.loc.addTagLabel
                        : context.loc.updateLabel,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CategoryTagNameWidget(
                                controller: categoryTagController),
                            TagSuggestionWidget(
                                categoryId: int.parse(widget.categoryId!)),
                            ExpenseListWidget(
                              expenses: getIt
                                  .get<Box<ExpenseModel>>()
                                  .listenable()
                                  .value
                                  .search(categoryTagController.text),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar appBar() {
    return context.materialYouAppBar(
      isAddCategoryTag
          ? context.loc.categoryTagLabel
          : context.loc.updateTagLabel,
      actions: [
        isAddCategoryTag
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: () {
                  categoryTagBloc.add(CategoryTagDeleteEvent(
                      categoryTagBloc.getCategoryTagUseCase(
                          int.parse(widget.categoryTagId!))!));
                },
                icon: Icon(
                  Icons.delete_rounded,
                  color: Theme.of(context).colorScheme.error,
                ),
              )
      ],
    );
  }
}

class CategoryTagNameWidget extends StatelessWidget {
  const CategoryTagNameWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PaisaTextFormField(
      controller: controller,
      hintText: context.loc.enterTagLabel,
      keyboardType: TextInputType.name,
      onChanged: (value) =>
          BlocProvider.of<CategoryTagBloc>(context).categoryTitle = value,
      validator: (value) {
        if (value!.isNotEmpty) {
          return null;
        } else {
          return context.loc.validNameLabel;
        }
      },
    );
  }
}
