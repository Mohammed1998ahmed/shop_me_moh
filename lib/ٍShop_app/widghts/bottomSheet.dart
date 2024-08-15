import 'package:flutter/material.dart';

class W3 extends StatefulWidget {
  const W3({Key? key}) : super(key: key);

  @override
  State<W3> createState() => _W3State();
}

class _W3State extends State<W3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            child: Text("Buttom Shat"),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (cintext) => Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(200),
                                topRight: Radius.circular(200))),
                      ));
            }),
      ),
    );
  }
}
