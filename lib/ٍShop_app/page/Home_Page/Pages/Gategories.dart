import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/CategoryStates.dart';
import '../Cubit/CubitCategory.dart';
 
 

class Categories_Page extends StatelessWidget {
  Categories_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = CategoryCubit.get(context);
    return BlocConsumer<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                height: 100,
                child: Row(children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        c.category!.dataGategory!.datagatg[index].image
                            .toString(),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        child: Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  c.category!.dataGategory!.datagatg[index].name
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),

                            /////////////////////////
                            ///

                            // Row(
                            //   children: [
                            //     Text(
                            //       c.modelHome.dataHome!.products[index].price
                            //               .round()
                            //               .toString() +
                            //           "\$",
                            //       style:
                            //           TextStyle(fontSize: 14, color: Colors.blue),
                            //     ),
                            //     c.modelHome.dataHome!.products[index].discount > 0
                            //         ? Text(
                            //             "  " +
                            //                 c.modelHome.dataHome!.products[index]
                            //                     .old_price
                            //                     .round()
                            //                     .toString() +
                            //                 "\$",
                            //             style: TextStyle(
                            //               fontSize: 14,
                            //               color: Colors.grey,
                            //               decoration: TextDecoration.lineThrough,
                            //             ),
                            //           )
                            //         : Text(""),
                            //     Spacer(),
                            //     c.isfavortTest[
                            //             c.modelHome.dataHome!.products[index].id]!
                            //         ? IconButton(
                            //             onPressed: () {
                            //               c.postfavorte(c.modelHome.dataHome!
                            //                   .products[index].id);
                            //               // c.changFavorite();
                            //               print(c.isfavortTest.toString() +
                            //                   "kjhkhjkhhkhh");

                            //               print("object");
                            //             },
                            //             icon: Icon(
                            //               Icons.favorite,
                            //               size: 30,
                            //               color: Colors.red,
                            //             ))
                            //         : IconButton(
                            //             onPressed: () {
                            //               c.postfavorte(c.modelHome.dataHome!
                            //                   .products[index].id);
                            //               // c.changFavorite();
                            //               print(c.isfavortTest.toString() +
                            //                   "kjhkhjkhhkhh");

                            //               print("object");
                            //             },
                            //             icon: Icon(
                            //               Icons.favorite_border_outlined,
                            //               size: 30,
                            //               color: Colors.red,
                            //             )),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.all(3.0),
                  //     child: Column(children: [
                  //       Text(
                  //         c.modelHome.dataHome!.products[index]
                  //                 .price
                  //                 .round()
                  //                 .toString() +
                  //             "\$",
                  //         style: TextStyle(
                  //             fontSize: 14, color: Colors.blue),
                  //       ),
                  //       Text(
                  //         "  " +
                  //             c.modelHome.dataHome!.products[index]
                  //                 .old_price
                  //                 .round()
                  //                 .toString() +
                  //             "\$",
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Colors.grey,
                  //           decoration: TextDecoration.lineThrough,
                  //         ),
                  //       ),
                  //       Spacer(),
                  //       c.isfavortTest[c.modelHome.dataHome!
                  //               .products[index].id]!
                  //           ? IconButton(
                  //               onPressed: () {
                  //                 c.postfavorte(c
                  //                     .modelHome
                  //                     .dataHome!
                  //                     .products[index]
                  //                     .id);
                  //                 // c.changFavorite();
                  //                 print(c.isfavortTest.toString() +
                  //                     "kjhkhjkhhkhh");

                  //                 print("object");
                  //               },
                  //               icon: Icon(
                  //                 Icons.favorite,
                  //                 size: 30,
                  //                 color: Colors.red,
                  //               ))
                  //           : IconButton(
                  //               onPressed: () {
                  //                 c.postfavorte(c
                  //                     .modelHome
                  //                     .dataHome!
                  //                     .products[index]
                  //                     .id);
                  //                 // c.changFavorite();
                  //                 print(c.isfavortTest.toString() +
                  //                     "kjhkhjkhhkhh");

                  //                 print("object");
                  //               },
                  //               icon: Icon(
                  //                 Icons.favorite_border_outlined,
                  //                 size: 30,
                  //                 color: Colors.red,
                  //               )),
                  //     ]))
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        textDirection: TextDirection.rtl,
                      ))
                ]),
              ),
            );
          },
          itemCount: c.category!.dataGategory!.datagatg.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      },
      listener: (context, status) {},
    );
  }
}
// import 'package:carousel_slider/carousel_slider.dart';

// import 'package:flutter/material.dart';

// options: CarouselOptions(

//               height: 180.0,

//               enlargeCenterPage: true,

//               autoPlay: true,

//               aspectRatio: 16 / 9,

//               autoPlayCurve: Curves.fastOutSlowIn,

//               enableInfiniteScroll: true,

//               autoPlayAnimationDuration: Duration(milliseconds: 800),

//               viewportFraction: 0.8,

//             ),

//         ),

//       ],

// class  HomePage extends StatelessWidget {

//   @override

//   Widget build(BuildContext context) {

//     return Scaffold(

//       appBar: AppBar(

//         title: Text("GFG Slider"),

//       ),

//       body: ListView(

//         children: [

//           CarouselSlider(

//               items: [

//                 //1st Image of Slider

//                 Container(

//                   margin: EdgeInsets.all(6.0),

//                   decoration: BoxDecoration(

//                     borderRadius: BorderRadius.circular(8.0),

//                     image: DecorationImage(

//                       image: NetworkImage("ADD IMAGE URL HERE"),

//                       fit: BoxFit.cover,

//                     ),

//                   ),

//                 ),

//                 //2nd Image of Slider

//                 Container(

//                   margin: EdgeInsets.all(6.0),

//                   decoration: BoxDecoration(

//                     borderRadius: BorderRadius.circular(8.0),

//                     image: DecorationImage(

//                       image: NetworkImage("ADD IMAGE URL HERE"),

//                       fit: BoxFit.cover,

//                     ),

//                   ),

//                 ),

//                 //3rd Image of Slider

//                 Container(

//                   margin: EdgeInsets.all(6.0),

//                   decoration: BoxDecoration(

//                     borderRadius: BorderRadius.circular(8.0),

//                     image: DecorationImage(

//                       image: NetworkImage("ADD IMAGE URL HERE"),

//                       fit: BoxFit.cover,

//                     ),

//                   ),

//                 ),

//                 //4th Image of Slider

//                 Container(

//                   margin: EdgeInsets.all(6.0),

//                   decoration: BoxDecoration(

//                     borderRadius: BorderRadius.circular(8.0),

//                     image: DecorationImage(

//                       image: NetworkImage("ADD IMAGE URL HERE"),

//                       fit: BoxFit.cover,

//                     ),

//                   ),

//                 ),
