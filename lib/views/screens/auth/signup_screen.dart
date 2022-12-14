import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TikTok',
              style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              'Regester',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://static-00.iconduck.com/assets.00/male-avatar-illustration-256x256-05bnteok.png'),
                        radius: 65,
                      ),
                      Positioned(
                          bottom: -10,
                          right: -10,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: IconButton(
                              icon: Icon(Icons.camera),
                              onPressed: () {
                                print('pic');
                                authController.picImage();
                              },
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                    controller: _usernameController,
                    icon: Icons.person,
                    label: 'username',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                    controller: _emailController,
                    icon: Icons.email,
                    label: 'email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                    controller: _passController,
                    icon: Icons.email,
                    label: 'password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (() => {
                          authController.regesterUser(
                              _usernameController.text,
                              _emailController.text,
                              _passController.text,
                              authController.profilePhoto!)
                        }),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                          child: Text(
                        'Regester',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have Account ?',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      InkWell(
                          onTap: (() {
                            print('go To Login');
                            authController.goToLogin();
                          }),
                          child: Text(
                            ' Login',
                            style: TextStyle(
                              fontSize: 19,
                              color: buttonColor,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
