import 'package:flutter/material.dart';
import 'package:tiktok_test/views/widgets/widgets.dart';

class PostVID extends StatefulWidget {
  const PostVID({super.key});

  @override
  State<PostVID> createState() => _PostVIDState();
}

class _PostVIDState extends State<PostVID> {
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/1.7,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                color: Colors.red,
              ),
              TextInputField(
                  controller: _songController,
                  icon: Icons.music_note,
                  label: 'Song Name'),
                  SizedBox(
                    height: 10,
                  ),
              TextInputField(
                  controller: _captionController,
                  icon: Icons.music_note,
                  label: 'Caption'),
                  SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(onPressed: (){}, child: Text('Share Video'))
                              ],
          ),
        ),
      ),
    );
  }
}
