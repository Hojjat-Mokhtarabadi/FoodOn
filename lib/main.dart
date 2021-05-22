import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/locator.dart';
import 'package:foodon/src/presentation/ui/pages/cart/cart_page.dart';
import 'package:foodon/src/presentation/ui/pages/favorite/FavoritePage.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/post_order_bloc/post_order_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/blocs/home_bloc/home_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/home_page.dart';
import 'package:foodon/src/presentation/ui/pages/home/providers/category_items_provider.dart';
import 'package:foodon/src/presentation/ui/pages/login/blocs/login_bloc/login_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/login/login_page.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/log_out_bloc/logout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/sign_up/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodon/src/presentation/utils/providers/bottom_nav_state.dart';
import 'package:foodon/src/presentation/utils/providers/orders_count.dart';
import 'package:foodon/src/presentation/utils/providers/user_id.dart';
import 'package:provider/provider.dart';

import 'src/presentation/ui/pages/profile/blocs/user_info_bloc/user_info_bloc.dart';
import 'src/presentation/ui/pages/profile/profile_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  setupLocator();
  //HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
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
            create: (context) => locator<FoodsListBloc>()),
        BlocProvider<FoodDetailsBloc>(
            create: (context) => locator<FoodDetailsBloc>()),
        BlocProvider<PostOrderBloc>(
            create: (context) => locator<PostOrderBloc>()),
        BlocProvider<LoginBloc>(create: (context) => locator<LoginBloc>()),
        BlocProvider<SignUpBloc>(create: (context) => locator<SignUpBloc>()),
        BlocProvider<LogoutBloc>(create: (context) => locator<LogoutBloc>()),
        BlocProvider<UpdateUserInfoBloc>(
            create: (context) => locator<UpdateUserInfoBloc>()),
        BlocProvider<UserInfoBloc>(
            create: (context) => locator<UserInfoBloc>()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CategoryItemsProvider()),
          ChangeNotifierProvider(create: (context) => OrdersCountProvider()),
          ChangeNotifierProvider(create: (context) => UserInfoProvider()),
          ChangeNotifierProvider(create: (context) => BottomNavStateProvider()),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          theme: ThemeData(
              fontFamily: 'Vazir',
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: kPrimaryColor,
              accentColor: kPrimaryColor),
          home: Directionality(
              textDirection: TextDirection.rtl, child: LoginPage()),
          initialRoute: '/',
          routes: {
            '/home': (context) => HomePage(),
            '/favorite': (context) => FavoritePage(),
            '/sale': (context) => ProfilePage(),
            '/cart': (context) => CartPage(),
          },
        ),
      ),
    );
  }
}
