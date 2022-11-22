import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_test/constants.dart';
import 'package:tiktok_test/models/user.dart' as model;

class AuthController extends GetxController {
  static AuthController instancex = Get.find();
  late Rx<File?> _picterImage;
  File? get profilePhoto => _picterImage.value;

  picImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage!=null){
      Get.snackbar('Profile Picter', 'selected successfully');
    }
    _picterImage = Rx<File?>(File(pickedImage!.path));
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

  void regesterUser(
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
}
