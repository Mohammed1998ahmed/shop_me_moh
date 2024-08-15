// ignore_for_file: file_names, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
 
import '../../Comp/staticWidght.dart';
import '../Home_Page/Home_Page.dart';
import 'Cubit/CubitRreister.dart';
import 'Cubit/StatesReister.dart';

class Rigister_Ppage extends StatefulWidget {
  @override
  State<Rigister_Ppage> createState() => _Rigister_PpageState();
}

class _Rigister_PpageState extends State<Rigister_Ppage> {
  // Rigister_Ppage({Key? key}) : super(key: key);
  bool isvisistypassWord = true;

  TextEditingController? controller_Email = TextEditingController();

  TextEditingController? controller_Phone = TextEditingController();

  TextEditingController? controller_Name = TextEditingController();

  TextEditingController? controller_PassWord = TextEditingController();

  var KeyTextFaild = GlobalKey<FormState>();

  File imageFile = File('file.txt');

  final picker = ImagePicker();

  // Future getImage() async {
  //   print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
  //   print(imageFile.toString());
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       imageFile = File(pickedFile.path);
  //       print(imageFile.toString());
  //     } else {
  //       print("No image selected..");
  //     }
  //   });
  // }
Future getImage() async {
  print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
  print(imageFile.toString());
  final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  setState(() {
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      print(imageFile.toString());
    } else {
      print("No image selected..");
    }
  });
}
  @override
  Widget build(BuildContext context) {
    var c = ReisterCubit.get(context);
    return BlocConsumer<ReisterCubit, ReisterStates>(
      listener: (context, state) {
        if (state is SuccesfulyReister) {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const Home_Page(),
            ),
          );
        }
      },
      builder: (context, states) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: KeyTextFaild,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "R",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "e",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "g",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "i",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "s",
                              style: TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "t",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "e",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "r",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 50,
                            ),
                          ),
                          onTap: () async {
                            await getImage();
                          },
                        ),
                        Center(
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            height: 200,
                            width: 200,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: imageFile == null
                                ? BoxDecoration(
                                    border:
                                        Border.all(color: Colors.red, width: 5),
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/1.jpg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange)
                                : BoxDecoration(
                                    border:
                                        Border.all(color: Colors.red, width: 5),
                                    image: DecorationImage(
                                        image: FileImage(imageFile),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange),
                          ),
                        ),
                        text(
                            title: "Login now to browse our hot offers",
                            fontSize: 18,
                            color: Colors.grey),
                        SizedBox(
                          height: 15,
                        ),
                        deTextFromFaild(
                            border: OutlineInputBorder(),
                            controller: controller_Phone,
                            hintText: "Enter Phone",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              print("Phone");
                            },
                            prefixIcon: Icon(Icons.phone),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Phone";
                              } else {
                                return "";
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        deTextFromFaild(
                            border: OutlineInputBorder(),
                            controller: controller_Email,
                            hintText: "Enter Email",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              print("Email");
                            },
                            prefixIcon: Icon(Icons.email),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Email";
                              } else {
                                return "";
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        deTextFromFaild(
                            border: OutlineInputBorder(),
                            controller: controller_Name,
                            hintText: "Enter Name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              print("Name");
                            },
                            prefixIcon: Icon(Icons.person),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Name";
                              } else {
                                return "";
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        deTextFromFaild(
                            ispassword: c.isShow,
                            border: OutlineInputBorder(),
                            controller: controller_PassWord,
                            hintText: "Enter PassWord",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              print("PassWord");
                            },
                            suffixIcon: IconButton(
                                onPressed: () {
                                  c.changisShow();
                                },
                                icon: c.isShow
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(Icons.remove_red_eye_outlined)),
                            prefixIcon: Icon(Icons.lock),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter PassWord";
                              } else {
                                return "";
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: states is LodingReister
                              ? Center(
                                  child: SpinKitSpinningLines(
                                  color: Colors.orange,
                                  size: 50,
                                ))
                              : dfmaterialButton(
                                  onPressed: () {
                                    c.changButtom();
                                    c.postDataReister(
                                        Email: controller_Email!.text,
                                        PassWord: controller_PassWord!.text,
                                        Name: controller_Name!.text,
                                        Phone: controller_Phone!.text,
                                        imageFile: imageFile);

                                    if (KeyTextFaild.currentState!
                                        .validate()) {}
                                    print("object");
                                  },
                                  KeyTextFaild: KeyTextFaild,
                                  title: "Register"),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
