import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gratitude_diary/database/drift_database.dart';
import 'package:drift/drift.dart' show Value;

class EnergyStatusSection extends StatefulWidget {
  const EnergyStatusSection({
    super.key,
  });

  @override
  State<EnergyStatusSection> createState() => _EnergyStatusSectionState();
}

class _EnergyStatusSectionState extends State<EnergyStatusSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  String? content;
  String? tag;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.amber,
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.all(0),
                      content: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Text(
                                '오늘의 감사노트',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  onSaved: (String? val) {
                                    content = val;
                                  },
                                  validator: (String? val) {
                                    if (val == null || val.isEmpty) {
                                      return '내용을 입력해주세요.';
                                    }
                                    return null;
                                  },
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
                              TextFormField(
                                maxLength: 5,
                                onSaved: (String? val) {
                                  tag = val;
                                },
                                cursorColor: Colors.grey.shade400,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey.shade300,
                                  hintText: '감사한 대상을 입력해주세요.',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              onSaveButton(context)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: StreamBuilder<List<Diary>>(
                  stream:
                      GetIt.I<LocalDatabase>().watchDiaryEntriesByDate(date),
                  builder: (context, snapshot) {
                    final double iconSize;
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data!.isEmpty) {
                      iconSize = 50;
                    } else {
                      iconSize = min(300, 50 + snapshot.data!.length * 50);
                    }
                    print('iconSize: $iconSize');
                    return Icon(
                      Icons.favorite,
                      size: iconSize,
                      color: Colors.pink,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Row onSaveButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onSavePressed(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade400,
            ),
            child: const Text(
              '저장하기',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }

  void onSavePressed(BuildContext context) async {
    // formKey는 생성을 했는데
    // Form 위젯과 결합을 안했을때
    if (_formKey.currentState == null) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      print('에러가없다.');
      _formKey.currentState!.save();
      print('--------------------');
      print('content: $content');
      print('tag: $tag');

      final key = await GetIt.I<LocalDatabase>().createDiaryEntry(
        DiarysCompanion(
          content: Value(content!),
          tag: Value(tag!),
        ),
      );
      print('save완료: $key');
      Navigator.pop(context);
    } else {
      print('에러가있다.');
    }
  }
}
