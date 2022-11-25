import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_test/constants.dart';
import 'package:tiktok_test/models/user.dart' as model;
import 'package:tiktok_test/views/screens/auth/login_screen.dart';
import 'package:tiktok_test/views/screens/auth/signup_screen.dart';
import 'package:tiktok_test/views/screens/home_screen/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instancex = Get.find();
  late Rx<User?> _user;
  late Rx<File?> _picterImage;
  File? get profilePhoto => _picterImage.value;

  @override
  onReady(){
    super.onReady();
    _user = Rx<User?> (firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }
  _setInitialScreen(User? user){
    if(user ==null){
      Get.offAll(LoginScreen());
    }else{
      Get.offAll(HomeScreen());
    }
  }

  picImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picter', 'selected successfully');
      _picterImage = Rx<File?>(File(pickedImage.path));
    }
  }

  _uplodeToStorage(File image) async {
    Reference ref = await firebaseStorge
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  Future<void> regesterUser(
      String username, String email, String password, File image) async {
    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadURL = await _uplodeToStorage(image);
        model.User user = model.User(
            name: username,
            profilePhoto: downloadURL,
            email: email,
            password: password,
            uid: cred.user!.uid);
        await firestore
            .collection('userx')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar('Error Create Account', 'Please Enter All The Fields');
      }
    } catch (e) {
      Get.snackbar('Error Create Account', e.toString());
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
            print('login saccessfully');
      } else {
        Get.snackbar('Error login Account', 'Please Enter All The Fields');
      }
    } catch (e) {
      Get.snackbar('Error login Account', e.toString());
    }
  }
  goToRegester(){
    Get.offAll(SignupScreen());
  }
  goToLogin(){
    Get.offAll(LoginScreen());
  }
}
