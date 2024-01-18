import 'package:flutter/material.dart';
import 'package:gratitude_diary/component/diary_bottom_sheet.dart';
import 'package:gratitude_diary/component/animated_thanks_sheet.dart';

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

  double containerHeight = 100.0; // 콘테이너 높이 초기값 설정
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // setState(() {
          //   selected = !selected;
          // });
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home_background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  // setState(() {
                  //   selected = !selected;
                  // });
                },
                // child: AnimatedThanksSheet(selected: selected),
              ),
            ),
            Positioned(
              top: 80,
              left: 60,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(color: Colors.amber, width: 5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            AnimatedThanksSheet(selected: selected)
          ],
        ),
      ),
    );
  }
// Center(
//         child: GestureDetector(
//           onTap: () => {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   contentPadding: const EdgeInsets.all(0),
//                   content: Container(
//                     padding: const EdgeInsets.all(20),
//                     width: 400,
//                     height: 300,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                       border: Border.all(color: Colors.amber, width: 5),
//                     ),
//                     child: Column(
//                       children: [
//                         const Text(
//                           '감사한 내용',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         Container(
//                           width: 300,
//                           height: 100,
//                           color: Colors.white,
//                           child: TextField(
//                             maxLines: null,
//                             decoration: const InputDecoration(
//                                 fillColor: Colors.white,
//                                 filled: true,
//                                 border: InputBorder.none),
//                             controller: _controller,
//                             onChanged: (text) {
//                               setState(() {
//                                 textContent = text;
//                               });
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         const Text(
//                           '감사한 대상',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         const TextField(
//                           decoration: InputDecoration(
//                               fillColor: Colors.white, filled: true),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )
//           },
//           child: Container(
//             width: 200,
//             height: 100,
//             decoration: const BoxDecoration(color: Colors.blueGrey),
//             child: Center(
//               child: Text(
//                 textContent,
//                 style: const TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//       ),

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return const DiaryBottomSheet();
          },
        );
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.edit),
    );
  }
}
