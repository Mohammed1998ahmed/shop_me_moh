import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import '../Cubit/HomeCubit.dart';
import '../Cubit/HomeState.dart';
import '../Model/HomeModel.dart';
import 'ImageDetails.dart';

class DetailsHome extends StatelessWidget {
  const DetailsHome({Key? key, required this.products}) : super(key: key);
  final Products products;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: ((context, state) {}),
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.amber, actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite_border_outlined))
          ]),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1 / 0.9,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                      itemCount: products.images.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => ImageDetail(
                                  image: products.images[index],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 10,
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  // border:
                                  //     Border.all(width: 5.0, color: Colors.amber),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.network(
                                products.images[index].toString(),
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      }),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      // color: Colors.grey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Price: " + products.price.toString() + "\$",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber)),
                              Spacer(),
                              Text(
                                  "Old_Price: " +
                                      products.old_price.toString() +
                                      "\$",
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            products.description.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
