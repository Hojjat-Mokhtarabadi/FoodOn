import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/src/presentation/ui/pages/home/home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // Image.asset(
  // 'assets/images/icons_png/bb.png',
  // fit: BoxFit.cover,
  // ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 53.0,
        hideNavigationBar: false,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black54, blurRadius: 10),
          ],
        ),
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      HomePage(),
      HomePage(),
      HomePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(FontAwesomeIcons.shoppingCart, size: 22.0),
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.black87,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: kRouts,
          )),
      PersistentBottomNavBarItem(
          //icon: SvgPicture.asset('assets/images/icons/sale.svg'),
          icon: Icon(Icons.add, size: 35.0),
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.black87,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: kRouts,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(FontAwesomeIcons.solidHeart, size: 25.0),
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.black87,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: kRouts,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home, size: 35.0),
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.black87,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: kRouts,
          )),
    ];
  }

  Map<String, Widget Function(BuildContext context)> kRouts = {
    '/home': (context) => HomePage(),
    '/favorite': (context) => HomePage(),
    '/sale': (context) => HomePage(),
    '/cart': (context) => HomePage(),
  };
}

// bottomNavigationBar: Container(
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0)),
//     boxShadow: [
//       BoxShadow(color: Colors.black54, blurRadius: 10),
//     ],
//   ),
//   child: ClipRRect(
//     borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
//     child: BottomNavigationBar(
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       // type: BottomNavigationBarType.fixed,
//       onTap: (index) {},
//       items: [
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset('assets/images/icons/cart.svg'),
//             label: 'cart'),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset('assets/images/icons/sale.svg'),
//             label: 'sale'),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset('assets/images/icons/love.svg'),
//             label: 'favorite'),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset('assets/images/icons/home.svg'),
//             label: 'home'),
//       ],
//     ),
//   ),
// ),