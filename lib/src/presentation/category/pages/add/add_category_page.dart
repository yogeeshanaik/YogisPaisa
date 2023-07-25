import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../main.dart';
import '../../../../core/common.dart';
import '../../../settings/bloc/settings_controller.dart';
import '../../../widgets/paisa_big_button_widget.dart';
import '../../../widgets/paisa_color_picker.dart';
import '../../../widgets/paisa_text_field.dart';
import '../../bloc/category_bloc.dart';
import '../../widgets/category_tags_widget.dart';
import '../../widgets/color_picker_widget.dart';
import '../../widgets/category_icon_picker_widget.dart';
import '../../widgets/set_budget_widget.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({
    Key? key,
    this.categoryId,
  }) : super(key: key);

  final String? categoryId;

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  late final bool isAddCategory = widget.categoryId == null;
  late final categoryBloc = getIt.get<CategoryBloc>()
    ..add(FetchCategoryFromIdEvent(widget.categoryId));
  final budgetController = TextEditingController();
  final categoryController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    budgetController.dispose();
    categoryController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryBloc,
      child: BlocConsumer(
        bloc: categoryBloc,
        listener: (context, state) {
          if (state is CategoryAddedState) {
            context.showMaterialSnackBar(
              isAddCategory
                  ? context.loc.successAddCategoryLabel
                  : context.loc.updatedCategoryLabel,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            );
            context.pop();
          } else if (state is CategoryErrorState) {
            context.showMaterialSnackBar(
              state.errorString,
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              color: Theme.of(context).colorScheme.onErrorContainer,
            );
          } else if (state is CategorySuccessState) {
            budgetController.text = state.category.budget.toString();
            budgetController.selection = TextSelection.collapsed(
              offset: state.category.budget.toString().length,
            );

            categoryController.text = state.category.name;
            categoryController.selection = TextSelection.collapsed(
              offset: state.category.name.length,
            );

            descController.text = state.category.description ?? '';
            descController.selection = TextSelection.collapsed(
              offset: state.category.description?.length ?? 0,
            );
          }
        },
        builder: (context, state) {
          return ScreenTypeLayout(
            mobile: Scaffold(
              appBar: appBar(),
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CategoryIconPickerWidget(),
                      SetBudgetWidget(controller: budgetController),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onTap: () {
                          paisaColorPicker(context,
                                  defaultColor: categoryBloc.selectedColor ??
                                      Colors.red.value)
                              .then((color) {
                            BlocProvider.of<CategoryBloc>(context)
                                .add(CategoryColorSelectedEvent(color));
                          });
                        },
                        leading: Icon(
                          Icons.color_lens,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(context.loc.pickColorLabel),
                        subtitle: Text(context.loc.pickColorDescLabel),
                        trailing: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(
                                categoryBloc.selectedColor ?? Colors.red.value),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),
                            CategoryNameWidget(controller: categoryController),
                            const SizedBox(height: 16),
                            CategoryDescriptionWidget(
                                controller: descController),
                            const SizedBox(height: 16),
                            CategoryDefaultSwitchWidget(
                              categoryId:
                                  int.tryParse(widget.categoryId ?? '') ?? -1,
                            ),
                            CategoryTagsWidget(
                              categoryId:
                                  int.tryParse(widget.categoryId ?? '') ?? -1,
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

                      BlocProvider.of<CategoryBloc>(context)
                          .add(AddOrUpdateCategoryEvent(isAddCategory));
                    },
                    title: isAddCategory
                        ? context.loc.addCategoryLabel
                        : context.loc.updateLabel,
                  ),
                ),
              ),
            ),
            tablet: Scaffold(
              appBar: context.materialYouAppBar(
                isAddCategory
                    ? context.loc.addCategoryLabel
                    : context.loc.updateCategoryLabel,
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

                      BlocProvider.of<CategoryBloc>(context)
                          .add(AddOrUpdateCategoryEvent(isAddCategory));
                    },
                    title: isAddCategory
                        ? context.loc.addCategoryLabel
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
                          children: [
                            const CategoryIconPickerWidget(),
                            SetBudgetWidget(controller: budgetController),
                            ColorPickerWidget(categoryBloc: categoryBloc),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CategoryNameWidget(controller: categoryController),
                            const SizedBox(height: 24),
                            CategoryDescriptionWidget(
                                controller: descController),
                            const SizedBox(height: 24),
                            CategoryDefaultSwitchWidget(
                              categoryId:
                                  int.tryParse(widget.categoryId ?? '') ?? -1,
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
      isAddCategory
          ? context.loc.addCategoryLabel
          : context.loc.updateCategoryLabel,
    );
  }
}

class CategoryNameWidget extends StatelessWidget {
  const CategoryNameWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PaisaTextFormField(
      controller: controller,
      hintText: context.loc.enterCategoryLabel,
      keyboardType: TextInputType.name,
      onChanged: (value) =>
          BlocProvider.of<CategoryBloc>(context).categoryTitle = value,
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

class CategoryDescriptionWidget extends StatelessWidget {
  const CategoryDescriptionWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PaisaTextFormField(
      controller: controller,
      hintText: context.loc.enterDescriptionLabel,
      keyboardType: TextInputType.name,
      onChanged: (value) =>
          BlocProvider.of<CategoryBloc>(context).categoryDesc = value,
    );
  }
}

class CategoryDefaultSwitchWidget extends StatefulWidget {
  const CategoryDefaultSwitchWidget({
    super.key,
    required this.categoryId,
  });
  final int categoryId;

  @override
  State<CategoryDefaultSwitchWidget> createState() =>
      _CategoryDefaultSwitchWidgetState();
}

class _CategoryDefaultSwitchWidgetState
    extends State<CategoryDefaultSwitchWidget> {
  final SettingsController settingsController = getIt.get();
  late bool isCategoryDefault =
      settingsController.defaultCategoryId == widget.categoryId;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Default category'),
      value: isCategoryDefault,
      onChanged: (value) {
        if (value) {
          settingsController.setDefaultCategoryId(widget.categoryId);
        } else {
          settingsController.setDefaultCategoryId(-1);
        }
        setState(() {
          isCategoryDefault = value;
        });
      },
    );
  }
}
