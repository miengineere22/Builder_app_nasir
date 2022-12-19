import 'dart:io';
import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:buildapp/controller/main_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:buildapp/Utils/utils.dart';
import 'package:buildapp/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateBids extends StatefulWidget {
  const CreateBids({Key? key}) : super(key: key);
  _CreateBidsState createState() => _CreateBidsState();
}

class _CreateBidsState extends State<CreateBids> {
  MainController controller = Get.put(MainController());

  final database = FirebaseFirestore.instance.collection("Bits");

  bool loading = false;
  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final priceController = TextEditingController();
  final phoneController = TextEditingController();
  final postController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth ref = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final postRef = FirebaseDatabase.instance.reference().child('Posts');

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Bids'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
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
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                      key: _formkey,
                      child: Column(children: [
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          controller: titleController,
                          validator: RequiredValidator(errorText: 'Required*'),
                          decoration: InputDecoration(
                            labelText: 'Work Title',
                            hintText: "Enter Work title",
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'Required*'),
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: 'User Name',
                            hintText: "Enter User Name",
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'Required*'),
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: "Enter your Email",
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'Required*'),
                          controller: locationController,
                          decoration: InputDecoration(
                            labelText: 'Location',
                            hintText: "Enter your location",
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'Required*'),
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Price (PKR)',
                            hintText: "Set a price",
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'Required*'),
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintText: "Enter you phone number",
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'Required*'),
                          minLines: 1,
                          maxLines: 5,
                          controller: postController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            hintText: "Enter full detiles",
                          ),
                        ),
                        SizedBox(height: 15),
                        RoundButton(
                            title: 'Post Bids',
                            // loading: loading,
                            onTap: () async {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  //   loading = true;
                                });
                                try {
                                  var date =
                                      DateTime.now().millisecondsSinceEpoch;

                                  // firebase_storage.Reference ref =
                                  //     firebase_storage.FirebaseStorage.instance
                                  //         .ref('/Post$date');
                                  // UploadTask uploadTask =
                                  //     ref.putFile(_image!.absolute);
                                  // await Future.value(uploadTask);
                                  // var newUrl = await ref.getDownloadURL();

                                  final user =
                                      FirebaseAuth.instance.currentUser;
                                  await database.add({
                                    'pid': date.toString(),
                                    // '_pImage': newUrl.toString(),
                                    '_pTime': date.toString(),
                                    '_pTitle': titleController.text.toString(),
                                    '_pLocation':
                                        locationController.text.toString(),
                                    '_pUserName':
                                        usernameController.text.toString(),
                                    '_pUserEmail':
                                        emailController.text.toString(),
                                    '_pPrice':
                                        'Rs.' + priceController.text.toString(),

                                    '_pPhone': phoneController.text.toString(),
                                    '_pDescription':
                                        postController.text.toString(),
                                    '_uEmail': user!.email.toString(),
                                    '_uId': user.uid.toString(),
                                  }).then((value) {
                                    Utils().toastMessage('Bids added');
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

                                controller.userLoading();
                                Get.to(BottomNavigationBarScreen());
                              }
                            }),
                      ])),
                ),
              ],
            ),
          ),
        ));
  }
}
