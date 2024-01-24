import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gratitude_diary/database/drift_database.dart';

class DiarySection extends StatefulWidget {
  const DiarySection({
    super.key,
  });

  @override
  State<DiarySection> createState() => _DiarySectionState();
}

class _DiarySectionState extends State<DiarySection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? content;
  String? tag;
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        color: Colors.blue,
        child: StreamBuilder<List<Diary>>(
            stream: GetIt.I<LocalDatabase>().watchDiaryEntriesByDate(date),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return const Center(child: Text('데이터가 없습니다.'));
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return GestureDetector(
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
                                    Text(
                                      '${index + 1}번째 감사일기',
                                      style: const TextStyle(
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
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${index + 1}번째 감사일기'),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                snapshot.data![index].content,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(snapshot.data![index].tag)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

  Row onSaveButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onSavePressed();
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

  void onSavePressed() async {
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
    } else {
      print('에러가있다.');
    }
  }
}
