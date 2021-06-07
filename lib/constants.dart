import 'package:flutter/material.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

const Color kPrimaryColor = Color(0xFF5EBA93);
const Color kDarkerPrimaryColor = Color(0xFF5EBA93);
const Color kAccentColor = Color(0xFF26283A);
const Color kShadowColor = Color(0x88000000);

//--------------------------------------------------------

const String kServerErrorMsg = 'خطایی از سرور رخ داده است';
const String kNoConnectionMsg = 'اتصال خود را چک کنید';
const String kNotFoundMsg = 'غذای مورد نظر یافت نشد';

//---------------------------------------------------------
//
const TextStyle kHeadingTextStyle =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
const TextStyle kFirstGreenTextStyle =
    TextStyle(fontWeight: FontWeight.w500, color: kPrimaryColor);

//---------------------------------------------------------

const BoxDecoration kBackgroundImageBox = BoxDecoration(
  image: DecorationImage(
      image: AssetImage('assets/images/icons_png/bb.png'), fit: BoxFit.cover),
);
//--------------------------------------------------------

const Map<CategoryItemsEnum, String> kCategoryIconsAddress = {
  CategoryItemsEnum.kebab: 'assets/images/icons_png/kebab.png',
  CategoryItemsEnum.beverage: 'assets/images/icons_png/coka.png',
  CategoryItemsEnum.burger: 'assets/images/icons_png/burger.png',
  CategoryItemsEnum.friedChicken: 'assets/images/icons_png/chicken.png',
  CategoryItemsEnum.friedPotato: 'assets/images/icons_png/sib.png',
  CategoryItemsEnum.pizza: 'assets/images/icons_png/pizza.png',
  CategoryItemsEnum.preFood: 'assets/images/icons_png/pish.png',
  CategoryItemsEnum.salad: 'assets/images/icons_png/salad.png',
  CategoryItemsEnum.snack: 'assets/images/icons_png/snack.png',
  CategoryItemsEnum.traditional: 'assets/images/icons_png/trad.png'
};

const Map<int, CategoryItemsEnum> kCategoryNameEnum = {
  1: CategoryItemsEnum.kebab,
  7: CategoryItemsEnum.beverage,
  2: CategoryItemsEnum.burger,
  5: CategoryItemsEnum.friedChicken,
  10: CategoryItemsEnum.friedPotato,
  6: CategoryItemsEnum.pizza,
  8: CategoryItemsEnum.preFood,
  3: CategoryItemsEnum.salad,
  9: CategoryItemsEnum.snack,
  4: CategoryItemsEnum.traditional
};

//----------------------------------------------------------

const Map<ImageAddresses, String> kImagesAddress = {
  ImageAddresses.background: 'assets/images/icons_png/bb.png',
  ImageAddresses.adjust: 'assets/images/icons/adjust.svg',
  ImageAddresses.logo: 'assets/images/icons/logo up.svg',
  ImageAddresses.drawer: 'assets/images/icons/hamber_drawer.svg',
  ImageAddresses.notification: 'assets/images/icons/notifications_active.svg',
  ImageAddresses.add: 'assets/images/icons_png/plus-01.png',
  ImageAddresses.minus: 'assets/images/icons_png/mines-01.png',
  ImageAddresses.background2: 'assets/images/icons_png/bh.png'
};

//----------------------------------------------------------

const Map<ProfileIcons, String> kProfileAddresses = {
  ProfileIcons.activeOrders: 'assets/images/profile_icons/act_order.png',
  ProfileIcons.editProfile: 'assets/images/profile_icons/eprof.png',
  ProfileIcons.exit: 'assets/images/profile_icons/exit.png',
  ProfileIcons.myOrders: 'assets/images/profile_icons/my_order.png',
  ProfileIcons.faq: 'assets/images/profile_icons/qa.png',
  ProfileIcons.wallet: 'assets/images/profile_icons/wallet.png'
};
