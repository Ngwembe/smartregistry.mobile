import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';
//part 'smartwatcher_database.g.dart';

//  TO CREATE THE DB USE THE COMMAND BELOW ON YOUR TERMINAL
//=>  flutter packages pub run build_runner watch

class Schedule extends Table {
  IntColumn get scheduleId =>
      integer().autoIncrement()(); //integer().withDefault(Constant(0))();
  TextColumn get lectureRoom => text().withLength(min: 1, max: 100)();
  BoolColumn get isConfirmed => boolean().withDefault(Constant(false))();
  DateTimeColumn get scheduleFor => dateTime().nullable()();
  DateTimeColumn get scheduleTo => dateTime().nullable()();
  TextColumn get colorTheme => text().withLength(min: 1, max: 100)();
  IntColumn get subjectId => integer().withDefault(Constant(0))();
  //Subject subject;
}

class Subject extends Table {
  IntColumn get subjectId => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get code => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().withLength(min: 1, max: 100)();
  IntColumn get courseId => integer().withDefault(Constant(0))();
  IntColumn get lecturerId => integer().withDefault(Constant(0))();
}

@UseMoor(tables: [Schedule, Subject])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'smartwatcher_database.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  //  SCHEDULES QUERIES
  Future<List<ScheduleData>> getAllSchedules() => select(schedule).get();
  // Stream<List<Schedule>> watchAllSchedules() => select(schedule).watch();
  Future insertSchedule(ScheduleData newSchedule) => into(schedule).insert(newSchedule);
  Future updateSchedule(ScheduleData updatedSchedule) => update(schedule).replace(updatedSchedule);
  Future removeSchedule(ScheduleData removedSchedule) => delete(schedule).delete(removedSchedule);

  //  SUBJECT QUERIES
  Future<List<SubjectData>> getAllSubjects() => select(subject).get();
  // Stream<List<Schedule>> watchAllSchedules() => select(schedule).watch();
  Future insertSubject(SubjectData newSubject) => into(subject).insert(newSubject);
  Future updateSubject(SubjectData updatedSubject) => update(subject).replace(updatedSubject);
  Future removeSubject(SubjectData removedSubject) => delete(subject).delete(removedSubject);
}

// class Schedule {
//     Schedule({
//         this.scheduleId,
//         this.lectureRoom,
//         this.isConfirmed,
//         this.scheduleFor,
//         this.scheduleTo,
//         this.colorTheme,
//         this.createdBy,
//         this.createdAt,
//         this.lastUpdatedBy,
//         this.lastUpdatedAt,
//         this.isDeleted,
//         this.deletedBy,
//         this.deletedAt,
//         this.subjectId,
//         this.subject,
//     });

//     int scheduleId;
//     String lectureRoom;
//     bool isConfirmed;
//     DateTime scheduleFor;
//     DateTime scheduleTo;
//     String colorTheme;
//     dynamic createdBy;
//     DateTime createdAt;
//     dynamic lastUpdatedBy;
//     DateTime lastUpdatedAt;
//     bool isDeleted;
//     dynamic deletedBy;
//     DateTime deletedAt;
//     int subjectId;
//     Subject subject;

//     factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
//         scheduleId: json["scheduleId"],
//         lectureRoom: json["lectureRoom"],
//         isConfirmed: json["isConfirmed"],
//         scheduleFor: DateTime.parse(json["scheduleFor"]),
//         scheduleTo: DateTime.parse(json["scheduleTo"]),
//         colorTheme: json["colorTheme"],
//         createdBy: json["createdBy"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         lastUpdatedBy: json["lastUpdatedBy"],
//         lastUpdatedAt: DateTime.parse(json["lastUpdatedAt"]),
//         isDeleted: json["isDeleted"],
//         deletedBy: json["deletedBy"],
//         deletedAt: DateTime.parse(json["deletedAt"]),
//         subjectId: json["subjectId"],
//         subject: Subject.fromJson(json["subject"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "scheduleId": scheduleId,
//         "lectureRoom": lectureRoom,
//         "isConfirmed": isConfirmed,
//         "scheduleFor": scheduleFor.toIso8601String(),
//         "scheduleTo": scheduleTo.toIso8601String(),
//         "colorTheme": colorTheme,
//         "createdBy": createdBy,
//         "createdAt": createdAt.toIso8601String(),
//         "lastUpdatedBy": lastUpdatedBy,
//         "lastUpdatedAt": lastUpdatedAt.toIso8601String(),
//         "isDeleted": isDeleted,
//         "deletedBy": deletedBy,
//         "deletedAt": deletedAt.toIso8601String(),
//         "subjectId": subjectId,
//         "subject": subject.toJson(),
//     };
// }

// class Subject {
//     Subject({
//         this.subjectId,
//         this.name,
//         this.code,
//         this.description,
//         this.createdBy,
//         this.createdAt,
//         this.lastUpdatedBy,
//         this.lastUpdatedAt,
//         this.isDeleted,
//         this.deletedBy,
//         this.deletedAt,
//         this.courseId,
//         this.course,
//         this.lecturerId,
//         this.lecturer,
//     });

//     int subjectId;
//     String name;
//     String code;
//     String description;
//     dynamic createdBy;
//     DateTime createdAt;
//     dynamic lastUpdatedBy;
//     DateTime lastUpdatedAt;
//     bool isDeleted;
//     dynamic deletedBy;
//     DateTime deletedAt;
//     int courseId;
//     dynamic course;
//     int lecturerId;
//     dynamic lecturer;

//     factory Subject.fromJson(Map<String, dynamic> json) => Subject(
//         subjectId: json["subjectId"],
//         name: json["name"],
//         code: json["code"],
//         description: json["description"],
//         createdBy: json["createdBy"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         lastUpdatedBy: json["lastUpdatedBy"],
//         lastUpdatedAt: DateTime.parse(json["lastUpdatedAt"]),
//         isDeleted: json["isDeleted"],
//         deletedBy: json["deletedBy"],
//         deletedAt: DateTime.parse(json["deletedAt"]),
//         courseId: json["courseId"],
//         course: json["course"],
//         lecturerId: json["lecturerId"],
//         lecturer: json["lecturer"],
//     );

//     Map<String, dynamic> toJson() => {
//         "subjectId": subjectId,
//         "name": name,
//         "code": code,
//         "description": description,
//         "createdBy": createdBy,
//         "createdAt": createdAt.toIso8601String(),
//         "lastUpdatedBy": lastUpdatedBy,
//         "lastUpdatedAt": lastUpdatedAt.toIso8601String(),
//         "isDeleted": isDeleted,
//         "deletedBy": deletedBy,
//         "deletedAt": deletedAt.toIso8601String(),
//         "courseId": courseId,
//         "course": course,
//         "lecturerId": lecturerId,
//         "lecturer": lecturer,
//     };
// }
