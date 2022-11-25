import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_test/views/screens/add_video/add_video_screen_ctr.dart';
import 'package:tiktok_test/views/screens/auth/auth_controller.dart';
import 'package:tiktok_test/views/screens/add_video/add_screen.dart';
//COLOR
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorge = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//CONTROLER
var authController = AuthController();
var addVidCTR = AddVideoScreenCTR();

//PAGES

var pageScreen =[
const Text('Home Screen'),
const Text('Search Screen'),
AddVideoScreen(),
const Text('Messeges Screen'),
const Text('Profile Screen'),
];