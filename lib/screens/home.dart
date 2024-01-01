import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  String textContent = ""; // 감사한 내용을 저장할 변수
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        textContent = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  contentPadding: const EdgeInsets.all(0),
                  content: Container(
                    padding: const EdgeInsets.all(20),
                    width: 400,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(color: Colors.amber, width: 5),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '감사한 내용',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 300,
                          height: 100,
                          color: Colors.white,
                          child: TextField(
                            maxLines: null,
                            decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none),
                            controller: _controller,
                            onChanged: (text) {
                              setState(() {
                                textContent = text;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          '감사한 대상',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.white, filled: true),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          },
          child: Container(
            width: 200,
            height: 100,
            decoration: const BoxDecoration(color: Colors.blueGrey),
            child: Center(
              child: Text(
                textContent,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
