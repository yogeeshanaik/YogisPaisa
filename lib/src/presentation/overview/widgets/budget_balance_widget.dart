import 'package:flutter/material.dart';
import '../../summary/widgets/total_balance_widget.dart';
import '../../widgets/paisa_card.dart';
import 'budget_balance_for_month_widget.dart';

class BudgetBalanceWidget extends StatelessWidget {
  const BudgetBalanceWidget({
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: PaisaCard(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TotalBalanceWidget(
                    title: "Budget Balance", //context.loc.totalBalanceLabel,
                    amount: budgetBalance,
                  ),
                  const SizedBox(height: 15),
                  BudgetBalanceForMonthWidget(
                    totalBudget: totalBudget,
                    totalExpense: totalExpense,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TouchCard extends StatefulWidget {
  final Widget child;

  const TouchCard({super.key, required this.child});

  @override
  _TouchCardState createState() => _TouchCardState();
}

class _TouchCardState extends State<TouchCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    // Create the animation tween
    _animation = Tween<double>(begin: 1, end: 1.05).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _controller.forward(from: 1);
      },
      onTapCancel: () {
        _controller.reverse(from: 1.05);
      },
      onTapUp: (TapUpDetails details) {
        _controller.reverse(from: 1);
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
