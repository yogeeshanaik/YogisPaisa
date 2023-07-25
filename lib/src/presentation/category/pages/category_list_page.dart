import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/src/core/enum/box_types.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../main.dart';
import '../../../core/common.dart';
import '../../../data/category/model/category_model.dart';
import '../../../domain/category/entities/category.dart';
import '../../widgets/paisa_empty_widget.dart';
import '../bloc/category_bloc.dart';
import 'category_list_mobile_page.dart';
import 'category_list_tablet_page.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  addDefaultCategories() {
    Map<String, dynamic> jsonData = {
      "categories": [
        {
          "name": "Default",
          "description": "All expenses",
          "icon": 983772,
          "superId": 0,
          "budget": 0.0,
          "color": 4278238420
        },
        {
          "name": "Food - Groceries",
          "description":
              "Food: 10  20%\ngroceries / personal care / baby needs",
          "icon": 983311,
          "superId": 1,
          "budget": 500.0,
          "color": 4294940672
        },
        {
          "name": "Shopping - Clothing",
          "description": "Clothing: 3  5%\nfor all members of the family",
          "icon": 984383,
          "superId": 2,
          "budget": 200.0,
          "color": 4280391411
        },
        {
          "name": "Transportation (10-15 percent)",
          "description":
              "Transportation: 15  20%\nbus / taxi / fuel / insurance / maintenance / parking",
          "icon": 986943,
          "superId": 3,
          "budget": 0.0,
          "color": 4293467747
        },
        {
          "name": "Housing (25-35 percent)",
          "description":
              "Housing: 35%\nmortgage / taxes / strata / rent/ insurance / hydro",
          "icon": 986390,
          "superId": 4,
          "budget": 2400.0,
          "color": 4294198070
        },
        {
          "name": "Utilities (5-10 percent)",
          "description":
              "Utilities: 5%\nphone / cell phone / gas / cable / internet\n",
          "icon": 984489,
          "superId": 5,
          "budget": 80.0,
          "color": 4280391411
        },
        {
          "name": "Medical (5-10 percent)",
          "description":
              "Medical: 3%\nhealth care premiums / specialists / over-the-counter",
          "icon": 984281,
          "superId": 6,
          "budget": 0.0,
          "color": 4284513675
        },
        {
          "name": "Debt Payments",
          "description":
              "Debt Payments: 5  15%\nMany people find that their budget is quite tight because their monthly debt payments are closer to 25% of their net income.",
          "icon": 989841,
          "superId": 7,
          "budget": 600.0,
          "color": 4291681337
        },
        {
          "name": "Saving, Investing",
          "description":
              "Savings: 5  10%\nPlan to save money for expenses that dont occur every month, as well as for your future. Then youll have a little extra available when you need it.",
          "icon": 988394,
          "superId": 8,
          "budget": 1100.0,
          "color": 4278228616
        },
        {
          "name": "Personal Spending (5-10 percent)",
          "description":
              "Personal & Discretionary: 5  10%\nentertainment / recreation / tobacco/alcohol / eating out / gaming / hair cuts / hobbies",
          "icon": 984562,
          "superId": 9,
          "budget": 200.0,
          "color": 4288423856
        },
        {
          "name": "Entertainment (5-10 percent)",
          "description": "Recreation & Entertainment (5-10 percent)",
          "icon": 983317,
          "superId": 10,
          "budget": 100.0,
          "color": 4293467747
        },
        {
          "name": "Income",
          "description": "Salary, Any refunds",
          "icon": 983317,
          "superId": 11,
          "budget": 100.0,
          "color": 4293467747
        },
      ]
    };

    List<CategoryModel> categories = List<CategoryModel>.from(
        jsonData["categories"]?.map((x) => CategoryModel.fromJson(x)));

    final categoryBox = Hive.box<CategoryModel>(BoxType.category.name);

    categories.removeWhere((element) => categoryBox.values.contains(element));

    return Future.wait([
      categoryBox.addAll(categories),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = getIt.get<CategoryBloc>();
    return Scaffold(
      body: ValueListenableBuilder<Box<CategoryModel>>(
        valueListenable: getIt.get<Box<CategoryModel>>().listenable(),
        builder: (BuildContext context, value, Widget? child) {
          final List<Category> categories = value.values.toEntities();
          if (categories.isEmpty) {
            return Column(
              children: [
                EmptyWidget(
                  title: context.loc.emptyCategoriesLabel,
                  description: context.loc.emptyCategoriesDescriptionLabel,
                  icon: Icons.category,
                ),
                TextButton(
                    onPressed: () => addDefaultCategories(),
                    child: const Text("Add default categories"))
              ],
            );
          }
          return ScreenTypeLayout(
            breakpoints: const ScreenBreakpoints(
              tablet: 600,
              desktop: 700,
              watch: 300,
            ),
            mobile: CategoryListMobileWidget(
              addCategoryBloc: bloc,
              categories: categories,
            ),
            tablet: CategoryListTabletWidget(
              addCategoryBloc: bloc,
              crossAxisCount: 3,
              categories: categories,
            ),
            desktop: CategoryListTabletWidget(
              addCategoryBloc: bloc,
              crossAxisCount: 5,
              categories: categories,
            ),
          );
        },
      ),
    );
  }
}
