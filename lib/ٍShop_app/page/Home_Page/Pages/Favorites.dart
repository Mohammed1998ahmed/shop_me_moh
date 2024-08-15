import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Cubit/HomeCubit.dart';
import '../Cubit/HomeState.dart';
import 'details.dart';

class Favrotes_Page extends StatelessWidget {
  const Favrotes_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is LodingGetFavorite
            ? Center(
                child: SpinKitSpinningLines(
                color: Colors.orange,
                size: 100,
              ))
            : c.getFavortie.getData!.dataf.length > 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: c.isListtogrid
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 5.9,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: c.getFavortie.getData!.dataf.length,
                            itemBuilder: (BuildContext ctx, index) {
                              // print(c.modelHome.dataHome!.products[index]
                              //     .in_favorites);
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    InkWell(
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
                                      child: Card(
                                        elevation: 10,
                                        child: Container(
                                          width: 300,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              // border: Border.all(
                                              //     width: 5.0, color: Colors.amber),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Image.network(
                                            c.getFavortie.getData!.dataf[index]
                                                .prodectF!.image
                                                .toString(),
                                            height: double.infinity,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        c.getFavortie.getData!.dataf[index]
                                            .prodectF!.name
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
                                            c.getFavortie.getData!.dataf[index]
                                                    .prodectF!.price!
                                                    .round()
                                                    .toString() +
                                                "\$",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blue),
                                          ),
                                          Text(
                                            "  " +
                                                c
                                                    .getFavortie
                                                    .getData!
                                                    .dataf[index]
                                                    .prodectF!
                                                    .old_price!
                                                    .round()
                                                    .toString() +
                                                "\$",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          Spacer(),
                                          c.isfavortTest[c.getFavortie.getData!
                                                  .dataf[index].prodectF!.id]!
                                              ? IconButton(
                                                  onPressed: () {
                                                    c.postfavorte(c
                                                        .getFavortie
                                                        .getData!
                                                        .dataf[index]
                                                        .prodectF!
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
                                                        .getFavortie
                                                        .getData!
                                                        .dataf[index]
                                                        .prodectF!
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
                                  Container(
                                    width: 150,
                                    height: 150,
                                    child: Image.network(
                                      c.getFavortie.getData!.dataf[index]
                                          .prodectF!.image
                                          .toString(),
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
                                              child: Text(
                                                c.getFavortie.getData!
                                                    .dataf[index].prodectF!.name
                                                    .toString(),
                                                maxLines: 4,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            /////////////////////////
                                            ///

                                            Row(
                                              children: [
                                                Text(
                                                  c
                                                          .getFavortie
                                                          .getData!
                                                          .dataf[index]
                                                          .prodectF!
                                                          .price!
                                                          .round()
                                                          .toString() +
                                                      "\$",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blue),
                                                ),
                                                Text(
                                                  "  " +
                                                      c
                                                          .getFavortie
                                                          .getData!
                                                          .dataf[index]
                                                          .prodectF!
                                                          .old_price!
                                                          .round()
                                                          .toString() +
                                                      "\$",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                Spacer(),
                                                c.isfavortTest[c
                                                        .getFavortie
                                                        .getData!
                                                        .dataf[index]
                                                        .prodectF!
                                                        .id]!
                                                    ? IconButton(
                                                        onPressed: () {
                                                          c.postfavorte(c
                                                              .getFavortie
                                                              .getData!
                                                              .dataf[index]
                                                              .prodectF!
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
                                                              .getFavortie
                                                              .getData!
                                                              .dataf[index]
                                                              .prodectF!
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
                            itemCount: c.getFavortie.getData!.dataf.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          ))
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 100,
                          color: Colors.grey,
                        ),
                        Text(
                          "Not Fond Favorite",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  );
      },
    );
  }
}
