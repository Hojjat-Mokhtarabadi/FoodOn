import 'package:flutter/material.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

const Color kPrimaryColor = Color(0xFF5EBA93);
const Color kDarkerPrimaryColor = Color(0xFF5EBA93);
const Color kAccentColor = Color(0xFF26283A);
const Color kShadowColor = Color(0x88000000);

//---------------------------------------------------------
//
const TextStyle kHeadingTextStyle =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
const TextStyle kFirstGreenTextStyle =
    TextStyle(fontWeight: FontWeight.w500, color: kPrimaryColor);

//---------------------------------------------------------

BoxDecoration kBackgroundImageBox = BoxDecoration(
  image: DecorationImage(
      image: AssetImage(kImageAddress[ImageAddresses.background]),
      fit: BoxFit.cover),
);
//--------------------------------------------------------

const Map<CategoryItemsEnum, String> kIconsAddress = {
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

//----------------------------------------------------------

const Map<ImageAddresses, String> kImageAddress = {
  ImageAddresses.background: 'assets/images/icons_png/bb.png',
  ImageAddresses.adjust: 'assets/images/icons/adjust.svg',
  ImageAddresses.logo: 'assets/images/icons/logo up.svg',
  ImageAddresses.drawer: 'assets/images/icons/hamber_drawer.svg',
  ImageAddresses.notification: 'assets/images/icons/notifications_active.svg'
};
