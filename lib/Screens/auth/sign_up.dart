import 'package:buildapp/Screens/auth/sign_in.dart';
import 'package:buildapp/Screens/home_and_general_screen/profile.dart';
import 'package:buildapp/Utils/utils.dart';
import 'package:buildapp/controller/main_controller.dart';
import 'package:buildapp/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  MainController controller = Get.put(MainController());

  @override
  bool _isHidden = true;
  bool loading = false;
  final pwdController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    pwdController.dispose();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 10,
                right: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "Assets/Images/wel.PNG",
                      width: 250,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.drive_file_rename_outline),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                          EmailValidator(
                              errorText: "Please enter a valid email")
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: pwdController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                        ]),
                        obscureText: _isHidden,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 300,
                        height: 40,
                        child: RoundButton(
                          title: 'Create Account',
                          loading: loading,
                          onTap: () async {
                            setState(() {
                              // loading = true;
                            });

                            if (_formkey.currentState!.validate()) {
                              _auth
                                  .createUserWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: pwdController.text.toString(),
                              )
                                  .then((value) {
                                Utils().toastMessage('Successfully Registered');
                                setState(() {
                                  // loading = false;
                                });
                              }).onError((error, stackTrace) {
                                Utils().toastMessage(error.toString());
                                setState(() {
                                  loading = false;
                                });
                              });
                              Get.to(ProfileScreen());
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Already have an Account ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(SignIn());
                            },

                            child: Text(
                              'Sign in',
                              style:
                                  TextStyle(fontSize: 25.0, color: Colors.blue),
                            ),

                            // color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
