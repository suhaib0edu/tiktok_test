import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_test/views/screens/add_video/post_vid.dart';

class AddVideoScreenCTR extends GetxController{

  
    picVideo(ImageSource src , BuildContext context) async{
    final video = await ImagePicker().pickVideo(source: src);
    if(video!=null){
      Get.off(PostVID());
    }
  }
}