import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartwatchapp/Models/subjectReport.dart';

List<SubjectReport> subjectReportFromJson(String str) => List<SubjectReport>.from(json.decode(str).map((x) => SubjectReport.fromJson(x)));
String scheduleToJson(List<SubjectReport> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentReportingService {
  static const String baseUrl = "http://192.168.9.100:8080/api/reporting/1";

  Future<List<SubjectReport>> getStudentReporting() async {
    try {
      final response = await http.get(Uri.encodeFull(baseUrl),
          headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        var subjects = List<SubjectReport>.from((jsonDecode(jsonDecode(response.body))).map((x) => SubjectReport.fromJson(x)));

        print(subjects);
        return subjects;
      } else {
        return new List<SubjectReport>();
      }
    } catch (e) {
      print(e);
      return new List<SubjectReport>();
    }
  }
}
