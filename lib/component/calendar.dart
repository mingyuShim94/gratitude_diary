import 'package:flutter/material.dart';
import 'package:gratitude_diary/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;

  const Calendar(
      {super.key,
      this.selectedDay,
      required this.focusedDay,
      required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(6),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey.shade600,
      fontWeight: FontWeight.bold,
    );
    return SafeArea(
      child: TableCalendar(
          locale: 'ko_KR',
          focusedDay: focusedDay,
          firstDay: DateTime(1800),
          lastDay: DateTime(3000),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          calendarStyle: CalendarStyle(
            isTodayHighlighted: false,
            defaultDecoration: defaultBoxDeco,
            weekendDecoration: defaultBoxDeco,
            selectedDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: PRIMARY_COLOR,
                width: 1,
              ),
            ),
            outsideDecoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            defaultTextStyle: defaultTextStyle,
            weekendTextStyle: defaultTextStyle,
            selectedTextStyle: defaultTextStyle.copyWith(
              color: PRIMARY_COLOR,
            ),
          ),
          onDaySelected: onDaySelected,
          selectedDayPredicate: (DateTime date) {
            if (selectedDay == null) return false;

            return date.year == selectedDay!.year &&
                date.month == selectedDay!.month &&
                date.day == selectedDay!.day;
          }),
    );
  }
}
