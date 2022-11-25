import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_test/constants.dart';
import 'package:tiktok_test/views/widgets/widgets.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Add Video'),
          onPressed: (() {
            showDialog(
                context: context,
                builder: (builder) {
                  return  Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child:  SimpleDialog(
                      children: [
                        InkWell(onTap: (){
                          addVidCTR.picVideo(ImageSource.camera, context);
                        },
                          child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: IconWithTextFalcon(
                                icon: Icons.camera,
                                text: 'Camera',
                              )),
                        ),
                            const Divider(),
                        InkWell(onTap: (){
                          addVidCTR.picVideo(ImageSource.gallery, context);
                        },
                          child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: IconWithTextFalcon(
                                icon: Icons.browse_gallery,
                                text: 'Gallery',
                              )),
                        ),
                            const Divider(),
                        InkWell(onTap: (){
                          Navigator.of(context).pop();
                        },
                          child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: IconWithTextFalcon(
                                icon: Icons.cancel,
                                text: 'Cancel',
                              )),
                        ),
                      ],
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
