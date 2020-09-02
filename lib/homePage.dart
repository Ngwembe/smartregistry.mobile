import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartwatchapp/Data/database.dart';
import 'package:smartwatchapp/MessagesPage.dart';
import 'package:smartwatchapp/profile.dart';
import 'package:smartwatchapp/schedules.dart' as schedulesPage;
import 'package:smartwatchapp/secondPage.dart' as secondPage;
import 'package:smartwatchapp/settings.dart';
import 'package:smartwatchapp/subjectsPage.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Smart Attendance'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(appDatabase: new AppDatabase());
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  _MyHomePageState({Key key,@required this.appDatabase});

  final AppDatabase appDatabase;

  int _counter = 0;  
  TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final BuildContext _context = context;

    //void _navigateToPage(BuildContext _context){
    //  Navigator.push(_context, MaterialPageRoute(builder: (context) => MessagesPage()));
    //}

    Widget _getDrawerListView(BuildContext _context) {
      var listView = ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            print("Should navigate to the Messages page");
            return Column(
              children: <Widget>[
                InkWell(
                  child: DrawerHeader(
                    padding: EdgeInsets.all(
                        45.0), //EdgeInsets.only(top: 145.0, left: 5.0, right: 5.0, bottom: 0.0),
                    margin: EdgeInsets.only(
                        top: 60.0,
                        left: 60.0,
                        right: 60.0,
                        bottom: 10.0), //EdgeInsets.all(60.0), //
                    //padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          //image: AssetImage('assets/images/menu_bg.png'),
                          image: NetworkImage(
                              "https://witsvuvuzela.com/wp-content/uploads/2016/04/Great-Hall_side-768x512.jpg"),
                          alignment: Alignment.center,
                          fit: BoxFit.fill),
                    ),
                    /*child: ListTile(
              contentPadding: EdgeInsets.only(top: 90.0),
              title: Text("Messages"),
              subtitle: Text("Check messages from contacts"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => new MessagesPage()));
              },
            ),*/
                    child: Divider(
                      height: 5.0,
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new ProfilePage())),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Tsepo Motswaine',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.grade, color: Colors.yellowAccent[100],),
                  title: Text("Attendance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  subtitle: Text("View your Attendance"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new ProfilePage())),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Messages", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  subtitle: Text("Check messages"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new MessagesPage())),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Subjects", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  subtitle: Text("View/Add subjects"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new SubjectsPage(appDatabase: this.appDatabase))),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  subtitle: Text("App settings"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new SettingsPage())),
                )
              ],
            );

            //return ListTile(
            //  title: Text("Messages"),
            //  subtitle: Text("Check messages from contacts"),
            //  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => new MessagesPage())),
            //);
          });

      return listView;
    }

    /*Widget _navigateToPage(BuildContext _context){

      return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(snapshot.data[index].title),
              subtitle: Text(snapshot.data[index].body),
            );
          });
    }*/

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
//        // bottom: TabBar(
//        //   controller: _controller,
//        //   tabs: <Widget>[
//        //       Tab(
//        //         icon: Icon(Icons.calendar_today),
//        //         ),
//        //       Tab(
//        //         icon: Icon(Icons.person),
//        //         ),
//        //   ]),
//
      ),

      drawer: Drawer(child: _getDrawerListView(context)

          /*child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              padding: EdgeInsets.only(top: 55.0, left: 35.0),
              margin: EdgeInsets.all(35.0),
              //padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
//                borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(150.0),
//                    topRight: Radius.circular( 150.0),
//                    bottomLeft: Radius.circular( 150.0),
//                    bottomRight: Radius.circular( 150.0),
//                ),
                //color: Colors.orange,
                image: DecorationImage(
                  //image: AssetImage('assets/images/menu_bg.png'),
                  image:  NetworkImage("https://witsvuvuzela.com/wp-content/uploads/2016/04/Great-Hall_side-768x512.jpg"),
                  alignment: Alignment.center,
                  //radius: 170.0,
                  //image:  NetworkImage(Uri.encodeFull("https://witsvuvuzela.com/wp-content/uploads/2016/04/Great-Hall_side-768x512.jpg")),
                  //backgroundColor: Colors.transparent,
                ),
              ),
              child: Text(
                'Profile Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap:() => _navigateToPage(this.context),
              //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => homePage.HomePage())),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),*/
          ),
      bottomNavigationBar: Container(
        color: Colors.orange,
        child: TabBar(
            indicatorColor: Colors.white,
            controller: _controller,
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
              ),
            ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          new schedulesPage.SchedulesPage(),
          new secondPage.SecondPage(
            title: "Smart Attendance",
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder:  (context) => schedulesPage.SchedulesPage()));
      //   } , //_incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
