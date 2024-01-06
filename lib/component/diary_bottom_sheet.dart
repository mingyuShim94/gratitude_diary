import 'package:flutter/material.dart';

class DiaryBottomSheet extends StatelessWidget {
  const DiaryBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 180),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: bottomInset,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              children: [
                const Text(
                  '100번째 감사일기',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  cursorColor: Colors.grey.shade400,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: '감사한 내용을 입력해주세요.',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  cursorColor: Colors.grey.shade400,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: '감사한 대상을 입력해주세요.',
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade400,
                        ),
                        child: const Text('취소'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
