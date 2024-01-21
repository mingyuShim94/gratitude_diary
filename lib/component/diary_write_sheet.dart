import 'package:flutter/material.dart';

class DiaryWriteSheet extends StatelessWidget {
  const DiaryWriteSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: MediaQuery.of(context).size.height * 0.3),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        color: Colors.white,
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
              Expanded(
                child: TextField(
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  cursorColor: Colors.grey.shade400,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: '감사한 내용을 입력해주세요.',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.grey.shade400,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade300,
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
    );
  }
}
