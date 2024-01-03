import 'package:flutter/material.dart';
import 'package:gratitude_diary/component/calendar.dart';
import 'package:gratitude_diary/component/thanks_card.dart';
import 'package:gratitude_diary/component/today_banner.dart';
import 'package:table_calendar/table_calendar.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Calendar(
          selectedDay: selectedDay,
          focusedDay: focusedDay,
          onDaySelected: onDaySelected,
        ),
        const SizedBox(height: 8),
        TodayBanner(selectedDay: selectedDay, scheduleCount: 3),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ThanksCard(
              time: '10:23', index: 1, content: '토마토라멘 맛있어서 감사합니다.', tag: '음식'),
        )
      ],
    ));
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}
