 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
import '../../../../ShardPrephrans/SherdPrphrans.dart';
import '../../api/serverApi.dart';
import '../Home_Page.dart';
import '../Model/Favorite.dart';
import '../Model/HomeModel.dart';
import '../Model/getFavorite.dart';
import '../Pages/Favorites.dart';
import '../Pages/Gategories.dart';
import '../Pages/Settings.dart';
import 'HomeState.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitHomeStates());
  static HomeCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  void changStates(int index, context) {
    CurrentIndex = index;

    emit(ChangIndex());
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Categories"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
  ];
  List<Widget> itemsIcons = [
    Icon(Icons.home),
    Icon(Icons.apps),
    Icon(Icons.favorite),
    Icon(Icons.settings),
  ];
  List<Widget> listWidget = [
    Home_Page(),
    Categories_Page(),
    Favrotes_Page(),
    Settings_Page()
  ];
  ModelHome modelHome = new ModelHome();
  Map<int, bool> isfavortTest = {};
  getData() {
    emit(LodingHome());
    ServerApi.getData(
            Uri: "home",
            lang: "ar",
            token:
                "0NENVfNrDTKCzNPGd2BSD8GCBLVlTQkNYLgbrhxFoi8mJKWh946SIfHq9U9ECvy4Lr45hZ")
        .then((value) {
      print(
          "mohammedHome      Homr       hOme       Homr elkjldjgljdlgjljdsjlgj ");
      print(value.data.toString());

      modelHome = ModelHome.fronJson(json: value.data);
      print(modelHome.dataHome!.products[0].in_favorites);
      print(modelHome.dataHome!.banners[0].image.toString());
      print(value.data.toString());
      modelHome.dataHome!.products.forEach((element) {
        isfavortTest.addAll({element.id: element.in_favorites});
      });
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print(isfavortTest.toString());
      emit(SuccuflyHome());
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
      emit(ErrorHome());
    });
  }

  bool isFavorite = false;

  changFavorite(bool? isfavortebool) {
    isFavorite = isfavortebool ?? true;
    emit(BoolISFavorite());
  }

  ModelFavortie? modelFavortie;
  postfavorte(int? id) {
    getDataFavortie();
    isfavortTest[id!] = !isfavortTest[id]!;
    emit(LodingFavorite());
    ServerApi.postData(
      path: 'favorites',
      data: {'product_id': id},
    ).then((value) {
      print(value.data.toString());
      modelFavortie = ModelFavortie.fromJson(json: value.data);
      getDataFavortie();
      Fluttertoast.showToast(
          msg: modelFavortie!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(SuccuflyFavorite());
    }).catchError((onError) {
      print(onError.toString());
      Fluttertoast.showToast(
          msg: modelFavortie!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ErrorFavorite());
    });
  }

  bool isListtogrid = false;
  changListToGrid() {
    isListtogrid = !isListtogrid;
    emit(IsListToGrid());
  }

  GetFavortie getFavortie = new GetFavortie();

  getDataFavortie() {
    emit(LodingGetFavorite());
    ServerApi.getData(
      Uri: "favorites",
      lang: "ar",
      token: CachShpreaf.getdata(key: "Token").toString(),
    ).then((value) {
      print(
          "mohammedHome      Homr       hOme       Homr elkjldjgljdlgjljdsjlgj ");
      print(value.data.toString());

      getFavortie = GetFavortie.fromJson(json: value.data);
      // print(getFavortie);
      // print(getFavortie.dataHome!.banners[0].image.toString());
      print(value.data.toString());
      Fluttertoast.showToast(
          msg: 'Ok',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // modelHome.dataHome!.products.forEach((element) {
      //   isfavortTest.addAll({element.id: element.in_favorites});
      // });
      // print(isfavortTest.toString());
      emit(SuccuflyGetFavorite());
    }).catchError((onError) {
      print(onError.toString());
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ErrorGetFavorite());
    });
  }
}
