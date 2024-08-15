import 'package:flutter/material.dart';
 
import '../../../../ShardPrephrans/SherdPrphrans.dart';

class Settings_Page extends StatelessWidget {
  const Settings_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 130,
            height: 60,
            child: MaterialButton(
              color: Colors.amber,
              onPressed: () {
                CachShpreaf.putString(key: "lang", value: "ar");
                CachShpreaf.remove(key: "Token");
              },
              child: Text(
                "العربية",
                style: TextStyle(fontSize: 25, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 130,
            height: 60,
            child: MaterialButton(
              color: Colors.pink,
              onPressed: () {
                CachShpreaf.putString(key: "lang", value: "en");
              },
              child: Text(
                "Engilsh",
                style: TextStyle(fontSize: 25, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      )),
    );
  }
}
