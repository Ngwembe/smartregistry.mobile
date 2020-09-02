import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;
//import 'package:convert/convert.dart';

class MessagesPage  extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);
}

class _MessagesPageState extends State<MessagesPage> {

  CircleAvatar leadingIcon = CircleAvatar();

  String baseUrl = "https://jsonplaceholder.typicode.com/posts";
  Future<List<Post>> _getPosts() async{
    var response = await http.get(Uri.encodeFull(baseUrl), headers: {"Accept": "application/json"});
    //  var response = await _httpClient.get(Uri.encodeFull(baseUrl), 80 ,"/posts");

    //print(response.body);
    var jsonData = json.decode(response.body);
    print(jsonData);

    List<Post> posts = List<Post>();
    for(var _post in jsonData){
      //print(_post);
      Post post = Post(_post["userId"], _post["id"], _post["title"].toString(), _post["body"].toString());
      posts.add(post);
    }

    //print(posts.length);
    leadingIcon = CircleAvatar(
      //radius: 45.0,
      backgroundImage: NetworkImage("https://witsvuvuzela.com/wp-content/uploads/2016/04/Great-Hall_side-768x512.jpg"),
    );

    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
        body: Container(
            child: FutureBuilder(
                future: _getPosts(),
                builder: (BuildContext context, AsyncSnapshot snapshot){

                  if(snapshot.data == null){
                    return Container(
                        child: Center(
                          child: Text("Loading ..."),
                        )
                    );
                  }else {
                    final int listCount = snapshot.data.length;
                    return ListView.builder(
                        itemCount: listCount + 1,
                        itemBuilder: (BuildContext context, int index){

                          if(index >= 0 && index < listCount){
                            return ListTile(contentPadding: EdgeInsets.all(2.0),
                              leading: leadingIcon,
                              trailing: Icon(Icons.lightbulb_outline, size: 24.0,color: Colors.orange,),
                              onTap: (){
                                    showDialog(context: context, builder: (context) {
                                      return AlertDialog(
                                        title: Text("Item Selection"),
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
                                        content: Text("Item ${index + 1} has been selected!"),
                                        actions: <Widget>[
                                          FlatButton(
                                              child: Text("OK"),
                                              onPressed: ()=>{
                                                Navigator.of(context, rootNavigator: true).pop('dialog')
                                              }),
                                        ],
                                      );
                                    });
                              },
                              title: Text(snapshot.data[index].title),
                              //subtitle: Text(snapshot.data[index].body),
                            );
                          }else{
                            return Center(
                              child: Text("END OF LIST", style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal
                              ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }

                        });
                  }


                }
            )
        ),
        /*body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  child: FutureBuilder(
                      future: _getPosts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot){

                        if(snapshot.data == null){
                          return Container(
                              child: Center(
                                child: Text("Loading ..."),
                              )
                          );
                        }else {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index){
                                //print(snapshot.data[index]);

                                return ListTile(
                                  title: Text(snapshot.data[index].title),
                                  //subtitle: Text(snapshot.data[index].body),
                                );
                              });
                        }


                      }
                  )
              ),
            ],
          ),
        )*/
      );
  }
}
