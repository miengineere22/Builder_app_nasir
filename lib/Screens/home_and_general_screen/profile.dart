import 'dart:io';
import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:buildapp/Utils/utils.dart';
import 'package:buildapp/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  // ProfileScreen({Key key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<ProfileScreen> {
  @override
  // bool _isHidden = true;
  bool loading = false;
  final unameController = TextEditingController();
  final uemailController = TextEditingController();
  final ucountryController = TextEditingController();
  final ustateController = TextEditingController();
  final ucityController = TextEditingController();
  final uhomeController = TextEditingController();
  final uworktitleController = TextEditingController();
  final uexperienceController = TextEditingController();
  final uteammemberController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  // String cust_name;
  // String email;
  // String password;
  //
  final _formkey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();

  FirebaseStorage storage = FirebaseStorage.instance;
  final userRef = FirebaseDatabase.instance.reference().child('Users');
  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image picked');
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image picked');
      }
    });
  }

  void dialog(context) {
    showDialog(
      context: context,
      builder: ((BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          content: Container(
            height: 120,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    getImageCamera();
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    getImageGallery();
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 10,
              right: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.all(15.0),
                    //   child: CircularProfileAvatar(
                    //     '',
                    //     backgroundColor: Colors.brown,
                    //     // child: FlutterLogo(),
                    //     borderColor: Colors.purpleAccent,
                    //     borderWidth: 5,
                    //     elevation: 2,
                    //     radius: 70,
                    //     child: IconButton(
                    //       icon: Icon(
                    //         Icons.camera_alt,
                    //         color: Colors.white,
                    //       ),
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        dialog(context);
                      },
                      child: Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * 1,
                            child: _image != null
                                ? ClipRect(
                                    child: Image.file(
                                      _image!.absolute,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 100,
                                    height: 100,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.blue,
                                    ),
                                  )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: unameController,
                        // keyboardType: TextInputType.text,
                        validator: RequiredValidator(errorText: 'Required*'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.drive_file_rename_outline),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: uemailController,
                        // keyboardType: TextInputType.text,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                          EmailValidator(
                              errorText: "Please enter a valid email")
                        ]),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: ucountryController,
                        // keyboardType: TextInputType.text,
                        validator: RequiredValidator(errorText: 'Required*'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Country',
                          prefixIcon: Icon(Icons.flag),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: ustateController,
                        // keyboardType: TextInputType.text,
                        validator: RequiredValidator(errorText: 'Required*'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'State',
                          prefixIcon: Icon(Icons.home),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: ucityController,
                        // keyboardType: TextInputType.text,
                        validator: RequiredValidator(errorText: 'Required*'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'City',
                          prefixIcon: Icon(Icons.home),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: uhomeController,
                        // keyboardType: TextInputType.text,
                        validator: RequiredValidator(errorText: 'Required*'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Home Address',
                          prefixIcon: Icon(Icons.home),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: uworktitleController,
                        // keyboardType: TextInputType.text,
                        validator: RequiredValidator(errorText: 'Required*'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Work Title',
                          prefixIcon: Icon(Icons.group_work),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: uexperienceController,
                        // keyboardType: TextInputType.text,
                        validator: RequiredValidator(errorText: 'Required*'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Experience',
                          prefixIcon: Icon(Icons.work),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: uteammemberController,
                        // keyboardType: TextInputType.text,/
                        validator: RequiredValidator(errorText: 'Required*'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Team Members',
                          prefixIcon: Icon(Icons.group),
                        ),
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
                              title: 'Save',
                              loading: loading,
                              onTap: () async {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  try {
                                    int date =
                                        DateTime.now().millisecondsSinceEpoch;
                                    // firebase_storage.Reference ref =
                                    //     firebase_storage.FirebaseStorage.instance
                                    //         .ref('/Post$date');
                                    // UploadTask uploadTask =
                                    //     ref.putFile(_image!.absolute);
                                    // await Future.value(uploadTask);
                                    // var newUrl = await ref.getDownloadURL();

                                    // final User? user = _auth.currentUser;

                                    userRef
                                        .child(
                                            _auth.currentUser!.uid.toString())
                                        .set({
                                      '_uid': date.toString(),
                                      // '_pImage': newUrl.toString(),
                                      '_uTime': date.toString(),
                                      '_uName': unameController.text.toString(),
                                      '_uEmail':
                                          uemailController.text.toString(),
                                      '_uCountry':
                                          ucountryController.text.toString(),
                                      '_uState':
                                          ustateController.text.toString(),
                                      '_uCity': ucityController.text.toString(),
                                      '_uHome': uhomeController.text.toString(),
                                      '_uWorkTitle':
                                          uworktitleController.text.toString(),
                                      '_uTeam':
                                          uteammemberController.text.toString(),
                                      "userId":
                                          _auth.currentUser!.uid.toString()
                                      // '_uEmail': user!.uemail.toString(),
                                      // '_uId': user.uid.toString(),
                                    }).then((value) {
                                      Utils().toastMessage(
                                          'Create profile successfully');
                                      setState(() {
                                        loading = false;
                                      });
                                    }).onError((error, stackTrace) {
                                      Utils().toastMessage(error.toString());

                                      setState(() {
                                        loading = false;
                                      });
                                    });
                                  } catch (e) {
                                    setState(() {
                                      loading = false;
                                    });
                                    Utils().toastMessage(e.toString());
                                  }
                                  // }
                                }
                                Get.to(BottomNavigationBarScreen());
                              })),
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
