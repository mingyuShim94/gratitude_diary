import 'package:flutter/material.dart';
import 'package:gratitude_diary/component/today_thanks_note.dart';

class AnimatedThanksSheet extends StatelessWidget {
  final bool selected;

  const AnimatedThanksSheet({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: AnimatedContainer(
          width: 350,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber.shade200,
          ),
          transform: Matrix4.translationValues(
            selected ? 0 : 0, // X 좌표 변경
            selected ? 0 : 600, // Y 좌표 변경
            0, // Z 좌표 변경 (0으로 유지)
          ),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: const Column(
            children: [
              Text('2024년 1월 6일'),
              TodayThanksNote(),
            ],
          ),
        ),
      ),
    );
  }
}
