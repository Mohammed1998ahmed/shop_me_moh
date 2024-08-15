import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
import '../../../../ShardPrephrans/SherdPrphrans.dart';
import '../../api/serverApi.dart';
import '../model/modelLogin.dart';
import 'States.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitLogin());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isButtom = false;

  void changButtom() {
    isButtom = !isButtom;
    emit(BooleanButton());
  }

  bool showPassWord = true;

  void changShowPassWord() {
    showPassWord = !showPassWord;
    emit(ShowPassWord());
  }

  ModelLogin modelLogin = new ModelLogin();
  postDataLogin({required String Email, required String PassWord}) {
    print("pass:" + PassWord);
    print("Email:" + Email);
    emit(LodingLogin());
    ServerApi.postData(path: "login", data: {
      "email": Email,
      "password": PassWord,
    }).then((value) {
      print(value.toString());
      modelLogin = ModelLogin.fromJson(json: value.data);
      print(modelLogin.message.toString());
      CachShpreaf.sevedata(key: "Token", value: modelLogin.data!.token);
      ServerApi.postData(path: modelLogin.data!.token.toString());
      Fluttertoast.showToast(
          msg: modelLogin.message ?? "",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      print("mohammedmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      print("mohammed Mohamemmd Mohamedd Mohammed Mohammffffffffffffffffed" +
          CachShpreaf.getdata(key: "Token").toString());
      emit(SuccesfulyLogin());
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: modelLogin.message ?? "",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ErrorLogin());
    });
  }
}
