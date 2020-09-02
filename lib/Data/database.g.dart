// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ScheduleData extends DataClass implements Insertable<ScheduleData> {
  final int scheduleId;
  final String lectureRoom;
  final bool isConfirmed;
  final DateTime scheduleFor;
  final DateTime scheduleTo;
  final String colorTheme;
  final int subjectId;
  ScheduleData(
      {@required this.scheduleId,
      @required this.lectureRoom,
      @required this.isConfirmed,
      this.scheduleFor,
      this.scheduleTo,
      @required this.colorTheme,
      @required this.subjectId});
  factory ScheduleData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ScheduleData(
      scheduleId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}schedule_id']),
      lectureRoom: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}lecture_room']),
      isConfirmed: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_confirmed']),
      scheduleFor: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}schedule_for']),
      scheduleTo: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}schedule_to']),
      colorTheme: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}color_theme']),
      subjectId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}subject_id']),
    );
  }
  factory ScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ScheduleData(
      scheduleId: serializer.fromJson<int>(json['scheduleId']),
      lectureRoom: serializer.fromJson<String>(json['lectureRoom']),
      isConfirmed: serializer.fromJson<bool>(json['isConfirmed']),
      scheduleFor: serializer.fromJson<DateTime>(json['scheduleFor']),
      scheduleTo: serializer.fromJson<DateTime>(json['scheduleTo']),
      colorTheme: serializer.fromJson<String>(json['colorTheme']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'scheduleId': serializer.toJson<int>(scheduleId),
      'lectureRoom': serializer.toJson<String>(lectureRoom),
      'isConfirmed': serializer.toJson<bool>(isConfirmed),
      'scheduleFor': serializer.toJson<DateTime>(scheduleFor),
      'scheduleTo': serializer.toJson<DateTime>(scheduleTo),
      'colorTheme': serializer.toJson<String>(colorTheme),
      'subjectId': serializer.toJson<int>(subjectId),
    };
  }

  @override
  ScheduleCompanion createCompanion(bool nullToAbsent) {
    return ScheduleCompanion(
      scheduleId: scheduleId == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduleId),
      lectureRoom: lectureRoom == null && nullToAbsent
          ? const Value.absent()
          : Value(lectureRoom),
      isConfirmed: isConfirmed == null && nullToAbsent
          ? const Value.absent()
          : Value(isConfirmed),
      scheduleFor: scheduleFor == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduleFor),
      scheduleTo: scheduleTo == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduleTo),
      colorTheme: colorTheme == null && nullToAbsent
          ? const Value.absent()
          : Value(colorTheme),
      subjectId: subjectId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectId),
    );
  }

  ScheduleData copyWith(
          {int scheduleId,
          String lectureRoom,
          bool isConfirmed,
          DateTime scheduleFor,
          DateTime scheduleTo,
          String colorTheme,
          int subjectId}) =>
      ScheduleData(
        scheduleId: scheduleId ?? this.scheduleId,
        lectureRoom: lectureRoom ?? this.lectureRoom,
        isConfirmed: isConfirmed ?? this.isConfirmed,
        scheduleFor: scheduleFor ?? this.scheduleFor,
        scheduleTo: scheduleTo ?? this.scheduleTo,
        colorTheme: colorTheme ?? this.colorTheme,
        subjectId: subjectId ?? this.subjectId,
      );
  @override
  String toString() {
    return (StringBuffer('ScheduleData(')
          ..write('scheduleId: $scheduleId, ')
          ..write('lectureRoom: $lectureRoom, ')
          ..write('isConfirmed: $isConfirmed, ')
          ..write('scheduleFor: $scheduleFor, ')
          ..write('scheduleTo: $scheduleTo, ')
          ..write('colorTheme: $colorTheme, ')
          ..write('subjectId: $subjectId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      scheduleId.hashCode,
      $mrjc(
          lectureRoom.hashCode,
          $mrjc(
              isConfirmed.hashCode,
              $mrjc(
                  scheduleFor.hashCode,
                  $mrjc(scheduleTo.hashCode,
                      $mrjc(colorTheme.hashCode, subjectId.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ScheduleData &&
          other.scheduleId == this.scheduleId &&
          other.lectureRoom == this.lectureRoom &&
          other.isConfirmed == this.isConfirmed &&
          other.scheduleFor == this.scheduleFor &&
          other.scheduleTo == this.scheduleTo &&
          other.colorTheme == this.colorTheme &&
          other.subjectId == this.subjectId);
}

class ScheduleCompanion extends UpdateCompanion<ScheduleData> {
  final Value<int> scheduleId;
  final Value<String> lectureRoom;
  final Value<bool> isConfirmed;
  final Value<DateTime> scheduleFor;
  final Value<DateTime> scheduleTo;
  final Value<String> colorTheme;
  final Value<int> subjectId;
  const ScheduleCompanion({
    this.scheduleId = const Value.absent(),
    this.lectureRoom = const Value.absent(),
    this.isConfirmed = const Value.absent(),
    this.scheduleFor = const Value.absent(),
    this.scheduleTo = const Value.absent(),
    this.colorTheme = const Value.absent(),
    this.subjectId = const Value.absent(),
  });
  ScheduleCompanion.insert({
    this.scheduleId = const Value.absent(),
    @required String lectureRoom,
    this.isConfirmed = const Value.absent(),
    this.scheduleFor = const Value.absent(),
    this.scheduleTo = const Value.absent(),
    @required String colorTheme,
    this.subjectId = const Value.absent(),
  })  : lectureRoom = Value(lectureRoom),
        colorTheme = Value(colorTheme);
  ScheduleCompanion copyWith(
      {Value<int> scheduleId,
      Value<String> lectureRoom,
      Value<bool> isConfirmed,
      Value<DateTime> scheduleFor,
      Value<DateTime> scheduleTo,
      Value<String> colorTheme,
      Value<int> subjectId}) {
    return ScheduleCompanion(
      scheduleId: scheduleId ?? this.scheduleId,
      lectureRoom: lectureRoom ?? this.lectureRoom,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      scheduleFor: scheduleFor ?? this.scheduleFor,
      scheduleTo: scheduleTo ?? this.scheduleTo,
      colorTheme: colorTheme ?? this.colorTheme,
      subjectId: subjectId ?? this.subjectId,
    );
  }
}

class $ScheduleTable extends Schedule
    with TableInfo<$ScheduleTable, ScheduleData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ScheduleTable(this._db, [this._alias]);
  final VerificationMeta _scheduleIdMeta = const VerificationMeta('scheduleId');
  GeneratedIntColumn _scheduleId;
  @override
  GeneratedIntColumn get scheduleId => _scheduleId ??= _constructScheduleId();
  GeneratedIntColumn _constructScheduleId() {
    return GeneratedIntColumn('schedule_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _lectureRoomMeta =
      const VerificationMeta('lectureRoom');
  GeneratedTextColumn _lectureRoom;
  @override
  GeneratedTextColumn get lectureRoom =>
      _lectureRoom ??= _constructLectureRoom();
  GeneratedTextColumn _constructLectureRoom() {
    return GeneratedTextColumn('lecture_room', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _isConfirmedMeta =
      const VerificationMeta('isConfirmed');
  GeneratedBoolColumn _isConfirmed;
  @override
  GeneratedBoolColumn get isConfirmed =>
      _isConfirmed ??= _constructIsConfirmed();
  GeneratedBoolColumn _constructIsConfirmed() {
    return GeneratedBoolColumn('is_confirmed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _scheduleForMeta =
      const VerificationMeta('scheduleFor');
  GeneratedDateTimeColumn _scheduleFor;
  @override
  GeneratedDateTimeColumn get scheduleFor =>
      _scheduleFor ??= _constructScheduleFor();
  GeneratedDateTimeColumn _constructScheduleFor() {
    return GeneratedDateTimeColumn(
      'schedule_for',
      $tableName,
      true,
    );
  }

  final VerificationMeta _scheduleToMeta = const VerificationMeta('scheduleTo');
  GeneratedDateTimeColumn _scheduleTo;
  @override
  GeneratedDateTimeColumn get scheduleTo =>
      _scheduleTo ??= _constructScheduleTo();
  GeneratedDateTimeColumn _constructScheduleTo() {
    return GeneratedDateTimeColumn(
      'schedule_to',
      $tableName,
      true,
    );
  }

  final VerificationMeta _colorThemeMeta = const VerificationMeta('colorTheme');
  GeneratedTextColumn _colorTheme;
  @override
  GeneratedTextColumn get colorTheme => _colorTheme ??= _constructColorTheme();
  GeneratedTextColumn _constructColorTheme() {
    return GeneratedTextColumn('color_theme', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _subjectIdMeta = const VerificationMeta('subjectId');
  GeneratedIntColumn _subjectId;
  @override
  GeneratedIntColumn get subjectId => _subjectId ??= _constructSubjectId();
  GeneratedIntColumn _constructSubjectId() {
    return GeneratedIntColumn('subject_id', $tableName, false,
        defaultValue: Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns => [
        scheduleId,
        lectureRoom,
        isConfirmed,
        scheduleFor,
        scheduleTo,
        colorTheme,
        subjectId
      ];
  @override
  $ScheduleTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'schedule';
  @override
  final String actualTableName = 'schedule';
  @override
  VerificationContext validateIntegrity(ScheduleCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.scheduleId.present) {
      context.handle(_scheduleIdMeta,
          scheduleId.isAcceptableValue(d.scheduleId.value, _scheduleIdMeta));
    }
    if (d.lectureRoom.present) {
      context.handle(_lectureRoomMeta,
          lectureRoom.isAcceptableValue(d.lectureRoom.value, _lectureRoomMeta));
    } else if (isInserting) {
      context.missing(_lectureRoomMeta);
    }
    if (d.isConfirmed.present) {
      context.handle(_isConfirmedMeta,
          isConfirmed.isAcceptableValue(d.isConfirmed.value, _isConfirmedMeta));
    }
    if (d.scheduleFor.present) {
      context.handle(_scheduleForMeta,
          scheduleFor.isAcceptableValue(d.scheduleFor.value, _scheduleForMeta));
    }
    if (d.scheduleTo.present) {
      context.handle(_scheduleToMeta,
          scheduleTo.isAcceptableValue(d.scheduleTo.value, _scheduleToMeta));
    }
    if (d.colorTheme.present) {
      context.handle(_colorThemeMeta,
          colorTheme.isAcceptableValue(d.colorTheme.value, _colorThemeMeta));
    } else if (isInserting) {
      context.missing(_colorThemeMeta);
    }
    if (d.subjectId.present) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableValue(d.subjectId.value, _subjectIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {scheduleId};
  @override
  ScheduleData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ScheduleData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ScheduleCompanion d) {
    final map = <String, Variable>{};
    if (d.scheduleId.present) {
      map['schedule_id'] = Variable<int, IntType>(d.scheduleId.value);
    }
    if (d.lectureRoom.present) {
      map['lecture_room'] = Variable<String, StringType>(d.lectureRoom.value);
    }
    if (d.isConfirmed.present) {
      map['is_confirmed'] = Variable<bool, BoolType>(d.isConfirmed.value);
    }
    if (d.scheduleFor.present) {
      map['schedule_for'] =
          Variable<DateTime, DateTimeType>(d.scheduleFor.value);
    }
    if (d.scheduleTo.present) {
      map['schedule_to'] = Variable<DateTime, DateTimeType>(d.scheduleTo.value);
    }
    if (d.colorTheme.present) {
      map['color_theme'] = Variable<String, StringType>(d.colorTheme.value);
    }
    if (d.subjectId.present) {
      map['subject_id'] = Variable<int, IntType>(d.subjectId.value);
    }
    return map;
  }

  @override
  $ScheduleTable createAlias(String alias) {
    return $ScheduleTable(_db, alias);
  }
}

class SubjectData extends DataClass implements Insertable<SubjectData> {
  final int subjectId;
  final String name;
  final String code;
  final String description;
  final int courseId;
  final int lecturerId;
  SubjectData(
      {@required this.subjectId,
      @required this.name,
      @required this.code,
      @required this.description,
      @required this.courseId,
      @required this.lecturerId});
  factory SubjectData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return SubjectData(
      subjectId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}subject_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      courseId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}course_id']),
      lecturerId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}lecturer_id']),
    );
  }
  factory SubjectData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SubjectData(
      subjectId: serializer.fromJson<int>(json['subjectId']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
      description: serializer.fromJson<String>(json['description']),
      courseId: serializer.fromJson<int>(json['courseId']),
      lecturerId: serializer.fromJson<int>(json['lecturerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'subjectId': serializer.toJson<int>(subjectId),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
      'description': serializer.toJson<String>(description),
      'courseId': serializer.toJson<int>(courseId),
      'lecturerId': serializer.toJson<int>(lecturerId),
    };
  }

  @override
  SubjectCompanion createCompanion(bool nullToAbsent) {
    return SubjectCompanion(
      subjectId: subjectId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      courseId: courseId == null && nullToAbsent
          ? const Value.absent()
          : Value(courseId),
      lecturerId: lecturerId == null && nullToAbsent
          ? const Value.absent()
          : Value(lecturerId),
    );
  }

  SubjectData copyWith(
          {int subjectId,
          String name,
          String code,
          String description,
          int courseId,
          int lecturerId}) =>
      SubjectData(
        subjectId: subjectId ?? this.subjectId,
        name: name ?? this.name,
        code: code ?? this.code,
        description: description ?? this.description,
        courseId: courseId ?? this.courseId,
        lecturerId: lecturerId ?? this.lecturerId,
      );
  @override
  String toString() {
    return (StringBuffer('SubjectData(')
          ..write('subjectId: $subjectId, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('courseId: $courseId, ')
          ..write('lecturerId: $lecturerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      subjectId.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              code.hashCode,
              $mrjc(description.hashCode,
                  $mrjc(courseId.hashCode, lecturerId.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SubjectData &&
          other.subjectId == this.subjectId &&
          other.name == this.name &&
          other.code == this.code &&
          other.description == this.description &&
          other.courseId == this.courseId &&
          other.lecturerId == this.lecturerId);
}

class SubjectCompanion extends UpdateCompanion<SubjectData> {
  final Value<int> subjectId;
  final Value<String> name;
  final Value<String> code;
  final Value<String> description;
  final Value<int> courseId;
  final Value<int> lecturerId;
  const SubjectCompanion({
    this.subjectId = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.description = const Value.absent(),
    this.courseId = const Value.absent(),
    this.lecturerId = const Value.absent(),
  });
  SubjectCompanion.insert({
    this.subjectId = const Value.absent(),
    @required String name,
    @required String code,
    @required String description,
    this.courseId = const Value.absent(),
    this.lecturerId = const Value.absent(),
  })  : name = Value(name),
        code = Value(code),
        description = Value(description);
  SubjectCompanion copyWith(
      {Value<int> subjectId,
      Value<String> name,
      Value<String> code,
      Value<String> description,
      Value<int> courseId,
      Value<int> lecturerId}) {
    return SubjectCompanion(
      subjectId: subjectId ?? this.subjectId,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      courseId: courseId ?? this.courseId,
      lecturerId: lecturerId ?? this.lecturerId,
    );
  }
}

class $SubjectTable extends Subject with TableInfo<$SubjectTable, SubjectData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SubjectTable(this._db, [this._alias]);
  final VerificationMeta _subjectIdMeta = const VerificationMeta('subjectId');
  GeneratedIntColumn _subjectId;
  @override
  GeneratedIntColumn get subjectId => _subjectId ??= _constructSubjectId();
  GeneratedIntColumn _constructSubjectId() {
    return GeneratedIntColumn('subject_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn('code', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _courseIdMeta = const VerificationMeta('courseId');
  GeneratedIntColumn _courseId;
  @override
  GeneratedIntColumn get courseId => _courseId ??= _constructCourseId();
  GeneratedIntColumn _constructCourseId() {
    return GeneratedIntColumn('course_id', $tableName, false,
        defaultValue: Constant(0));
  }

  final VerificationMeta _lecturerIdMeta = const VerificationMeta('lecturerId');
  GeneratedIntColumn _lecturerId;
  @override
  GeneratedIntColumn get lecturerId => _lecturerId ??= _constructLecturerId();
  GeneratedIntColumn _constructLecturerId() {
    return GeneratedIntColumn('lecturer_id', $tableName, false,
        defaultValue: Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [subjectId, name, code, description, courseId, lecturerId];
  @override
  $SubjectTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'subject';
  @override
  final String actualTableName = 'subject';
  @override
  VerificationContext validateIntegrity(SubjectCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.subjectId.present) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableValue(d.subjectId.value, _subjectIdMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.code.present) {
      context.handle(
          _codeMeta, code.isAcceptableValue(d.code.value, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.courseId.present) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableValue(d.courseId.value, _courseIdMeta));
    }
    if (d.lecturerId.present) {
      context.handle(_lecturerIdMeta,
          lecturerId.isAcceptableValue(d.lecturerId.value, _lecturerIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {subjectId};
  @override
  SubjectData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SubjectData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SubjectCompanion d) {
    final map = <String, Variable>{};
    if (d.subjectId.present) {
      map['subject_id'] = Variable<int, IntType>(d.subjectId.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.code.present) {
      map['code'] = Variable<String, StringType>(d.code.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.courseId.present) {
      map['course_id'] = Variable<int, IntType>(d.courseId.value);
    }
    if (d.lecturerId.present) {
      map['lecturer_id'] = Variable<int, IntType>(d.lecturerId.value);
    }
    return map;
  }

  @override
  $SubjectTable createAlias(String alias) {
    return $SubjectTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ScheduleTable _schedule;
  $ScheduleTable get schedule => _schedule ??= $ScheduleTable(this);
  $SubjectTable _subject;
  $SubjectTable get subject => _subject ??= $SubjectTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [schedule, subject];
}
