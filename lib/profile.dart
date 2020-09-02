import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartwatchapp/Data/database.dart';
import 'Models/subjectReport.dart';
import 'Services/reportingService.dart';

import 'dart:math' as math;

class SubjectDTO {
  final int subjectId;
  final String name;
  final String code;

  SubjectDTO(this.subjectId, this.name, this.code);
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<SubjectReport> _subjects = List<SubjectReport>();
  int selectedSubjectIndex = -1;

  @override
  void initState() {
    super.initState();

    // subjects = new List<SubjectDTO>();
    // subjects.add(new SubjectDTO(1, "Industrial Exposure IIB", "IDC30BT"));
    // subjects.add(new SubjectDTO(1, "Dscrete Structures IIIA", "DIC301T"));
    // subjects.add(
    //     new SubjectDTO(1, "Intelligent Industrial Systems IIIA", "IIS30AT"));
    var reportingService = StudentReportingService();
    reportingService
        .getStudentReporting()
        .then((subjects) async => initializeSubjects(subjects));
  }

  void initializeSubjects(List<SubjectReport> subjects) {
    setState(() {
      _subjects = subjects;
      print("subjects initialized");
      print(_subjects);
    });
  }



  Widget showWeeklySubjectReport(int index) {
    if(index == -1){
      return Center(
        child: Column(
          children: <Widget>[
            Text(
              "Weekly",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]
        )
      );
    }

    print("Selected Subject Index = $selectedSubjectIndex");     
    // print("${_subjects[index].attendance.weekly.present}/${(_subjects[index].attendance.weekly.present + _subjects[index].attendance.weekly.absent)}");

    return Center(
        child: Column(
      children: <Widget>[
        Text(
          "Weekly",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "${_subjects[index].attendance.weekly.present}/${(_subjects[index].attendance.weekly.present + _subjects[index].attendance.weekly.absent)}",
          // "6/14",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "(${((_subjects[index].attendance.weekly.present / (_subjects[index].attendance.weekly.present + _subjects[index].attendance.weekly.absent)) * 100).toStringAsFixed(2)}%)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    ));
  }

  Widget showMonthlySubjectReport(int index) {
    if(index == -1){
      return Center(
        child: Column(
          children: <Widget>[
            Text(
              "Monthly",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]
        )
      );
    }

    print("Selected Subject Index = $selectedSubjectIndex");     
    // print("${_subjects[index].attendance.weekly.present}/${(_subjects[index].attendance.weekly.present + _subjects[index].attendance.weekly.absent)}");

    return Center(
        child: Column(
      children: <Widget>[
        Text(
          "Monthly",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "${_subjects[index].attendance.monthly.present}/${(_subjects[index].attendance.monthly.present + _subjects[index].attendance.monthly.absent)}",
          // "6/14",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "(${((_subjects[index].attendance.monthly.present / (_subjects[index].attendance.monthly.present + _subjects[index].attendance.monthly.absent)) * 100).toStringAsFixed(2)}%)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    ));
  }

Widget showSemesterlySubjectReport(int index) {
    if(index == -1){
      return Center(
        child: Column(
          children: <Widget>[
            Text(
              "Semesterly",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]
        )
      );
    }

    print("Selected Subject Index = $selectedSubjectIndex");     
    // print("${_subjects[index].attendance.weekly.present}/${(_subjects[index].attendance.weekly.present + _subjects[index].attendance.weekly.absent)}");

    return Center(
        child: Column(
      children: <Widget>[
        Text(
          "Semesterly",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "${_subjects[index].attendance.semesterly.present}/${(_subjects[index].attendance.semesterly.present + _subjects[index].attendance.semesterly.absent)}",
          // "6/14",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "(${((_subjects[index].attendance.semesterly.present / (_subjects[index].attendance.semesterly.present + _subjects[index].attendance.semesterly.absent)) * 100).toStringAsFixed(2)}%)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // List<SubjectDTO> subjects = [
    //   new SubjectDTO(1, "Industrial Exposure IIB", "IDC30BT"),
    //   new SubjectDTO(2, "Dscrete Structures IIIA", "DIC301T"),
    //   new SubjectDTO(3, "Intelligent Industrial Systems IIIA", "IIS30AT"),
    //   new SubjectDTO(4, "Industrial Exposure IIIB", "IDC301T"),
    //   new SubjectDTO(5, "Dscrete Structures IIIB", "DIC311T"),
    //   new SubjectDTO(6, "Intelligent Industrial Systems IIIB", "IIS30BT")
    // ];

    return Scaffold(
      //backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        //child: Center(
        child: Container(
            width: size.width,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    // ClipPath(
                    //   child: Image.network(
                    //     "http://seekvectorlogo.com/wp-content/uploads/2019/10/harvard-university-vector-logo-small.png",
                    //   ),
                    //   clipper: MyProfileClipper(),
                    // ),
                    Container(
                      //color: Colors.white,
                      height: size.height * 0.4 - 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 60.0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.orange),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0)),
                          image: DecorationImage(
                              image: Image.network(
                                  // "http://seekvectorlogo.com/wp-content/uploads/2019/10/harvard-university-vector-logo-small.png",
                                  "https://www.wits.ac.za/media/wits-university/news-and-events/images/logos-and-icons/Wits-Logo-Mono-Neg-Legal-600x300.png").image,
                              fit: BoxFit.fill)
                          //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: size.width * 0.9,
                        height: 100,
                        margin: EdgeInsets.only(top: 80.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 2, color: Colors.orange),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomLeft: Radius.circular(50.0)),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 50,
                                color: Color(0xFF12153D).withOpacity(0.2),
                              )
                            ]),
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Themba Nkambule (214001209)",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                              // SizedBox(height: 10, ),
                              // Center(
                              //   child: Text(
                              //     "214001209",
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 18.0),
                              //   ),
                              // ),
                              // Center(
                              //   child: Text(
                              //     "213622439",
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 12.0),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: SizedBox(
                      height: 36.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _subjects.length,
                          itemBuilder: (context, index) => InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 18),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    _subjects[index].code,
                                    style: TextStyle(
                                        color: Colors.orange.withOpacity(0.8),
                                        fontSize: 16),
                                  ),
                                ),
                                onTap: () {
                                  print("Subject Name: ${_subjects[index].code} with ID: ${_subjects[index].subjectId} has been selected ...");
                                  setState(() {
                                    selectedSubjectIndex = index;
                                    showWeeklySubjectReport(selectedSubjectIndex);
                                    showMonthlySubjectReport(selectedSubjectIndex);
                                    showSemesterlySubjectReport(selectedSubjectIndex);
                                  });
                                },
                              )),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Text(
                      "ATTENDANCE",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 20.0),
                //   height: 150,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(vertical: 9),
                //     child: SizedBox(
                //       height: 36.0,
                //       child: ListView.builder(
                //           scrollDirection: Axis.horizontal,
                //           itemCount: subjects.length - 3,
                //           itemBuilder: (context, index) => Column(
                //                 children: <Widget>[
                //                   AttendanceInfoCard(
                //                     size: size,
                //                     headerLabel: "MONTHLY",
                //                     cardWidthSize: size.width * 0.5,
                //                   ),
                //                 ],
                //               )),
                //     ),
                //   ),
                // ),

                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 5.0, top: 20.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.orange),
                              // Border.all(width: 5, color: Colors.black26),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 50,
                                  color: Color(0xFF12153D).withOpacity(0.2),
                                )
                              ]),
                          width: size.width * 0.5 - 15,
                          height: 100,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 5),
                            child: SizedBox(
                              height: 36.0,
                              child: Center(
                                  child:
                                  selectedSubjectIndex != -1 ?                                  
                                  showWeeklySubjectReport(selectedSubjectIndex)
                                  : Center(
                                    child: Text("Loading reporting ..."),
                                  ) 
                              //     Column(
                              //   children: <Widget>[
                              //     Text(
                              //       "Weekly",
                              //       style: TextStyle(
                              //           fontSize: 24,
                              //           fontWeight: FontWeight.bold),
                              //       textAlign: TextAlign.center,
                              //     ),
                              //     Text(
                              //       "6/14",
                              //       style: TextStyle(
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.bold),
                              //       textAlign: TextAlign.center,
                              //     ),
                              //     Text(
                              //       "(${((6 / 14) * 100).toStringAsFixed(2)}%)",
                              //       style: TextStyle(
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.bold),
                              //       textAlign: TextAlign.center,
                              //     )
                              //   ],
                              // )
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, top: 20.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.orange),
                              // Border.all(width: 5, color: Colors.black26),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 50,
                                  color: Color(0xFF12153D).withOpacity(0.2),
                                )
                              ]),
                          width: size.width * 0.5 - 15,
                          height: 100,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 5),
                            child: SizedBox(
                              height: 36.0,
                              child: Center(
                                  child:
                                  selectedSubjectIndex != -1 ?                                  
                                  showMonthlySubjectReport(selectedSubjectIndex)
                                  : Center(
                                    child: Text("Loading reporting ..."),
                                  ) 
                              ),
                            ),
                          ),
                        )
                        // AttendanceInfoCard(
                        //   size: size,
                        //   headerLabel: "MONTHLY",
                        //   cardWidthSize: size.width * 0.5,
                        // )
                      ],
                    ),
                    Container(
                          margin: EdgeInsets.only(left: 5.0, top: 20.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.orange),
                              // Border.all(width: 5, color: Colors.black26),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 50,
                                  color: Color(0xFF12153D).withOpacity(0.2),
                                )
                              ]),
                          width: size.width * 0.5 - 15,
                          height: 100,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 5),
                            child: SizedBox(
                              height: 36.0,
                              child: Center(
                                  child:
                                  selectedSubjectIndex != -1 ?                                  
                                  showSemesterlySubjectReport(selectedSubjectIndex)
                                  : Center(
                                    child: Text("Loading reporting ..."),
                                  ) 
                              ),
                            ),
                          ),
                        )
                    // AttendanceInfoCard(
                    //   size: size,
                    //   headerLabel: "SEMESTERLY",
                    //   cardWidthSize: size.width,
                    // ),
                  ],
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 20.0),
                //   decoration: BoxDecoration(
                //       border: Border.all(width: 5, color: Colors.black26),
                //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                //       boxShadow: [
                //         BoxShadow(
                //           offset: Offset(0, 5),
                //           blurRadius: 50,
                //           color: Color(0xFF12153D).withOpacity(0.2),
                //         )
                //       ]),
                //   width: size.width * 0.5,
                //   height: 100,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(vertical: 9, horizontal: 1),
                //     child: SizedBox(
                //       height: 36.0,
                //       child: Center(
                //         child: Text("Card"),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )),
        //),
      ),
    );
  }
}

class AttendanceInfoCard extends StatelessWidget {
  const AttendanceInfoCard({
    Key key,
    @required this.size,
    @required this.headerLabel,
    @required this.cardWidthSize,
  }) : super(key: key);

  final Size size;
  final String headerLabel;
  final double cardWidthSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.0, top: 20.0),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.orange),
          // Border.all(width: 5, color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 50,
              color: Color(0xFF12153D).withOpacity(0.2),
            )
          ]),
      width: cardWidthSize - 15,
      height: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9, horizontal: 5),
        child: SizedBox(
          height: 36.0,
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  headerLabel,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "32/46",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "(${((32 / 46) * 100).toStringAsFixed(2)}%)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          )),
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  const SubjectCard(
      {Key key, @required this.subjectReport //, @required this.enrolledSubjects
      })
      : super(key: key);

  final SubjectReport subjectReport;
  // final List<SubjectReport> enrolledSubjects;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 18),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          subjectReport.code,
          style: TextStyle(color: Colors.orange.withOpacity(0.8), fontSize: 16),
        ),
      ),
      onTap: () {
        print(
            "Subject Name: ${subjectReport.code} with ID: ${subjectReport.subjectId} has been selected ...");
      },
    );
  }
}

class MyProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = new Offset(size.width / 4, size.height);
    var firstEndPoint = new Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = new Offset(size.width / 1.25, size.height - 65);
    var secondEndPoint = new Offset(size.width, size.height - 40.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
