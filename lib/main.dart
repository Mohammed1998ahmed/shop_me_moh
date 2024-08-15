// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shop_app/%D9%8DShop_app/page/Home_Page/Cubit/CubitCategory.dart';
// import 'package:shop_app/%D9%8DShop_app/page/Home_Page/Cubit/HomeCubit.dart';
// import 'package:shop_app/%D9%8DShop_app/page/Home_Page/Cubit/HomeState.dart';
// import 'package:shop_app/%D9%8DShop_app/page/Login/Cubit/cubit.dart';
// import 'package:shop_app/%D9%8DShop_app/page/Rigister/Cubit/CubitRreister.dart';
// import 'package:shop_app/%D9%8DShop_app/page/api/serverApi.dart';

// import 'ServerBloc/Server.dart';
// import 'ShardPrephrans/SherdPrphrans.dart';
// import 'ٍShop_app/page/Home_Page/Home_Page.dart';
// import 'ٍShop_app/page/Home_Page/onBord/onBording.dart';
// import 'ٍShop_app/page/Login/Login.dart';
// import 'ٍShop_app/page/onbord/onbording.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await CachShpreaf.init();
//   ServerApi.init();
//   HttpOverrides.global = MyHttpOverrides();
//   Bloc.observer = MyBlocObserver();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<LoginCubit>(
//           create: (BuildContext context) => LoginCubit(),
//         ),
//         BlocProvider<ReisterCubit>(
//           create: (BuildContext context) => ReisterCubit(),
//         ),
//         BlocProvider<HomeCubit>(
//             create: (BuildContext context) => HomeCubit()..getData()),
//         BlocProvider<CategoryCubit>(
//             create: (BuildContext context) =>
//                 CategoryCubit()..getDataCategory()),
//       ],
//       child: BlocConsumer<HomeCubit, HomeStates>(
//         listener: (context, state) {},
//         builder: (context, states) {
//           return MaterialApp(
//             title: 'Flutter Demo',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: CachShpreaf.getdata(key: "Token") != null
//                 ? CachShpreaf.getdata(key: "lang").toString() == "en"
//                     ? Directionality(
//                         textDirection: TextDirection.ltr, child: Home_Page())
//                     : Directionality(
//                         textDirection: TextDirection.rtl, child: Home_Page())
//                 : Test1(),
//           );
//         },
//       ),
//     );
//   }
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
import 'dart:io';

 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'ServerBloc/Server.dart';
import 'ShardPrephrans/SherdPrphrans.dart';
import 'weather/Weatherapp.dart';
import 'ٍShop_app/page/Home_Page/Cubit/CubitCategory.dart';
import 'ٍShop_app/page/Home_Page/Cubit/HomeCubit.dart';
import 'ٍShop_app/page/Home_Page/Cubit/HomeState.dart';
import 'ٍShop_app/page/Home_Page/Home_Page.dart';
import 'ٍShop_app/page/Home_Page/onBord/onBording.dart';
import 'ٍShop_app/page/Login/Cubit/cubit.dart';
import 'ٍShop_app/page/Rigister/Cubit/CubitRreister.dart';
import 'ٍShop_app/page/api/serverApi.dart';
 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachShpreaf.init();
  ServerApi.init();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<ReisterCubit>(
          create: (BuildContext context) => ReisterCubit(),
        ),
        BlocProvider<HomeCubit>(
            create: (BuildContext context) => HomeCubit()..getData()),
        BlocProvider<CategoryCubit>(
            create: (BuildContext context) =>
                CategoryCubit()..getDataCategory()),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, states) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: CachShpreaf.getdata(key: "Token") != null
                ? CachShpreaf.getdata(key: "lang").toString() == "en"
                    ? Scaffold(
                      body: Directionality(
                          textDirection: TextDirection.ltr, child: Home_Page()),
                    )
                    : Scaffold(
                      body: Directionality(
                          textDirection: TextDirection.rtl, child: Home_Page()),
                    )
                : Test1(),
            // home: WeatherApp(),
          );
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
