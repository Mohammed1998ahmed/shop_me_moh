 

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Cubit/CubitCategory.dart';
import '../Cubit/HomeCubit.dart';
import '../Cubit/HomeState.dart';
import 'details.dart';
 
class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = HomeCubit.get(context);
    var cat = CategoryCubit.get(context);

    return BlocConsumer<HomeCubit, HomeStates>(
        builder: (context, states) {
          return states is LodingHome
              ? Center(
                  child: SpinKitSpinningLines(
                  color: Colors.orange,
                  size: 100,
                ))
              : SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      child: ListView(
                        children: [
                          CarouselSlider(
                            items: [
                              //1st Image of Slider

                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(c
                                        .modelHome.dataHome!.banners[1].image
                                        .toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              //2nd Image of Slider

                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(c
                                        .modelHome.dataHome!.banners[2].image
                                        .toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              //3rd Image of Slider

                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(c
                                        .modelHome.dataHome!.banners[3].image
                                        .toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              //4th Image of Slider

                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(c
                                        .modelHome.dataHome!.banners[4].image
                                        .toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 180.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 0.8,
                            ),
                          ),
                        ],
                        shrinkWrap: true,
                      ),
                    ),
                    Container(
                      height: 140,
                      width: double.infinity,
                      color: Colors.white30,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gategory',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber),
                            ),
                            Expanded(
                              child: Container(
                                child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 100,
                                      width: 100,
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          Container(
                                              height: 150,
                                              width: 100,
                                              child: Image.network(cat
                                                  .category!
                                                  .dataGategory!
                                                  .datagatg[index]
                                                  .image
                                                  .toString())),
                                          Container(
                                              width: double.infinity,
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              child: Text(
                                                cat.category!.dataGategory!
                                                    .datagatg[index].name
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: cat
                                      .category!.dataGategory!.datagatg.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(
                                    width: 5,
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: c.isListtogrid
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 3 / 5.9,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemCount:
                                      c.modelHome.dataHome!.products.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    print(c.modelHome.dataHome!.products[index]
                                        .in_favorites);
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          DetailsHome(
                                                    products: c
                                                        .modelHome
                                                        .dataHome!
                                                        .products[index],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Card(
                                              elevation: 10,
                                              child: Stack(
                                                alignment: Alignment.bottomLeft,
                                                children: [
                                                  Container(
                                                    width: 300,
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        // border: Border.all(
                                                        //     width: 5.0, color: Colors.amber),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Image.network(
                                                      c.modelHome.dataHome!
                                                          .products[index].image
                                                          .toString(),
                                                      height: double.infinity,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.amber),
                                                    child: Text(
                                                      c
                                                                  .modelHome
                                                                  .dataHome!
                                                                  .products[
                                                                      index]
                                                                  .discount >
                                                              0
                                                          ? "discount" +
                                                              " " +
                                                              c
                                                                  .modelHome
                                                                  .dataHome!
                                                                  .products[
                                                                      index]
                                                                  .discount
                                                                  .toString() +
                                                              "%"
                                                          : "",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              c.modelHome.dataHome!
                                                  .products[index].name
                                                  .toString(),
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  c.modelHome.dataHome!
                                                          .products[index].price
                                                          .round()
                                                          .toString() +
                                                      "\$",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blue),
                                                ),
                                                c
                                                            .modelHome
                                                            .dataHome!
                                                            .products[index]
                                                            .discount >
                                                        0
                                                    ? Text(
                                                        "  " +
                                                            c
                                                                .modelHome
                                                                .dataHome!
                                                                .products[index]
                                                                .old_price
                                                                .round()
                                                                .toString() +
                                                            "\$",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                      )
                                                    : Text(""),
                                                Spacer(),
                                                c.isfavortTest[c
                                                        .modelHome
                                                        .dataHome!
                                                        .products[index]
                                                        .id]!
                                                    ? IconButton(
                                                        onPressed: () {
                                                          c.postfavorte(c
                                                              .modelHome
                                                              .dataHome!
                                                              .products[index]
                                                              .id);
                                                          // c.changFavorite();
                                                          print(c.isfavortTest
                                                                  .toString() +
                                                              "kjhkhjkhhkhh");

                                                          print("object");
                                                        },
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          size: 30,
                                                          color: Colors.red,
                                                        ))
                                                    : IconButton(
                                                        onPressed: () {
                                                          c.postfavorte(c
                                                              .modelHome
                                                              .dataHome!
                                                              .products[index]
                                                              .id);
                                                          // c.changFavorite();
                                                          print(c.isfavortTest
                                                                  .toString() +
                                                              "kjhkhjkhhkhh");

                                                          print("object");
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .favorite_border_outlined,
                                                          size: 30,
                                                          color: Colors.red,
                                                        )),
                                                SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  })
                              : ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                DetailsHome(
                                              products: c.modelHome.dataHome!
                                                  .products[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(children: [
                                        Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 150,
                                              child: Image.network(
                                                c.modelHome.dataHome!
                                                    .products[index].image
                                                    .toString(),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.amber),
                                              child: Text(
                                                c
                                                            .modelHome
                                                            .dataHome!
                                                            .products[index]
                                                            .discount >
                                                        0
                                                    ? "discount" +
                                                        " " +
                                                        c
                                                            .modelHome
                                                            .dataHome!
                                                            .products[index]
                                                            .discount
                                                            .toString() +
                                                        "%"
                                                    : "",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 150,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      c.modelHome.dataHome!
                                                          .products[index].name
                                                          .toString(),
                                                      maxLines: 4,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  /////////////////////////
                                                  ///

                                                  Row(
                                                    children: [
                                                      Text(
                                                        c
                                                                .modelHome
                                                                .dataHome!
                                                                .products[index]
                                                                .price
                                                                .round()
                                                                .toString() +
                                                            "\$",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.blue),
                                                      ),
                                                      c
                                                                  .modelHome
                                                                  .dataHome!
                                                                  .products[
                                                                      index]
                                                                  .discount >
                                                              0
                                                          ? Text(
                                                              "  " +
                                                                  c
                                                                      .modelHome
                                                                      .dataHome!
                                                                      .products[
                                                                          index]
                                                                      .old_price
                                                                      .round()
                                                                      .toString() +
                                                                  "\$",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color:
                                                                    Colors.grey,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                              ),
                                                            )
                                                          : Text(""),
                                                      Spacer(),
                                                      c.isfavortTest[c
                                                              .modelHome
                                                              .dataHome!
                                                              .products[index]
                                                              .id]!
                                                          ? IconButton(
                                                              onPressed: () {
                                                                c.postfavorte(c
                                                                    .modelHome
                                                                    .dataHome!
                                                                    .products[
                                                                        index]
                                                                    .id);
                                                                // c.changFavorite();
                                                                print(c.isfavortTest
                                                                        .toString() +
                                                                    "kjhkhjkhhkhh");

                                                                print("object");
                                                              },
                                                              icon: Icon(
                                                                Icons.favorite,
                                                                size: 30,
                                                                color:
                                                                    Colors.red,
                                                              ))
                                                          : IconButton(
                                                              onPressed: () {
                                                                c.postfavorte(c
                                                                    .modelHome
                                                                    .dataHome!
                                                                    .products[
                                                                        index]
                                                                    .id);
                                                                // c.changFavorite();
                                                                print(c.isfavortTest
                                                                        .toString() +
                                                                    "kjhkhjkhhkhh");

                                                                print("object");
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .favorite_border_outlined,
                                                                size: 30,
                                                                color:
                                                                    Colors.red,
                                                              )),
                                                    ],
                                                  ),
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
                                      ]),
                                    );
                                  },
                                  itemCount:
                                      c.modelHome.dataHome!.products.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(),
                                )),
                    ),
                  ]),
                );
        },
        listener: (context, states) {});
  }
}
