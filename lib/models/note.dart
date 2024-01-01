class Note {
  final int id;
  final String content;
  final String tag;
  final String time;

  Note(
      {required this.id,
      required this.content,
      required this.tag,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'tag': tag,
      'time': time,
    };
  }
}
