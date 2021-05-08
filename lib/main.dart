import 'package:flutter/material.dart';
import 'package:foodon/locator.dart';
import 'package:foodon/src/presentation/ui/pages/home/home_page.dart';
import 'package:foodon/src/presentation/ui/pages/home/providers/category_items_provider.dart';
import 'package:foodon/src/presentation/ui/pages/main_menu/main_menu.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryItemsProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Vazir',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:
            Directionality(textDirection: TextDirection.rtl, child: MainMenu()),
        initialRoute: '/',
        routes: {
          '/home': (context) => HomePage(),
          '/favorite': (context) => HomePage(),
          '/sale': (context) => HomePage(),
          '/cart': (context) => HomePage(),
        },
      ),
    );
  }
}
