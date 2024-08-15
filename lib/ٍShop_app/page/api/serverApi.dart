import 'dart:io';

import 'package:dio/dio.dart';
 
import '../../../ShardPrephrans/SherdPrphrans.dart';

class ServerApi {
  static Dio? dio;
  static void init() {
    CachShpreaf.sevedata(key: "lang", value: "en");
    dio = Dio(
      BaseOptions(
          baseUrl: "http://student.valuxapps.com/api/",
          receiveDataWhenStatusError: true,
          headers: {"Content-Type": "application/json", "lang": "ar"}),
    );
  }

  static Future<Response> getData(
      {required String Uri,
      Map<String, dynamic>? queryParameters,
      String? lang,
      String? token}) {
    dio!.options.headers = {
      "lang": CachShpreaf.getdata(key: "lang").toString(),
      "Content-Type": "application/json",
      "Authorization": CachShpreaf.getdata(key: "Token").toString()
    };
    return dio!.get(
      Uri,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> uploadImageToServer(File imageFile, String name,
      String phone, String email, String passWord) async {
    String fileName = imageFile.path.split('/').last;
    print(fileName.toString());
    print("IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");

    FormData formData = FormData.fromMap({
      "image":
          await MultipartFile.fromFile(imageFile.path, filename: "image.jpg"),
      "name": name,
      "phone": phone,
      "email": email,
      "password": passWord, // يمكنك استخدام هذا الحقل لإرسال بيانات كمان
    });

    try {
      return Dio().post(
        "http://student.valuxapps.com/api/register",
        data: formData,
        options: Options(
          contentType: 'application/json',
        ),
      );

      // if (response.statusCode == 200) {
      //   print(
      //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkuuuuuuuuuuuuuu");
      //   return response.data['image_url'];
      // } else {
      //   throw Exception('Upload Failed');
      // }
    } catch (e) {
      throw Exception(
          'Upload FailedRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR');
    }
  }

  static Future<Response> postDataRegister({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio!.post(path,
        data: data, queryParameters: queryParameters, options: options);
  }

  static Future<Response> postData({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio!.post(path,
        data: data, queryParameters: queryParameters, options: options);
  }

  static Future<Response> deletData({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio!.delete(path,
        data: data, queryParameters: queryParameters, options: options);
  }

  static Future<Response> updataData({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio!.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
