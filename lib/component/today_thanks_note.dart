import 'package:flutter/material.dart';

class TodayThanksNote extends StatelessWidget {
  const TodayThanksNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.amber.shade100,
      child: const Column(
        children: [
          TextField(
            maxLines: null,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: '감사한 내용을 입력해주세요.',
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.favorite, color: Colors.pink),
              SizedBox(
                width: 200,
                height: 20,
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: '감사한 대상을 입력해주세요.',
                  ),
                  style: TextStyle(
                    fontSize: 10,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
