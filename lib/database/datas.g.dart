// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datas.dart';

// ignore_for_file: type=lint
class $TableNameTable extends TableName
    with TableInfo<$TableNameTable, RecordsClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TableNameTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_name';
  @override
  VerificationContext validateIntegrity(Insertable<RecordsClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecordsClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordsClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
    );
  }

  @override
  $TableNameTable createAlias(String alias) {
    return $TableNameTable(attachedDatabase, alias);
  }
}

class RecordsClass extends DataClass implements Insertable<RecordsClass> {
  final int id;
  final String title;
  final DateTime? date;
  const RecordsClass({required this.id, required this.title, this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  TableNameCompanion toCompanion(bool nullToAbsent) {
    return TableNameCompanion(
      id: Value(id),
      title: Value(title),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory RecordsClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordsClass(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  RecordsClass copyWith(
          {int? id,
          String? title,
          Value<DateTime?> date = const Value.absent()}) =>
      RecordsClass(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date.present ? date.value : this.date,
      );
  @override
  String toString() {
    return (StringBuffer('RecordsClass(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordsClass &&
          other.id == this.id &&
          other.title == this.title &&
          other.date == this.date);
}

class TableNameCompanion extends UpdateCompanion<RecordsClass> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime?> date;
  const TableNameCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
  });
  TableNameCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.date = const Value.absent(),
  }) : title = Value(title);
  static Insertable<RecordsClass> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
    });
  }

  TableNameCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<DateTime?>? date}) {
    return TableNameCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableNameCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseClassName extends GeneratedDatabase {
  _$DatabaseClassName(QueryExecutor e) : super(e);
  late final $TableNameTable tableName = $TableNameTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tableName];
}
