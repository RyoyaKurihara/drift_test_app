import 'package:drift/drift.dart';

part 'datas.g.dart';

@DataClassName('RecordsClass')
class TableName extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  DateTimeColumn get date => dateTime().nullable()();
}

@DriftDatabase(tables: [TableName])
class DatabaseClassName extends _$DatabaseClassName {
  DatabaseClassName(super.e);

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => throw UnimplementedError();
}