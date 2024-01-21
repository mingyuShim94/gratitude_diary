import 'package:flutter/material.dart';
import 'package:gratitude_diary/component/diary_section.dart';
import 'package:gratitude_diary/component/energy_status_section.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          EnergyStatusSection(),
          DiarySection(),
        ],
      ),
    );
  }
}
