import 'package:flutter/material.dart';
import 'package:smartwatchapp/homePage.dart' as homePage;
import 'package:smartwatchapp/schedules.dart' as schedulesPage;
import 'package:smartwatchapp/secondPage.dart' as secondPage;

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
                  child: Text("Sign Up", 
                    style: TextStyle(
                      fontSize: 80.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.fromLTRB(290.0, 115.0, 0.0, 0.0),
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
                    decoration: InputDecoration(
                      labelText: "NICK NAME",
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
                  TextField(
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => homePage.HomePage())),
                  child: Center(
                    child: Text("SIGN UP",
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
                  onTap: () => Navigator.pop(context),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 10.0,),
                    Center(
                      child: Text("Go Back", 
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
                      Text("Already have an account on Smart Watch?", 
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      InkWell(
                        child: Text("Login",
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ), 
                        ),
                        onTap: () => Navigator.pop(context),
                      )
                    ],
                  )
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
