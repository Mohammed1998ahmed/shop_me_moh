import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  ImageDetail({Key? key, this.image}) : super(key: key);
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Image.network(
            image.toString(),
            width: double.infinity,
            height: double.infinity,
          )),
    );
  }
}
