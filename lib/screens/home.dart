import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              contentPadding: const EdgeInsets.all(0),
                              content: Container(
                                width: 400,
                                height: 400,
                                decoration:
                                    const BoxDecoration(color: Colors.green),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          color: Colors.purpleAccent,
                                          child: const Text('감사노트 작성하기',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ))),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        color: Colors.yellow,
                                        child: const TextField(
                                          maxLines: 7,
                                          decoration: InputDecoration(
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
                                        color: Colors.tealAccent,
                                        child: const TextField(
                                          maxLines: 7,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: '감사한 대상을 적어주세요.',
                                            alignLabelWithHint: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.lightGreenAccent,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
