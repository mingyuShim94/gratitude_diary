import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:drift/drift.dart' show Value;
import 'package:gratitude_diary/database/drift_database.dart';

class DiaryWrite extends StatefulWidget {
  const DiaryWrite({super.key});

  @override
  State<DiaryWrite> createState() => _DiaryWriteState();
}

class _DiaryWriteState extends State<DiaryWrite> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? content;
  String? tag;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        width: 400,
        height: 400,
        decoration: const BoxDecoration(color: Colors.green),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.purpleAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '감사노트 작성하기',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.yellow,
                        child: TextFormField(
                          onSaved: (newValue) => content = newValue!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '내용을 입력해주세요.';
                            }
                            return null;
                          },
                          maxLines: 7,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '감사한 것을 적어주세요.',
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.tealAccent,
                        child: TextFormField(
                          onSaved: (newValue) => tag = newValue!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '내용을 입력해주세요.';
                            }
                            return null;
                          },
                          maxLines: 7,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '감사한 대상을 적어주세요.',
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.lightGreenAccent,
                child: ElevatedButton(
                  onPressed: () {
                    savePressed();
                  },
                  child: const Text(
                    '저장하기',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void savePressed() async {
    //formKey 선언관련 버그방지
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print('savePressed!');
      print('content: $content');
      print('tag: $tag');

      final key = await GetIt.I<LocalDatabase>().createDiaryEntry(
        DiarysCompanion(
          content: Value(content!),
          tag: Value(tag!),
        ),
      );
      print('Save완료: $key');
      if (!mounted) return;
      Navigator.of(context).pop();
    } else {
      print('not validated');
    }
  }
}
