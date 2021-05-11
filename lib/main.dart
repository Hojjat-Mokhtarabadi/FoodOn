import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/locator.dart';
import 'package:foodon/src/presentation/ui/pages/cart/cart_page.dart';
import 'package:foodon/src/presentation/ui/pages/favorite/FavoritePage.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/blocs/home_bloc/home_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/home_page.dart';
import 'package:foodon/src/presentation/ui/pages/home/providers/category_items_provider.dart';
import 'package:foodon/src/presentation/ui/pages/main_menu/main_menu.dart';
import 'package:foodon/src/presentation/ui/pages/sale/AddPage.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
  HttpOverrides.global = new MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => locator<HomeBloc>()),
        BlocProvider<FoodsListBloc>(
            create: (context) => locator<FoodsListBloc>())
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CategoryItemsProvider())
        ],
        child: MaterialApp(
          theme: ThemeData(
              fontFamily: 'Vazir',
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: kPrimaryColor,
              accentColor: kPrimaryColor),
          home: Directionality(
              textDirection: TextDirection.rtl, child: MainMenu()),
          initialRoute: '/',
          routes: {
            '/home': (context) => HomePage(),
            '/favorite': (context) => FavoritePage(),
            '/sale': (context) => SalePage(),
            '/cart': (context) => CartPage(),
          },
        ),
      ),
    );
  }
}
