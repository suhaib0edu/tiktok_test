import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String password;
  String uid;

  User({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.password,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "password": password,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        name: snapshot['name'],
        profilePhoto: snapshot['profilePhoto'],
        email: snapshot['email'],
        password: snapshot['password'],
        uid: snapshot['uid']);
  }
}
