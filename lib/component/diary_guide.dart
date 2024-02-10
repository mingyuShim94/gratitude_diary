import 'package:flutter/material.dart';
import 'package:gratitude_diary/component/diray_write.dart';

class DiaryGuide extends StatelessWidget {
  const DiaryGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const DiaryWrite();
              },
            );
          },
          child: Container(
            width: double.infinity,
            height: 70,
            color: Colors.amber,
            child: const Center(
              child: Text(
                '오늘 감사한 것을 적어보세요.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 70,
          color: Colors.amber,
          child: const Center(
            child: Text(
              '감사를 통해 사람은 부자가 된다. -디트리흐 본회퍼-',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
