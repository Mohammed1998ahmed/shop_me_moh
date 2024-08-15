import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'Cubit/HomeCubit.dart';
import 'Cubit/HomeState.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> languages = ['ListView', 'GridView'];
    String lang = 'ListView';
    var c = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            actions: [
              DropdownButton(
                iconEnabledColor: Colors.white,
                items: languages.map((e) {
                  return DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          c.isListtogrid
                              ? Icon(
                                  Icons.list,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.apps,
                                  size: 30,
                                ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            e.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ));
                }).toList(),
                onChanged: (value) {
                  c.changListToGrid();
                  lang = value.toString();
                },
                value: lang,
                dropdownColor: Colors.amber,
              ),
              // IconButton(
              //     onPressed: () {
              //       c.changListToGrid();
              //     },
              //     icon: c.isListtogrid
              //         ? Icon(Icons.apps)
              //         : Icon(
              //             Icons.list,
              //             size: 40,
              //           ))
            ],
          ),
          body: c.listWidget[c.CurrentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            items: c.itemsIcons,
            buttonBackgroundColor: Colors.white,

            height: 60,
            // selectedItemColor: Colors.orange,
            // unselectedItemColor: Colors.black,

            index: c.CurrentIndex,

            onTap: (index) {
              c.changStates(index, context);
              if (index == 0) {
                c.getData();
              }
              // if (index == 1) {
              //   c.getDataCategory();
              // }
              if (index == 2) {
                c.getDataFavortie();
              }
            },
            backgroundColor: Colors.amber.withOpacity(0.8),
          ),
        );
      },
    );
  }
}
// bottomNavigationBar: CurvedNavigationBar(
//           // items: c.bottonNev,
//           items: c.bottonNavation,
//           // fixedColor: Colors.green,
//           backgroundColor: c.ismode
//               ? Colors.transparent.withOpacity(0.1)
//               : Colors.white.withOpacity(0.1),
//           index: c.curennentIndex,
//           buttonBackgroundColor: c.ismode ? Colors.green : Colors.green,
//           color: c.ismode ? Colors.white38 : Colors.green.withOpacity(0.8),
//           height: 60,
//           // unselectedItemColor: Colors.black,
//           // currentIndex: c.curennentIndex,
//           onTap: (index) {
//             print(index);
//             c.changedStatesBottonNav(index);
//           },
//         ),
