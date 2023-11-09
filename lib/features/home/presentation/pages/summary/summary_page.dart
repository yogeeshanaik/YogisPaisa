import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:paisa/features/home/presentation/cubit/summary/summary_cubit.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/summary_desktop_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/summary_mobile_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/summary_tablet_widget.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryCubit, SummaryState>(
      buildWhen: (previous, current) => current is TransactionsSuccessState,
      builder: (context, state) {
        if (state is TransactionsSuccessState) {
          return ScreenTypeLayout.builder(
            mobile: (p0) => SummaryMobileWidget(
                expenses: state.transactions,
                accountEntity: state.accountEntity),
            tablet: (p0) => SummaryTabletWidget(
                expenses: state.transactions,
                accountEntity: state.accountEntity),
            desktop: (p0) => SummaryDesktopWidget(
                expenses: state.transactions,
                accountEntity: state.accountEntity),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
