import 'package:buildapp/Utils/utils.dart';
import 'package:buildapp/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim())
          .then((value) {
        Utils().toastMessage(
            'We have sent you email to recover password, please check email');
      });
    } catch (error) {
      ((error, stackTrace) {
        Utils().toastMessage(error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              "Assets/Images/forgotpassword.png",
              width: 300,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Forgot Your Password?',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Please enter your registered email to rest your password',
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RoundButton(
                    title: 'Reset password',
                    onTap: passwordReset,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
