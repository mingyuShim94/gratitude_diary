import 'package:flutter/material.dart';

class ThanksCard extends StatelessWidget {
  final String time;
  final int index;
  final String content;
  final String tag;

  const ThanksCard(
      {super.key,
      required this.time,
      required this.index,
      required this.content,
      required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          _ThankContent(index: index, content: content, tag: tag),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              time,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThankContent extends StatelessWidget {
  const _ThankContent({
    super.key,
    required this.index,
    required this.content,
    required this.tag,
  });

  final int index;
  final String content;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$index. ',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(content),
        ),
        _Tag(tag: tag),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String tag;

  const _Tag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        tag,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
