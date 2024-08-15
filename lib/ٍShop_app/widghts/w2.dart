import 'package:flutter/material.dart';

class Banner1 extends StatefulWidget {
  const Banner1({Key? key}) : super(key: key);

  @override
  State<Banner1> createState() => _BannerState();
}

class _BannerState extends State<Banner1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
        child: Icon(Icons.abc),
        onPressed: () {
          print("object");
          ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
              backgroundColor: Colors.black,
              content: Text(
                "mohammed",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    },
                    icon: Icon(Icons.add))
              ]));
        },
      )),
    );
  }
}
