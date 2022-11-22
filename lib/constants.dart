import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_test/controllers/auth_controller.dart';
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