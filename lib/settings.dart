import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: 
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CustomGradientButton(icon: Icon(Icons.android, size: 60, color: Colors.grey[800]),),
                    // Divider(thickness: 60.0,),
                    SizedBox(
                      width: 20.0,
                    ),
                    CustomGradientButton(icon: Icon(Icons.camera, size: 60, color: Colors.grey[800]),),
                  ],
                )
              ],
            )
        ));
  }
}

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    Key key, this.icon
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
	onTap:() => print("Button pressed"),
	child: Container(
      width: (MediaQuery.of(context).size.width / 3),
      height: 200,
      child:  icon,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[600],
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[200],
                Colors.grey[300],
                Colors.grey[400],
                Colors.grey[500],
              ],
              stops: [
                0.1,
                0.3,
                0.8,
                0.9,
              ])),
    ));
  }
}
