import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'datas.g.dart';

@DataClassName('RecordsClass')
class TableName extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  DateTimeColumn get date => dateTime().nullable()();
}

@DriftDatabase(tables: [TableName])
class DatabaseClassName extends _$DatabaseClassName {
  DatabaseClassName(): super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

}

Stream<List<RecordsClass>> watchAllData( DatabaseClassName database ){
  return database.select(database.tableName).watch();
}

Future insertData( DatabaseClassName database, RecordsClass record ){
  return database.into( database.tableName ).insert(record);
}

Future deleteData( DatabaseClassName database, RecordsClass record ){
  return database.delete( database.tableName ).delete(record);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dates.sqlite'));
    return NativeDatabase(file);
  });
}