import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:gratitude_diary/models/diary.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [Diarys],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  //감사노트 저장
  Future<int> createDiaryEntry(DiarysCompanion entry) =>
      into(diarys).insert(entry);

  Future<List<Diary>> getAllDiaryEntries() => select(diarys).get();

  Stream<List<Diary>> watchAllDiaryEntries() => select(diarys).watch();
  Stream<List<Diary>> watchDiaryEntriesByDate(DateTime date) => (select(diarys)
        ..where((tbl) =>
            tbl.createdAt.year.equals(date.year) &
            tbl.createdAt.month.equals(date.month) &
            tbl.createdAt.day.equals(date.day)))
      .watch();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db2.sqlite'));
    return NativeDatabase(file);
  });
}
