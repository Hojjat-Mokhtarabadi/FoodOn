import 'package:flutter/material.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

const Color kPrimaryColor = Color(0xFF5EBA93);
const Color kAccentColor = Color(0xFF26283A);
const Color kShadowColor = Color(0x88000000);

//---------------------------------------------------------
//
const TextStyle kHeadingTextStyle = TextStyle(fontWeight: FontWeight.w600);
const TextStyle kFirstGreenTextStyle =
    TextStyle(fontWeight: FontWeight.w500, color: kPrimaryColor);

//---------------------------------------------------------

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

// const Map<CategoryItemsEnum, String> kIconsAddress = {
//   // CategoryItemsEnum.kebab: 'assets/images/icons/kebab.svg',
//   CategoryItemsEnum.beverage: 'assets/images/icons/coka.svg',
//   CategoryItemsEnum.burger: 'assets/images/icons/burgerAsset 4 1.svg',
//   CategoryItemsEnum.friedChicken: 'assets/images/icons/chicken.svg',
//   CategoryItemsEnum.friedPotato: 'assets/images/icons/sib.svg',
//   CategoryItemsEnum.pizza: 'assets/images/icons/pizzaAsset 2 1.svg',
//   CategoryItemsEnum.preFood: 'assets/images/icons/pishAsset 1 1.svg',
//   //CategoryItemsEnum.salad: 'assets/images/icons/salad.svg',
//   CategoryItemsEnum.snack: 'assets/images/icons/snack.svg',
//   CategoryItemsEnum.traditional: 'assets/images/icons/trad.svg'
// };
