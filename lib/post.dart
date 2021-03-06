

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'database.dart';

class Post{
  String body;
  String author;
  Set usersLiked = {};
  DatabaseReference _id;
  

  Post(this.body, this.author);

  void likePost(FirebaseUser user) {
    if (this.usersLiked.contains(user.uid)){
      this.usersLiked.remove(user.uid);
    } else {
      this.usersLiked.add(user.uid);
    }
    this.update();
  }

  void update() {
    updatePost(this, this._id);
  }
  
  void setId(DatabaseReference id){
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': this.author,
      'usersLiked': this.usersLiked, 
      'body': this.body
    };
  }
}