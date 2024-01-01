import 'package:flutter/material.dart';
import 'package:gratitude_diary/const/colors.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;

  const TodayBanner(
      {super.key, required this.selectedDay, required this.scheduleCount});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return Container(
      color: PRIMARY_COLOR,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일',
            style: textStyle,
          ),
          Text(
            '$scheduleCount개',
            style: textStyle,
          )
        ],
      ),
    );
  }
}
