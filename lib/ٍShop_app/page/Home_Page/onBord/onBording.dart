import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../Login/Login.dart';
 
class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  State<Test1> createState() => _TestState();
}

class _TestState extends State<Test1> {
  int currentindex = 0;
  final pages = [
    DefuiltContainar(
        color: Colors.yellowAccent, nameimage: "assets/images/1.jpg"),
    DefuiltContainar(color: Colors.orange, nameimage: "assets/images/3.jpg"),
    DefuiltContainar(color: Colors.red, nameimage: "assets/images/4.jpg"),
    DefuiltContainar(color: Colors.pink, nameimage: "assets/images/5.jpg"),
    DefuiltContainar(color: Colors.white, nameimage: "assets/images/6.jpg"),
    DefuiltContainar(color: Colors.green, nameimage: "assets/images/7.jpg"),
    DefuiltContainar(color: Colors.black, nameimage: "assets/images/8.jpg"),
    DefuiltContainar(color: Colors.redAccent, nameimage: "assets/images/9.jpg"),
    DefuiltContainar(color: Colors.blue, nameimage: "assets/images/10.jpg"),
    DefuiltContainar(
        color: Colors.redAccent, nameimage: "assets/images/11.jpg"),
    DefuiltContainar(color: Colors.yellow, nameimage: "assets/images/13.jpg"),
    DefuiltContainar(
        color: Colors.greenAccent, nameimage: "assets/images/16.png"),
  ];
  var controller = LiquidController();
  var controllerpage = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            LiquidSwipe(
              liquidController: controller,
              enableSideReveal: true,
              pages: pages,
              enableLoop: true,
              slideIconWidget: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            Positioned(
                bottom: 20,
                left: 16,
                right: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => Login_Page(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "S",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                              Text(
                                "k",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 25),
                              ),
                              Text(
                                "I",
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 25),
                              ),
                              Text(
                                "P",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ],
                          )),
                    ),
                    // SmoothPageIndicator(
                    //   controller: controllerpage,
                    //   count: 4,
                    //   effect: WormEffect(
                    //       activeDotColor: Colors.black,
                    //       dotColor: Colors.redAccent,
                    //       dotWidth: 30,
                    //       paintStyle: PaintingStyle.stroke,
                    //       type: WormType.thin),
                    //   onDotClicked: (index) {
                    //     print(index.toString());
                    //     controller.animateToPage(page: index);
                    //   },
                    // ),
                    // TextButton(
                    //     onPressed: () {
                    //       final page = controller.currentPage + 1;
                    //       controller.animateToPage(
                    //           page: page > 4 ? 0 : page, duration: 500);
                    //     },
                    //     child: Text(
                    //       "NEXT",
                    //       style: TextStyle(color: Colors.white, fontSize: 25),
                    //     )),
                  ],
                )),
          ],
        ));
    // Center(
    //     child: Container(
    //   color: Colors.red,
    //   width: 300,
    //   height: 150,
    //   child: FittedBox(
    //     child: Text(
    //       "Mohammed",
    //       style: TextStyle(fontSize: 600),
    //     ),
    //   ),
    // )),
  }
}

class DefuiltContainar extends StatelessWidget {
  const DefuiltContainar({
    Key? key,
    this.color,
    this.nameimage,
    this.title,
    this.subtite,
  }) : super(key: key);
  final Color? color;
  final String? nameimage;
  final String? title;
  final String? subtite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color ?? Colors.pinkAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 350,
                height: 450,
                // clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage(nameimage.toString()),
                        fit: BoxFit.fill)),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
