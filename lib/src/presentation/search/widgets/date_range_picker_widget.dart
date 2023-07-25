import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/presentation/home/bloc/home_bloc.dart';
import 'package:paisa/src/presentation/summary/controller/summary_controller.dart';

class DateRangePickerWidget extends StatelessWidget {
  const DateRangePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = getIt.get<HomeBloc>();
    return BlocBuilder(
      bloc: homeBloc,
      builder: (context, state) {
        return FloatingActionButton.small(
          onPressed: () =>
              _dateRangePicker(context), // _handleClick(state.currentPage),
          child: const Icon(Icons.date_range),
        );
      },
    );
  }

  Future<void> _dateRangePicker(BuildContext context) async {
    final SummaryController summaryController = getIt.get();
    DateTimeRange? dateTimeRange;
    final initialDateRange = DateTimeRange(
      start: summaryController.dateTimeRangeNotifier.value == null
          ? DateTime.now().subtract(const Duration(days: 3))
          : summaryController.dateTimeRangeNotifier.value!.start,
      end: summaryController.dateTimeRangeNotifier.value == null
          ? DateTime.now()
          : summaryController.dateTimeRangeNotifier.value!.end,
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime.now(),
      initialDateRange: dateTimeRange ?? initialDateRange,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (_, child) {
        return Theme(
          data: ThemeData.from(colorScheme: Theme.of(context).colorScheme)
              .copyWith(
            appBarTheme: Theme.of(context).appBarTheme,
          ),
          child: child!,
        );
      },
    );
    if (newDateRange == null || newDateRange == dateTimeRange) return;
    dateTimeRange = newDateRange;
    summaryController.dateTimeRangeNotifier.value = newDateRange;
  }
}
