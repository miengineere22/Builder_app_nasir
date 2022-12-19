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
              'Please enter your registered email or number to rest your password',
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

// class ForgotPass extends StatefulWidget {
//   const ForgotPass({Key? key}) : super(key: key);
//   _ForgotPassState createState() => _ForgotPassState();
// }

// class _ForgotPassState extends State<ForgotPass> {
//   final emailController = TextEditingController();
//   bool loading = false;
//   final _formkey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(
//               top: 30.0,
//               left: 10,
//               right: 10,
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50.0),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "Assets/Images/forgotpassword.png",
//                     width: 300,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Forgot Your Password?',
//                           style: TextStyle(
//                               fontSize: 20.0, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'Please enter your registered email or number to rest your password',
//                           style: TextStyle(fontSize: 20.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Form(
//                       key: _formkey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             validator:
//                                 RequiredValidator(errorText: "Required*"),
//                             controller: emailController,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               labelText: 'Email or Phone Number',
//                               prefixIcon: Icon(Icons.email),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           RoundButton(
//                             title: 'Reset Password',
//                             onTap: () async {
//                               if (_formkey.currentState!.validate()) {
//                                 setState(() {
//                                   loading = true;
//                                 });
//                                 try {
//                                   _auth
//                                       .sendPasswordResetEmail(
//                                           email:
//                                               emailController.text.toString())
//                                       .then((value) {
//                                     setState(() {
//                                       loading = false;
//                                     });
//                                     Utils().toastMessage(
//                                         'please check your email, a reset email has been send to you via email');
//                                   }).onError((error, stackTrace) {
//                                     Utils().toastMessage(error.toString());
//                                     setState(() {
//                                       loading = false;
//                                     });
//                                   });
//                                 } catch (e) {
//                                   print(e.toString());
//                                   Utils().toastMessage(e.toString());
//                                   setState(() {
//                                     loading = false;
//                                   });
//                                 }
//                               }
//                               // Get.to(HomeScreen());
//                             },
//                           ),
//                         ],
//                       ))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
