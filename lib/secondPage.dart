import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:convert/convert.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:image_picker/image_picker.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

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
      home: SecondPage(),
    );
  }

  @override
  _SecondPageState createState() => _SecondPageState();
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);
}

class _SecondPageState extends State<SecondPage> {
  File _imageFile;
  //ImageController _controller;

  @override
  void initState() {
    super.initState();

    //_imageFile = new File("");
    //_controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    var capturedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);

    if (capturedImage != null)
      setState(() {
        _imageFile = capturedImage;
      });
  }

  Future<void> _captureImage() async {
    var pickedImage = await ImagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null)
      setState(() {
        _imageFile = pickedImage;
      });
  }

  Widget _imagePreviewer(context) {
    if (_imageFile == null)
      return Center(
        child: Text("No image Selected or Taken"),
      );

    //return Text("Image is suppose to show here");
    return Image.file(
      _imageFile,
      width: MediaQuery.of(context).size.width,
      height: 400.0,
    );

    // return Container(
    //   child: Column(
    //       children: <Widget>[
    //         Image.file(
    //           _imageFile,
    //           width: (MediaQuery.of(context).size.width - 20),
    //           height: 400.0,
    //         ),
    //         Container(
    //           width: MediaQuery.of(context).size.width,
    //           padding: EdgeInsets.only(bottom: 10.0),
    //           child: OutlineButton(
    //             padding: EdgeInsets.all(15),
    //             child: Text("Save Proof"),
    //             onPressed: () {
    //               print("Sending proof to lecturer ...");
    //             },
    //             color: Colors.orange,
    //             textColor: Colors.orange,
    //           ),
    //         )
    //       ],
    //     ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //      appBar: AppBar(
      //        title: Center(
      //          child: Text(widget.title,
      //            style: TextStyle(
      //              color: Colors.white,
      //              fontStyle: FontStyle.italic,
      //              fontWeight: FontWeight.bold,
      //            ),
      //          ),
      //        ),
      //      ),

      drawer: Drawer(
        child: ListView(
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
                  image: NetworkImage(
                      "https://witsvuvuzela.com/wp-content/uploads/2016/04/Great-Hall_side-768x512.jpg"),
                  alignment: Alignment.center,
                  //radius: 170.0,
                  //image:  NetworkImage(Uri.encodeFull("https://witsvuvuzela.com/wp-content/uploads/2016/04/Great-Hall_side-768x512.jpg")),
                  //backgroundColor: Colors.transparent,
                ),
              ),
              child: Text(
                'Themba S. Nkambule',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Account'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
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
        ),
      ),
      // appBar: AppBar(
      //   title: Text("Second Page"),
      // ),
      body: Container(
        child: Container(
            margin: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: OutlineButton(
                      padding: EdgeInsets.all(15),
                      child: Text("Pick Image"),
                      onPressed: () {
                        _pickImage();
                      },
                      color: Colors.orange,
                      textColor: Colors.orange,
					            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: OutlineButton(
                      padding: EdgeInsets.all(15),
                      child: Text("Capture Image"),
                      onPressed: () {
                        _captureImage();
                      },
                      color: Colors.orange,
                      textColor: Colors.orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //height: (MediaQuery.of(context).size.height - 450),
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: _imagePreviewer(context),
                  ),
                  //Divider(height: 10.0,),
                  /*SingleChildScrollView(
                          child: Row(
                            children: <Widget>[
                              FlatButton(
                                child: Text("Upload Note", style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0,
                                ),
                                ),
								shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                              ),
                              FlatButton(
                                child: Text("Cancel", style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0,
                                ),
                                ),
                              )
                            ],
                          ),
                        )*/
                ],
              ),
            )),
        // Text("Second Page"),
      ),
    );
  }
}
