import 'package:flutter/material.dart';

import 'Data/database.dart';

class SubjectsPage extends StatefulWidget {
  SubjectsPage({Key key,@required this.appDatabase}) : super(key: key);

  final AppDatabase appDatabase;

  @override
  _SubjectsPageState createState() => _SubjectsPageState(appDatabase: appDatabase);
}

class _SubjectsPageState extends State<SubjectsPage> {
  _SubjectsPageState({Key key, @required this.appDatabase});
  
  final AppDatabase appDatabase;

  List<dynamic> enrolledSubjects;
  TextEditingController _eventController;
  Map<int, List<dynamic>> _events;

  @override
  void initState() {
    super.initState();

    _events = {};
    enrolledSubjects = [];

    // appDatabase
    //     .getAllSubjects()
    //     .then((subjects) async => await _loadSchedules(subjects));

    _eventController = new TextEditingController();
  }

  _loadSchedules(List<SubjectData> subjects) {
    print(subjects);
    //_events = {};

    for (SubjectData subject in subjects) {
      print(subject.toJsonString());
      //enrolledSubjects.add(subject);

      if (_events[subject.subjectId] != null) {
        _events[subject.subjectId].add(subject);
        // _events[schedule.scheduleFor].add("Lecture Room: " +
        //     schedule.lectureRoom +
        //     " - Subject ID: " +
        //     schedule.subjectId.toString());
      } else {
        _events[subject.subjectId] = [subject];
        // _events[schedule.scheduleFor] = [
        //   "Lecture Room: " +
        //       schedule.lectureRoom +
        //       " - Subject ID: " +
        //       schedule.subjectId.toString()
        // ];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: Center(
                child: Column(children: <Widget>[
                  FutureBuilder(
                    future: appDatabase.getAllSubjects(),
                    initialData: null,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null)
                        return Container(
                            child: Center(
                          child: Text("No subjects found ..."),
                        ));
                      else {
                        enrolledSubjects = snapshot.data;

                        print("Items Count: ${snapshot.data.length}");

                        return ListView.builder(
                            itemCount: snapshot.data.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index >= 0 && index < snapshot.data.length) {
                                return ListTile(
                                  contentPadding: EdgeInsets.all(2.0),
                                  leading: Icon(Icons.fingerprint),
                                  trailing: Icon(
                                    Icons.lightbulb_outline,
                                    size: 24.0,
                                    color: Colors.orange,
                                  ),
                                  onTap: () => print("item pressed ..."),
                                  title: Text(snapshot.data[index].name),
                                  //subtitle: Text(snapshot.data[index].body),
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    "END OF LIST",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }
                            });
                      }
                    },
                  ),

                  // ...enrolledSubjects.map((subject) => ListTile(
                  //       leading: Icon(Icons.fingerprint),
                  //       title: Text(subject.toString()),
                  //       //isThreeLine: true,
                  //       dense: enrolledSubjects.length > 3 ? true : false,
                  //       //subtitle: Text(DateFormat.Hm().format(subject.name) + " - " + DateFormat.Hm().format(subject.code)),
                  //       //trailing:  subject.scheduleFor.isBefore(new DateTime.now()) ? Icon(Icons.check_box, color: Colors.orange,) : Icon(Icons.check_box_outline_blank, color: Colors.orange,),
                  //     )),
                ]),
              )),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: () => _showDialog()));
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add Subject"),
              content: TextField(
                controller: _eventController,
                /*style: TextStyle(
                  height: 20.0
              ),*/
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter body here ...',
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    setState(() {
                      try {
                        var subject = appDatabase.insertSubject(
                            new SubjectData(
                                subjectId: 1,
                                name: _eventController.text,
                                code: "...",
                                courseId: 1,
                                description: "...",
                                lecturerId: 1));

                        enrolledSubjects.add(subject);
                      } catch (ex) {
                        print(ex);
                      }

                      _eventController.clear();
                      Navigator.of(context).pop();
                    });
                  },
                ),
                //DateTimePicker()
              ],
            ));
  }
}
