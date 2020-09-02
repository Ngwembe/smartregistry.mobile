import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
import 'package:smartwatchapp/Data/database.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:intl/intl.dart';

class SchedulesPage extends StatefulWidget {
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  _SchedulesPageState createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  AppDatabase _appDatabase;
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  TextEditingController _eventController;
  List<dynamic> selectedEvents;

  final _formKey = GlobalKey<FormState>();

  dynamic _subscription;

  @override
  void initState() {
    super.initState();

    _appDatabase = AppDatabase();

    //_events = {};
    _appDatabase.getAllSchedules().then((schedules) async {
      await _loadSchedules(schedules);
    });

    selectedEvents = [];
    _controller = CalendarController();
    _eventController = TextEditingController();
  }

  @override
  dispose() {
    super.dispose();

    _subscription.cancel();
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });

    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });

    return newMap;
  }

  //Future<Map<DateTime, List<dynamic>>>
  _loadSchedules(List<ScheduleData> schedules) {
    _events = {};

    for (var schedule in schedules) {
      if (_events[schedule.scheduleFor] != null) {
        _events[schedule.scheduleFor].add(schedule);
        // _events[schedule.scheduleFor].add("Lecture Room: " +
        //     schedule.lectureRoom +
        //     " - Subject ID: " +
        //     schedule.subjectId.toString());
      } else {
        _events[schedule.scheduleFor] = [schedule];
        // _events[schedule.scheduleFor] = [
        //   "Lecture Room: " +
        //       schedule.lectureRoom +
        //       " - Subject ID: " +
        //       schedule.subjectId.toString()
        // ];
      }
    }

    //return _events;
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add Calendar Event"),
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
                  child:
                      /*Row(
              children: <Widget>[
                Icon(Icons.save_alt),
                Text("Save")
              ],
            ),*/
                      Text("Save"),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;

                    setState(() {
                      try {
                        if (_events[_controller.selectedDay] != null) {
                          _events[_controller.selectedDay]
                              .add(_eventController.text);
                        } else {
                          _events[_controller.selectedDay] = [
                            _eventController.text
                          ];
                        }

                        var schedule = _appDatabase.insertSchedule(
                            new ScheduleData(
                                scheduleId: null,
                                lectureRoom: _eventController.text,
                                isConfirmed: true,
                                colorTheme: "0xFF00EE44",
                                subjectId: 1,
                                scheduleFor: _controller.selectedDay,
                                scheduleTo: _controller.selectedDay));
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

  Future<bool> _checkConnectivity() async {
    print("Inside the _checkConnectivity() ...");

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      //I am connected to a mobile network.

      print("Mobile Internet connection established ...");
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      //I am connected to a wifi network.
      var wifiBSSID = await (Connectivity().getWifiBSSID());
      var wifiIP = await (Connectivity().getWifiIP());
      var wifiName = await (Connectivity().getWifiName());

      // showDialog(
      //   context: context,
      //   builder: (context) =>
      //     AlertDialog(
      //       content: Text("SSID: $wifiBSSID \nIP:$wifiIP\nName: $wifiName"),
      //       actions: <Widget>[FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text("OK"),)],
      //     )
      //   );

      print("Wifi Internet connection established ...");
      return true;
    }

    print("No Internet connection established ...");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //      appBar: AppBar(
//        title: Center(
//          child: Text("",
//            style: TextStyle(
//              color: Colors.white,
//              fontStyle: FontStyle.italic,
//              fontWeight: FontWeight.bold,
//            ),
//          ),
//        ),
//      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: FutureBuilder(
                future: _checkConnectivity(),
                initialData: false,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      color: Color(0xFFEE4400),
                      child: Center(
                        child: Text(
                          "Checking for connectivity ...",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else {
                    bool connected = snapshot.data;
                    print("Is Internet available: $connected");

                    return Container(
                      color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                      child: Center(
                          child: Text("${connected ? 'ONLINE' : 'OFFLINE'}",
                              style: TextStyle(color: Colors.white))),
                    );
                  }
                },
              ),
            ),
            TableCalendar(
              events: _events,
              calendarController: _controller,
              onDaySelected: (date, events) {
                setState(() {
                  selectedEvents = events;
                });
              },
              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,
                selectedColor: Colors.orange,
              ),
            ),
            ...selectedEvents.map((event) => ListTile(
                  leading: Icon(Icons.assignment),
                  title: Text(event.lectureRoom),
                  isThreeLine: true,
                  dense: selectedEvents.length > 3 ? true : false,
                  subtitle: Text(DateFormat.Hm().format(event.scheduleFor) +
                      " - " +
                      DateFormat.Hm().format(event.scheduleTo)),
                  trailing: event.scheduleFor.isBefore(new DateTime.now())
                      ? Icon(
                          Icons.check_box,
                          color: Colors.orange,
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.orange,
                        ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showDialog(),
      ),
    );
  }
}
