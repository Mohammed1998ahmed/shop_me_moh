import 'package:flutter/material.dart';

class Moded {
  int number;
  String Textblod, Text;

  Moded({required this.number, required this.Textblod, required this.Text});
}

class OnBording_Page extends StatelessWidget {
  OnBording_Page({Key? key}) : super(key: key);
  PageController? controller_page = PageController();
  List<Moded> onbord = [
    Moded(number: 1, Textblod: "On Board 1 Title", Text: "on Borard 1 Body"),
    Moded(number: 2, Textblod: "On Board 2 Title", Text: "on Borard 2 Body"),
    Moded(number: 3, Textblod: "On Board 3 Title", Text: "on Borard 3 Body"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [TextButton(onPressed: () {}, child: Text("SKIP"))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                  controller: controller_page,
                  physics: BouncingScrollPhysics(),
                  itemCount: onbord.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/images/22.png"),
                              )),
                            ),
                          ),
                          Text(
                            onbord[index].Textblod,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            onbord[index].Text,
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Text(
                  "Indecetor ",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    print(controller_page!.initialPage);
                    controller_page!.nextPage(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInBack);
                  },
                  child: Center(
                      child: Icon(Icons.arrow_back_ios,
                          textDirection: TextDirection.rtl)),
                ),
              ],
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
