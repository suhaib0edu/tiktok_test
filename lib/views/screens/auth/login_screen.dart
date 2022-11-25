import 'package:flutter/material.dart';
import 'package:tiktok_test/constants.dart';
import 'package:tiktok_test/views/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
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
              'Login',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  TextInputField(
                    controller: emailController,
                    icon: Icons.email,
                    label: 'email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                    controller: passController,
                    icon: Icons.password,
                    label: 'password',
                    obscureText: true,
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (() {
                      print('login done');
                    }),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(child: Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have account ?',style: TextStyle(fontSize: 19,),),
                       InkWell(
                        onTap: (() {
                          authController.goToRegester(); 
                        }),
                        child: Text(' regester',style: TextStyle(fontSize: 19,color: buttonColor,),)),
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
