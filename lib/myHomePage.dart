import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello/database.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';
import 'package:flutter/services.dart'; 

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;
  MyHomePage(this.user);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text){
    var post = new Post(text, widget.user.displayName);
    savePost(post);
    post.setId(savePost(post));
    this.setState(() {
      posts.add(post);   
    });
    
  }

  @override
   Widget build(BuildContext context){
      SystemChrome.setEnabledSystemUIOverlays([]);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo App', 
          style: TextStyle(
            fontStyle: FontStyle.normal,
            letterSpacing: 2)),
        
        actions: <Widget>[
          
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {}),
          IconButton(
            icon: Icon(Icons.settings), 
            padding: EdgeInsets.all(10),
            onPressed: () {}),

        ],
        
        titleSpacing: 00.1,
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 10.00,
        backgroundColor: Colors.amberAccent[200]
        ), 
      body: Column(children: <Widget>[
        Expanded(child: PostList(this.posts, widget.user)),
        TextInputWidget(this.newPost)
        ]));

  }
}