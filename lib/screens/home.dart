import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:gratitude_diary/component/diray_write.dart';
import 'package:gratitude_diary/database/drift_database.dart';
import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '0/5',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StreamBuilder<List<Diary>>(
                    stream: GetIt.I<LocalDatabase>().watchAllDiaryEntries(),
                    builder: (context, snapshot) {
                      print(snapshot.data);

                      final int itemCount = (snapshot.data?.length ?? 0) +
                          1; // 기존 항목 수에 1을 더해줍니다.
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: itemCount,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          if (index == itemCount - 1) {
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
                                const Text(
                                  '감사를 통해 사람은 부자가 된다. -디트리흐 본회퍼-',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            );
                          }
                          return Container(
                            width: double.infinity,
                            height: 70,
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${snapshot.data?[index].content}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '${snapshot.data?[index].tag}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
