import 'package:flutter/material.dart';
import 'package:smartwatchapp/homePage.dart' as homePage;
import 'package:smartwatchapp/schedules.dart' as schedulesPage;
import 'package:smartwatchapp/secondPage.dart' as secondPage;
import 'package:smartwatchapp/signUpPage.dart' as signUpPage;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String emailInput = "";
  String passwordInput = "";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,        
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text("Hello", 
                    style: TextStyle(
                      fontSize: 80.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text("There", 
                    style: TextStyle(
                      fontSize: 80.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(225.0, 175.0, 0.0, 0.0),
                  child: Text(".",                     
                    style: TextStyle(
                      fontSize: 80.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                      ),
                                            
                  ),
                ),
              ],
            ),
            ),  //  Contains the wording on top

            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0 ),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (String newEmailText) {
                      setState(() {
                        emailInput = newEmailText;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightGreen,                          
                        )
                      )
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    onChanged: (String newPasswordText) {
                      setState(() {
                        passwordInput = newPasswordText;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightGreen,                          
                        )
                      )
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Forgot Password?", 
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      InkWell(
                        child: Text("Reset Here",
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ), 
                        ),
                        onTap: () => {
                          print("Reset has been pressed!"),
                        } ,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40.0,),

            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: Colors.lightGreen,
                elevation: 7.0,
                child: GestureDetector(
                  // onTap: () => {
                  //   print("Login has been pressed!"),
                  // },
                  onTap: () {
                      if(emailInput.isNotEmpty && emailInput == "tsepo.motswiane@gmail.com" && 
                         passwordInput.isNotEmpty && passwordInput == "Pass@123") {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => homePage.HomePage()));
                      }else {
                           showDialog(context: context, 
                            // barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Incorrect Credentials"),
                                titleTextStyle: TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 24.0
                                ),
                                contentPadding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 10.0),
                                contentTextStyle: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18.0
                                ),
                                elevation: 7.0,
                                content: Text("Username or password incorrect!"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("OK"),
                                    onPressed: ()=>{}),
                                ],
                              );
                            }
                          );
                      }
                  },
                  child: Center(
                    child: Text("LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0,),

            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              height: 40.0,
              color: Colors.transparent,
              child: Container(                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1.0
                  )
                ),
                child: InkWell(
                  onTap: () => {
                    print("Login with Facebook has been pressed!"),
                  },
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Center(
                    //   child: ImageIcon(AssetImage('assets/facebook.png')),
                    // ),
                    // SizedBox(width: 10.0,),
                    Center(
                      child: Text("Login with Facebook", 
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ],
                ),
                )
              ),
            ),

            SizedBox(height: 10.0,),
            Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Are you new to Smart Watch?", 
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      InkWell(
                        child: Text("Sign Up",
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ), 
                        ),
                        onTap: () => {
                          print("Sign up has been pressed!"),

                          Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPage.SignUpPage()))

                          // showDialog(context: context, 
                          //   // barrierDismissible: false,
                          //   builder: (context) {
                          //     return AlertDialog(
                          //       title: Text("Sign Up"),
                          //       // titlePadding: EdgeInsets.only(left: 30.0, right: 30.0),
                          //       titleTextStyle: TextStyle(
                          //         color: Colors.lightGreen,
                          //         fontWeight: FontWeight.bold,
                          //         fontStyle: FontStyle.normal,
                          //         fontSize: 24.0
                          //       ),
                          //       contentPadding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 10.0),
                          //       contentTextStyle: TextStyle(
                          //         color: Colors.orange,
                          //         fontWeight: FontWeight.bold,
                          //         fontStyle: FontStyle.italic,
                          //         fontSize: 18.0
                          //       ),
                          //       elevation: 7.0,
                          //       content: Text("Sign up has been pressed!"),
                          //       actions: <Widget>[
                          //         FlatButton(
                          //           child: Text("OK"),
                          //           onPressed: ()=>{}),
                          //       ],
                          //     );
                          //   }
                          // ),
                        } ,
                      )
                    ],
                  )
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
