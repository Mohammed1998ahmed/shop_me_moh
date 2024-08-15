import 'package:flutter/material.dart';

Text text(
        {required String title,
        double? fontSize,
        FontWeight? fontWeight,
        Color? color,
        TextAlign? textAlign}) =>
    Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize ?? 18,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Colors.red),
    );

TextFormField deTextFromFaild(
    {void Function(String)? onChanged,
    String? Function(String?)? validator,
    TextEditingController? controller,
    InputBorder? border,
    TextInputType? keyboardType,
    TextStyle? hintStyle,
    bool ispassword = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? hintText}) {
  return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      obscureText: ispassword,
      decoration: InputDecoration(
        border: border,
        hintStyle: hintStyle,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ));
}

MaterialButton dfmaterialButton(
    {GlobalKey<FormState>? KeyTextFaild,
    required void Function()? onPressed,
    Color? color,
    required String title}) {
  return MaterialButton(
    color: Colors.blue,
    onPressed: onPressed,
    child: text(
      title: title,
      color: color ?? Colors.white,
    ),
  );
}

class ComToken {
  String? Token;
  void setToken(String token) {
    Token = token;
  }

  String? getToken() {
    return Token;
  }
}
