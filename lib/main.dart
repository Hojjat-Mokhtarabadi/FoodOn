import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/locator.dart';
import 'package:foodon/src/presentation/ui/pages/bill/bloc/bill_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/check_out_bloc/checkout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/delete_cart_order/delete_cart_order_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/get_orders_bloc/orderslist_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/cart_page.dart';
import 'package:foodon/src/presentation/ui/pages/favorite/FavoritePage.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/comment_bloc/comment_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/get_comments_bloc/get_comments_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/post_order_bloc/post_order_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/blocs/home_bloc/home_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/home_page.dart';
import 'package:foodon/src/presentation/ui/pages/home/providers/category_items_provider.dart';
import 'package:foodon/src/presentation/ui/pages/login/blocs/login_bloc/login_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/login/login_page.dart';
import 'package:foodon/src/presentation/ui/pages/my_orders/bloc/bills_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/log_out_bloc/logout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/sign_up/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodon/src/presentation/utils/providers/bottom_nav_state.dart';
import 'package:foodon/src/presentation/utils/providers/cart_info.dart';
import 'package:foodon/src/presentation/utils/providers/food_info.dart';
import 'package:foodon/src/presentation/utils/providers/orders_count.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'src/presentation/ui/pages/profile/blocs/user_info_bloc/user_info_bloc.dart';
import 'src/presentation/ui/pages/profile/profile_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

//initializeDateFormatting('de_DE', null).then(format);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  HttpOverrides.global = new MyHttpOverrides();
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
    initializeDateFormatting('fa_IR', null);
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
        BlocProvider<SetCartOrderBloc>(
            create: (context) => locator<SetCartOrderBloc>()),
        BlocProvider<DeleteCartOrderBloc>(
            create: (context) => locator<DeleteCartOrderBloc>()),
        BlocProvider<OrdersListBloc>(
            create: (context) => locator<OrdersListBloc>()),
        BlocProvider<LoginBloc>(create: (context) => locator<LoginBloc>()),
        BlocProvider<SignUpBloc>(create: (context) => locator<SignUpBloc>()),
        BlocProvider<LogoutBloc>(create: (context) => locator<LogoutBloc>()),
        BlocProvider<UpdateUserInfoBloc>(
            create: (context) => locator<UpdateUserInfoBloc>()),
        BlocProvider<UserInfoBloc>(
            create: (context) => locator<UserInfoBloc>()),
        BlocProvider<CommentsBloc>(
            create: (context) => locator<CommentsBloc>()),
        BlocProvider<CommentBloc>(create: (context) => locator<CommentBloc>()),
        BlocProvider<CheckoutBloc>(
            create: (context) => locator<CheckoutBloc>()),
        BlocProvider<BillsListBloc>(
            create: (context) => locator<BillsListBloc>()),
        BlocProvider<BillDetailsBloc>(
            create: (context) => locator<BillDetailsBloc>()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CategoryItemsProvider()),
          ChangeNotifierProvider(create: (context) => OrdersCountProvider()),
          ChangeNotifierProvider(create: (context) => BottomNavStateProvider()),
          ChangeNotifierProvider(create: (context) => UserInfoProvider()),
          ChangeNotifierProvider(create: (context) => CartInfoProvider()),
          ChangeNotifierProvider(create: (context) => FoodInfoProvider()),
        ],
        child: MaterialApp(
          builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget),
              //ClampingScrollWrapper.builder(context, widget),
              maxWidth: 1200,
              minWidth: 410,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.autoScale(410, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: Container(color: Color(0xFF7E2323))),
          navigatorKey: navigatorKey,
          theme: ThemeData(
              fontFamily: 'Vazir',
              visualDensity: VisualDensity.adaptivePlatformDensity,
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: kPrimaryColor, secondary: kPrimaryColor),
              accentColor: kPrimaryColor),
          //---
          supportedLocales: [Locale('en', 'US'), Locale('fa', 'IR')],
          debugShowCheckedModeBanner: false,
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
