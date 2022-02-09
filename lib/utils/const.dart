
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class AppConstants {
  double height = 0;
  double width = 0;
  double aspectRatio = 0;
  double _heightCalculator(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return (MediaQuery.of(context).size.height);
  }
  double _widthCalculator(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return (MediaQuery.of(context).size.width);
  }
  _calculateAspectRatio(double width, double height) => height / width;
  static final AppConstants _instance = AppConstants._internal();
  factory AppConstants() {
    return _instance;
  }
  AppConstants._internal();
  void calculateSize(BuildContext context) {
    aspectRatio = _calculateAspectRatio(
        _widthCalculator(context), _heightCalculator(context));
  }
}


//////////////////////// COLORS //////////////////////////////


const kGreyShade1 = Color(0xFF8E8E93);
const kGreyShade2 = Color(0xFFAEAEB2);
const kGreyShade3 = Color(0xFFC7C7CC);
const kGreyShade4 = Color(0xFFD1D1D6);
const kGreyShade5 = Color(0xFFE5E5EA);
const kGreyShade6 = Color(0xFFF2F2F7);
const kShadowColor = Color(0x3322292E);
const loginbackground = Color(0xFF80DEE8);
const loginbutton = Color(0xFF303F9F);
const Color kDangerColor = Color.fromRGBO(247, 71, 104, 1);
const Color primary = Color(0xFF4FC3F7);
const Color kwhite = Colors.white;
const Color kblack = Colors.black;
const kSeperatorColor = Color(0xFFC6C6C8);
const kGradientColor = Color(0xFF22292E);
const kFillColorPrimary = Color(0xFFE4E4E6);
const kFillColorAccent = Color(0xFFE9E9EB);
const kFillColorThird = Color(0xFFEFEFF0);
const kFillColorForth = Color(0xFFF4F4F5);
const kAlertColor = Color(0xFFFF3B30);
const kFailColor = Color(0xFFFF4343);

////////////////////////// Text color/////////////////////////////////////

const kTextColor = Color(0xFF22292E);
const kTextColorAccent = Color(0xFF8A8A8E);
const kTextColorThird = Color(0xFFC5C5C7);
const kTextColorForth = Color(0xFFF8F8F8);

/////////////////////// Main color pallete //////////////////////////////

const kPrimaryGreen = Color(0xFF54B175);
const kPrimaryRed = Color(0xFFFE6E4C);
const kPrimaryYellow = Color(0xFFFEBF43);
const kPrimaryPurple = Color(0xFF9B81E5);
const kPrimaryTosca = Color(0xFF03B0A9);
const kAccentGreen = Color(0xFFE4F3EA);
const kAccentRed = Color(0xFFFFECE8);
const kAccentYellow = Color(0xFFFFF6E4);
const kAccentPurple = Color(0xFFF1EDFC);
const kAccentTosca = Color(0xFFDDF5F4);


//////////////////////// RUPEE SIGN ///////////////////////////

const String RUPEE_SYMBOL = '₹';
TextStyle APPBAR_TEXTSTYLE = GoogleFonts.raleway(
  fontWeight: FontWeight.bold,
);

///////////////////////// RADIUS //////////////////////////

const double S_RADIUS = 4;
const double RADIUS = 8;
const double AVATAR_RADIUS = 24;
const double M_RADIUS = 20;
const double LIST_RADIUS = 50;
const double RADIUS_SMALL = 8;
const double FORM_FIELD_RADIUS = 32;
const double DEFAULT_FONT_SIZE = 32;
const double REGULAR_FONT_SIZE = 20;


///////////////////////// HEIGHT ////////////////////////

const double VS_HEIGHT = 4;
const double S_HEIGHT = 8;
const double DEFAULT_ICON_SIZE = 25; //
const double L_ICON_SIZE = 32;
const double MAX_HEIGHT = 300; //
const double DEFAULT_HEIGHT = 50; //
const double  MEDIUM_HEIGHT = 40; //
const double SMALL_HEIGHT = 30; //
const double TEXT_FIELD_ELEVATION = 8;
const double CARD_ELEVATION = 10; //
const double L_HEIGHT_SIZE = 24; //
const double DRAWER_WIDTH = 85;
const double TEXT_FIELD_BORDER_RADIUS = 5;


////////////////////  FONT SIZE ///////////////////

const double L_FONT_SIZE = 8; //
const double LL_FONT_SIZE = 16; //
const double VERY_LARGE_FONT_SIZE = 48; //
const double L_MED_FONT_SIZE = 4;
const double LL_MED_FONT_SIZE = 12;
const double L_LARGE_FONT_SIZE = 10; //
const double LL_LARGE_FONT_SIZE = 20; //

///////////////////// CONTAINER,SIZEDBOX AND DIVIDER SIZE //////////////////


const double M_CONTAINER_SIZE = 40;
const double L_CONTAINER_SIZE = 50;
const double LL_CONTAINER_SIZE = 80;
const double IMAGE_CONTAINER = 112;
const double VS_SIZEDBOX_SIZE = 5;
const double S_SIZEDBOX_SIZE = 10;
const double SM_SIZEDBOX_SIZE = 15;
const double M_SIZEDBOX_SIZE = 20;
const double L_SIZEDBOX_SIZE = 30;
const double LL_SIZEDBOX_SIZE = 40;
const double LARGE_SIZEDBOX_SIZE = 50;
const double S_DIVIDER_SIZE = 32;
const double M_DIVIDER_SIZE = 40;
const double L_DIVIDER_SIZE = 56;
const double LL_DIVIDER_SIZE = 64;

///////////////////////// PADDING SIZE ////////////////////////////

const double V_LARGE_PAD = 100;
const double LARGE_PAD = 40;
const double M_MEDIUM_PAD = 24;
const double MEDIUM_PAD = 20;
const double S_MEDIUM_PAD = 16;
const double SMALL_PAD = 8;
const double V_SMALL_PAD = 4;
const double VV_SMALL_PAD = 2;
const double VVV_SMALL_PAD = 1.5;
const double appPadding = 20.0;

//////////////////FONT WEIGHT /////////////////////

const FontWeight BOLD_WEIGHT = FontWeight.w700;  //
const FontWeight E_BOLD_WEIGHT = FontWeight.bold; //
const FontWeight E_NORMAL_WEIGHT = FontWeight.w600; //
const FontWeight NORMAL_WEIGHT = FontWeight.w500; //

//////////////////// CATEGORIES ////////////////////

const String CATEGORY_FIRST = 'Vegetables';
const String CATEGORY_SECOND = 'Fruits';
const String CATEGORY_THIRD = 'Milks & Egg';
const String CATEGORY_FOURTH = 'Meat';
const String CATEGORY_FIRST_IMAGE_URL = 'assets/images/vegetable_home.png';
const String CATEGORY_SECOND_IMAGE_URL = 'assets/images/fruit_home.png';
const String CATEGORY_THIRD_IMAGE_URL = 'assets/images/egg_home.png';
const String CATEGORY_FOURTH_IMAGE_URL = 'assets/images/meat_home.png';

////////////////// SPECIAL CATEGORIES ///////////////////////

const String SPECIAL_CATEGORY_FIRST = 'Apples';
const String SPECIAL_CATEGORY_SECOND = 'Avacado';
const String SPECIAL_CATEGORY_THIRD = 'Banana';

///////////////////// CATEGORIES ALL ///////////////////////

const String CATEGORY_ALL_FIRST = 'Vegetables';
const String CATEGORY_ALL_SECOND = 'Fruits';
const String CATEGORY_ALL_THIRD = 'Milks & Egg';
const String CATEGORY_ALL_FOURTH = 'Meat';
const String CATEGORY_ALL_FIRST_IMAGE_URL = 'assets/images/vegetable_home.png';
const String CATEGORY_ALL_SECOND_IMAGE_URL = 'assets/images/fruit_home.png';
const String CATEGORY_ALL_THIRD_IMAGE_URL = 'assets/images/egg_home.png';
const String CATEGORY_ALL_FOURTH_IMAGE_URL = 'assets/images/meat_home.png';

//////////////////// EXTRA STRINGS /////////////////////

const String EMPTY_WISHLIST = 'Oops your wishlist is empty';
const String NOTHING_HERE = 'It seems nothing in here. Explore more and shortlist some items';
const String POPULAR_DEALS_CART =  'Dragon Fruits, Oranges, Apples, Mango , Pomengrate';
const String STREET_ADDRESS = 'Planet Namex, 989 Warhammer Street' ;
