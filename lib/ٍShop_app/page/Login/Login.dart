import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
 
import '../../Comp/staticWidght.dart';
import '../Home_Page/Home_Page.dart';
import '../Rigister/Rigister.dart';
import 'Cubit/States.dart';
import 'Cubit/cubit.dart';

class Login_Page extends StatelessWidget {
  Login_Page({Key? key}) : super(key: key);
  TextEditingController? controller_Email = TextEditingController();

  TextEditingController? controller_PassWord = TextEditingController();
  var KeyTextFaild = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var c = LoginCubit.get(context);

    bool isPass = false;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccesfulyLogin) {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const Home_Page(),
            ),
          );
        }
      },
      builder: (context, state) {
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
                        Container(
                            alignment: AlignmentDirectional.center,
                            height: 250,
                            child: Image.asset(
                              "assets/images/4.jpg",
                              fit: BoxFit.cover,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "L",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "O",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "G",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "I",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " N",
                              style: TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Login now to browse our hot offers",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        deTextFromFaild(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " Enter Email";
                              } else {
                                return "";
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: controller_Email,
                            onChanged: (value) {
                              print(value.toString());
                            },
                            border: OutlineInputBorder(),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            hintText: "Enter Email",
                            prefixIcon: Icon(Icons.email)),
                        SizedBox(
                          height: 15,
                        ),
                        deTextFromFaild(
                            ispassword: c.showPassWord,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " Enter PassWord";
                              } else {
                                return "";
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller_PassWord,
                            onChanged: (value) {
                              print(value.toString());
                            },
                            border: OutlineInputBorder(),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            hintText: "Enter PassWord",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                c.changShowPassWord();
                              },
                            ),
                            prefixIcon: Icon(Icons.lock)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: state is LodingLogin
                              ? const Center(
                                  child: SpinKitSpinningLines(
                                  color: Colors.orange,
                                  size: 50,
                                ))
                              : dfmaterialButton(
                                  onPressed: () {
                                    c.changButtom();
                                    if (KeyTextFaild.currentState!
                                        .validate()) {}
                                    c.postDataLogin(
                                        Email: controller_Email!.text,
                                        PassWord: controller_PassWord!.text);

                                    print(controller_Email!.text.toString());
                                    print(controller_PassWord!.text.toString());
                                  },
                                  color: Colors.white,
                                  title: "LOGIN",
                                ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don \' have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          Rigister_Ppage(),
                                    ),
                                  );
                                },
                                child: Text("REGISTER"))
                          ],
                        )
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
