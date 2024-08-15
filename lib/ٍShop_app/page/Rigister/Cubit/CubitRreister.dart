// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
import '../../../../ShardPrephrans/SherdPrphrans.dart';
import '../../api/serverApi.dart';
import 'Model/modelReister.dart';
import 'StatesReister.dart';

class ReisterCubit extends Cubit<ReisterStates> {
  ReisterCubit() : super(InitReister());

  static ReisterCubit get(context) => BlocProvider.of(context);
  bool isButtom = false;

  void changButtom() {
    isButtom = !isButtom;
    emit(BooleanButton());
  }

  bool isShow = true;

  void changisShow() {
    isShow = !isShow;
    emit(BooleanButton());
  }

  ModelRegister modelRegister = new ModelRegister();
  postDataReister(
      {required File imageFile,
      required String Email,
      required String Name,
      required String PassWord,
      required String Phone}) async {
    List<int> fileBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(fileBytes);
    print(base64Image.toString() +
        "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
    emit(LodingReister());
    ServerApi.postData(
      path: "register",
      data: {
        "image": base64Image,
        //     await MultipartFile.fromFile(imageFile.path, filename: "image.jpg"),
        "name": Name,
        "phone": Phone,
        "email": Email,
        "password": PassWord,
      },
    ).then((value) {
      print("Reister Moham,med mohran to Abo Dubi");
      print(value.data.toString());
      modelRegister = ModelRegister.fromJson(json: value.data);
      CachShpreaf.sevedata(key: "Token", value: modelRegister.data!.token);

      print(modelRegister.data!.image.toString());

      print(modelRegister.message);
      Fluttertoast.showToast(
          msg: modelRegister.message ?? "",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("mohammed Mohamemmd Mohamedd Mohammed Mohammed" +
          CachShpreaf.getdata(key: "Token").toString());
      emit(SuccesfulyReister());
    }).catchError((onError) {
      print(onError.toString());
      Fluttertoast.showToast(
          msg: modelRegister.message ?? "",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ErrorReister());
    });
  }
}
