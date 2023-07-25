import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/common.dart';
import '../../../core/theme/custom_color.dart';

class BudgetBalanceForMonthWidget extends StatelessWidget {
  const BudgetBalanceForMonthWidget({
    Key? key,
    required this.totalBudget,
    required this.totalExpense,
  }) : super(key: key);

  final double totalBudget;
  final double totalExpense;

  double get budgetBalance {
    return totalBudget - totalExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        budgetBalance > 0
            ? Text(
                "You're still within budget",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.green,
                    ),
              )
            : Text(
                "You exceeded budget",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '⬥',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .extension<CustomColors>()!
                                .blue,
                          ),
                      children: [
                        TextSpan(
                          text: context.loc.budgetLabel,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    totalBudget.toCurrency(),
                    style: GoogleFonts.manrope(
                      textStyle:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '▲',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .extension<CustomColors>()!
                                .red,
                          ),
                      children: [
                        TextSpan(
                          text: context.loc.expenseLabel,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '-${totalExpense.toCurrency()}',
                    style: GoogleFonts.manrope(
                      textStyle:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
