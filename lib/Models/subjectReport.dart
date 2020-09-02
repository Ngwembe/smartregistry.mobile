class SubjectReport {
  int subjectId;
  String name;
  String code;
  String description;
  int courseId;
  int lecturerId;
  Attendance attendance;

  SubjectReport(
      {this.subjectId,
      this.name,
      this.code,
      this.description,
      this.courseId,
      this.lecturerId,
      this.attendance});

  factory SubjectReport.fromJson(Map<String, dynamic> json) {
    return SubjectReport(
        subjectId: json['SubjectId'],
        name: json['Name'],
        code: json['Code'],
        description: json['Description'],
        courseId: json['CourseId'],
        lecturerId: json['LecturerId'],
        attendance: json['Attendance'] != null
            ? new Attendance.fromJson(json['Attendance'])
            : null);
  }
  // SubjectReport.fromJson(Map<String, dynamic> json) {
  //   subjectId = json['SubjectId'];
  //   name = json['Name'];
  //   code = json['Code'];
  //   description = json['Description'];
  //   courseId = json['CourseId'];
  //   lecturerId = json['LecturerId'];
  //   attendance = json['Attendance'] != null
  //       ? new Attendance.fromJson(json['Attendance'])
  //       : null;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubjectId'] = this.subjectId;
    data['Name'] = this.name;
    data['Code'] = this.code;
    data['Description'] = this.description;
    data['CourseId'] = this.courseId;
    data['LecturerId'] = this.lecturerId;
    if (this.attendance != null) {
      data['Attendance'] = this.attendance.toJson();
    }
    return data;
  }
}

class Attendance {
  Weekly weekly;
  Weekly monthly;
  Weekly semesterly;

  Attendance({this.weekly, this.monthly, this.semesterly});

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
        weekly:
            json['Weekly'] != null ? new Weekly.fromJson(json['Weekly']) : null,
        monthly: json['Monthly'] != null
            ? new Weekly.fromJson(json['Monthly'])
            : null,
        semesterly: json['Semesterly'] != null
            ? new Weekly.fromJson(json['Semesterly'])
            : null);
  }
  // Attendance.fromJson(Map<String, dynamic> json) {
  //   weekly =
  //       json['Weekly'] != null ? new Weekly.fromJson(json['Weekly']) : null;
  //   monthly =
  //       json['Monthly'] != null ? new Weekly.fromJson(json['Monthly']) : null;
  //   semesterly = json['Semesterly'] != null
  //       ? new Weekly.fromJson(json['Semesterly'])
  //       : null;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weekly != null) {
      data['Weekly'] = this.weekly.toJson();
    }
    if (this.monthly != null) {
      data['Monthly'] = this.monthly.toJson();
    }
    if (this.semesterly != null) {
      data['Semesterly'] = this.semesterly.toJson();
    }
    return data;
  }
}

class Weekly {
  int present;
  int absent;

  Weekly({this.present, this.absent});

  factory Weekly.fromJson(Map<String, dynamic> json) {
    return Weekly(present: json['Present'], absent: json['Absent']);
  }
  // Weekly.fromJson(Map<String, dynamic> json) {
  //   present = json['Present'];
  //   absent = json['Absent'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Present'] = this.present;
    data['Absent'] = this.absent;
    return data;
  }
}
