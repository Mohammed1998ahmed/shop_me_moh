import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../ShardPrephrans/SherdPrphrans.dart';
import '../../api/serverApi.dart';
import '../Model/Category.dart';
import 'CategoryStates.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(InitCategoryStates());
  static CategoryCubit get(context) => BlocProvider.of(context);

  Category? category;
  getDataCategory() {
    emit(LodingGetCategory());
    ServerApi.getData(
      Uri: "categories",
      lang: "ar",
      token: CachShpreaf.getdata(key: "Token").toString(),
    ).then((value) {
      print(
          "mohammedHome      Homr       hOme       Homr elkjldjgljdlgjljdsjlgj ");
      print(value.data.toString());

      category = Category.fromJson(json: value.data);

      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // print(isfavortTest.toString());
      print(
          "objectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectmmmmmmmmmmmm");
      emit(SuccuflyGetCategory());
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(onError.toString());
      emit(ErrorGetCategory());
    });
  }
}
