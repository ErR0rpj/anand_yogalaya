import 'package:flutter/material.dart';
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

Widget buttonWithText({String text = 'Done', void Function()? onPressed}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Donebutton,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: DONE_BUTTON_SIZE,
              ),
            ),
          )
        ],
      ),
    ),
    onPressed: onPressed,
  );
}

//////////////////////// COLORS //////////////////////////////

const SEE_ALL_COLOR = Color(0xFF4FC3F7); //
const DASHBOARD_TEXT_COLOR = Colors.black; //
const Color primary = Color(0xFF4FC3F7); //
const Color kwhite = Colors.white; //
const Color kblack = Colors.black; //
Color? kindigo = Colors.indigo[400];
const Color NOTIFICATION_COUNT_NUMBERS_COLOR = Colors.white; //
const loginbackground = Color(0xFF80DEE8);
const loginbutton = Color(0xFF303F9F);
const Donebutton = Color(0xFF303F9F);
const SubcategoryColor = Color(0xFFE1F5FE);
const PlayButtonColor = Color(0xFFD1C4E9);

const kGreyShade1 = Color(0xFF8E8E93);
const kGreyShade2 = Color(0xFFAEAEB2);
const kGreyShade3 = Color(0xFFC7C7CC);
const kGreyShade4 = Color(0xFFD1D1D6);
const kGreyShade5 = Color(0xFFE5E5EA);
const kGreyShade6 = Color(0xFFF2F2F7);
const kShadowColor = Color(0x3322292E);

const Color kDangerColor = Color.fromRGBO(247, 71, 104, 1);

const kSeperatorColor = Color(0xFFC6C6C8);
const kGradientColor = Color(0xFF22292E);
const kFillColorPrimary = Color(0xFFE4E4E6);
const kFillColorAccent = Color(0xFFE9E9EB);
const kFillColorThird = Color(0xFFEFEFF0);
const kFillColorForth = Color(0xFFF4F4F5);
const kAlertColor = Color(0xFFFF3B30);
const kFailColor = Color(0xFFFF4343);

////////////////////////// Text color/////////////////////////////////////

const kkTextColor = Color(0xFF22292E);
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

const kPrimaryColor = Color(0xFFFFC61F);
const ksecondaryColor = Color(0xFFB5BFD0);
const kjhTextColor = Color(0xFF50505D);
const kTextLightColor = Color(0xFF6A727D);

const Color primaryColor = Color(0xFFF67952);
const Color bgColor = Color(0xFFFBFBFD);
const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;

const List<Color> colorList = [
  kPrimaryPurple,
  Color.fromARGB(255, 78, 119, 190),
  kPrimaryTosca,
  Donebutton,
  SEE_ALL_COLOR
];

///////////////////////// RADIUS //////////////////////////

const double TOP_WORKOUT_RAIDUS = 30.0; //
const double S_RADIUS = 10.0; //
const double TOP_WORKOUT_IMAGE_RADIUS = 10.0; //
const double NOTIFICATION_COUNT_RADIUS = 30.0; //
const double CATEGORY_RADIUS = 30;
const double M_RADIUS = 20;
const double LIST_RADIUS = 50;
const double FORM_FIELD_RADIUS = 32;
const double DEFAULT_FONT_SIZE = 32;
const double REGULAR_FONT_SIZE = 20;
const double PLAY_BUTTON_RADIUS = 10;

//////////////////////  NUMBERS //////////////////////

const int CATEGORY_GRID_NUMBER = 3;

///////////////////////// HEIGHT ////////////////////////

const double VS_HEIGHT = 4;
const double S_HEIGHT = 8;
const double DEFAULT_ICON_SIZE = 25; //
const double NOTIFICATION_ICON_SIZE = 30; //
const double L_ICON_SIZE = 32;
const double MAX_HEIGHT = 300; //
const double DEFAULT_HEIGHT = 50; //
const double MEDIUM_HEIGHT = 40; //
const double SMALL_HEIGHT = 30; //
const double TEXT_FIELD_ELEVATION = 8;
const double CARD_ELEVATION = 10; //
const double L_HEIGHT_SIZE = 24; //
const double DRAWER_WIDTH = 85;
const double TEXT_FIELD_BORDER_RADIUS = 5;
double UPLOAD_BUTTON_WIDTH = AppConstants().width * 0.8;
double UPLOAD_BUTTON_HEIGHT = AppConstants().height * 0.8;

////////////////////  FONT SIZE ///////////////////

const double CATEGORY_SIZE = 18; //
const double TOP_WORKOUT_SIZE = 24; //
const double SEE_ALL_SIZE = 15; //
const double WORKOUTS_SIZE = 22; //
const double DASHBOARD_SIZE = 28; //
const double NOTIFICATION_COUNT_NUMBERS = 8; //
const double LOGIN_WORKOUT_TEXT = 42; //
const double ANAND_YOGALAYA_SIZE = 25; //
const double LOGO_SIZE = 400; //
const double EXERCISE_NAME_SIZE = 30; //
const double TOTALNO_EXERCISE_SIZE = 14; //
const double SUBCATEGORY_EXERCISE_NAME = 20; //
const double S_TOTALNO_EXERCISE_SIZE = 16; //
const double DETAIL_TEXT_SIZE = 16; //
const double DONE_BUTTON_SIZE = 20; //
const double BROWSE_BY_SIZE = 22; //

const double L_FONT_SIZE = 8; //
const double LL_FONT_SIZE = 16; //
const double VERY_LARGE_FONT_SIZE = 48; //
const double L_MED_FONT_SIZE = 4;
const double LL_MED_FONT_SIZE = 12;
const double L_LARGE_FONT_SIZE = 10; //
const double LL_LARGE_FONT_SIZE = 20; //

///////////////////// CONTAINER,SIZEDBOX AND DIVIDER SIZE //////////////////

const double HAMBURGER_ICON_SIZE = 40; //
const double BACK_BUTTON_ICON_SIZE = 25; //
const double TIME_ICON_SIZE = 14; //
const double FOLDER_ICON_SIZE = 14; //
const double FLITER_ICON_SIZE = 40; //
const double VIDEO_ICON_SIZE = 40; //
const double NOTIFICATIONS_ICON_SIZE = 30; //

const double M_CONTAINER_SIZE = 40;
const double L_CONTAINER_SIZE = 50;
const double LL_CONTAINER_SIZE = 80;
const double VL_CONTAINER_SIZE = 100;
const double IMAGE_CONTAINER = 112;
const double VS_SIZEDBOX_SIZE = 5;
const double S_SIZEDBOX_SIZE = 10;
const double SM_SIZEDBOX_SIZE = 15;
const double M_SIZEDBOX_SIZE = 20;
const double L_SIZEDBOX_SIZE = 30; //
const double LL_SIZEDBOX_SIZE = 40;
const double LARGE_SIZEDBOX_SIZE = 40;
const double VLARGE_SIZEDBOX_SIZE = 60;
const double S_DIVIDER_SIZE = 32;
const double M_DIVIDER_SIZE = 40;
const double L_DIVIDER_SIZE = 56;
const double LL_DIVIDER_SIZE = 64;

///////////////////////// PADDING SIZE ////////////////////////////

const double appPadding = 20.0; //
const double ARROW_BACK_LEFT_PAD = 30; //
const double ARROW_BACK_RIGHT_PAD = 30; //
const double ARROW_BACK_TOP_PAD = 40; //
const double ARROW_BACK_BOTTOM_PAD = 20; //
const double DONE_BUTTON_LEFT_PAD = 20; //
const double DONE_BUTTON_RIGHT_PAD = 20; //
const double DONE_BUTTON_TOP_PAD = 20; //
const double DONE_BUTTON_BOTTOM_PAD = 20; //
const double DETAIL_TEXT_LEFT_PAD = 30; //
const double DETAIL_TEXT_RIGHT_PAD = 20; //
const double DETAIL_TEXT_TOP_PAD = 20; //
const double DETAIL_TEXT_BOTTOM_PAD = 10; //

const double V_LARGE_PAD = 100;
const double LARGE_PAD = 40;
const double M_MEDIUM_PAD = 24;
const double MEDIUM_PAD = 20;
const double S_MEDIUM_PAD = 16;
const double SMALL_PAD = 8;
const double V_SMALL_PAD = 4;
const double VV_SMALL_PAD = 2;
const double VVV_SMALL_PAD = 1.5;

//////////////////FONT WEIGHT /////////////////////

const FontWeight CATEGORIES_TITLE__WEIGHT = FontWeight.w800; //
const FontWeight TOPWORKOUT_TITLE__WEIGHT = FontWeight.w800; //
const FontWeight SEEALL_WEIGHT = FontWeight.w800; //
const FontWeight WORKOUTS_WEIGHT = FontWeight.bold; //
const FontWeight DASHBOARD_WEIGHT = FontWeight.w600; //
const FontWeight LOGIN_WORKOUT_TEXT_COLOR = FontWeight.bold; //
const FontWeight ANAND_YOGALAYA_TEXT_COLOR = FontWeight.bold; //

const FontWeight BOLD_WEIGHT = FontWeight.w700;
const FontWeight E_BOLD_WEIGHT = FontWeight.bold;
const FontWeight E_NORMAL_WEIGHT = FontWeight.w600;
const FontWeight NORMAL_WEIGHT = FontWeight.w500;

//////////////////// CATEGORIES ////////////////////

const String CATEGORY_FIRST = 'Shoulder';
const String CATEGORY_SECOND = 'Legs';
const String CATEGORY_THIRD = 'back';
const String CATEGORY_FOURTH = 'Bicheps';
const String CATEGORY_FIRST_IMAGE_URL = 'assets/images/yoga_3.png';
const String CATEGORY_SECOND_IMAGE_URL = 'assets/images/yoga_4.png';
const String CATEGORY_THIRD_IMAGE_URL = 'assets/images/yoga_5.png';
const String CATEGORY_FOURTH_IMAGE_URL = 'assets/images/yoga_6.png';

////////////////// SPECIAL CATEGORIES ///////////////////////

const String SPECIAL_CATEGORY_FIRST = 'Apples';
const String SPECIAL_CATEGORY_SECOND = 'Avacado';
const String SPECIAL_CATEGORY_THIRD = 'Banana';

///////////////////// CATEGORIES ALL ///////////////////////

const String CATEGORY_ALL_FIRST = 'Shoulder';
const String CATEGORY_ALL_SECOND = 'Legs';
const String CATEGORY_ALL_THIRD = 'back';
const String CATEGORY_ALL_FOURTH = 'Bicheps';
const String CATEGORY_ALL_FIRST_IMAGE_URL = 'assets/images/yoga_3.png';
const String CATEGORY_ALL_SECOND_IMAGE_URL = 'assets/images/yoga_4.png';
const String CATEGORY_ALL_THIRD_IMAGE_URL = 'assets/images/yoga_5.png';
const String CATEGORY_ALL_FOURTH_IMAGE_URL = 'assets/images/yoga_6.png';

//////////////////// EXTRA STRINGS /////////////////////

const String EMPTY_WISHLIST = 'Oops your wishlist is empty';
const String NOTHING_HERE =
    'It seems nothing in here. Explore more and shortlist some items';
const String POPULAR_DEALS_CART =
    'Dragon Fruits, Oranges, Apples, Mango , Pomengrate';
const String STREET_ADDRESS = 'Planet Namex, 989 Warhammer Street';

///////////////////extra /////////////

// Colors
const kTextColor = Color(0xFF0D1333);
const kBlueColor = Color(0xFF6E8AFA);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);

// My Text Styles
const kHeadingextStyle = TextStyle(
  fontSize: 28,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
const kSubheadingextStyle = TextStyle(
  fontSize: 24,
  color: Color(0xFF61688B),
  height: 2,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

const kSubtitleTextSyule = TextStyle(
  fontSize: 18,
  color: kTextColor,
  // fontWeight: FontWeight.bold,
);

//////////////////notication

const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kFixPadding = 16.0;
const kLess = 4.0;

const kShape = 30.0;

const kRadius = 0.0;
const kAppBarHeight = 56.0;

const kHeadTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: kLightColor,
);

const kkTitleTextStyle = TextStyle(
  fontSize: 20.0,
  color: kPrimaryColor,
);

const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: kDarkColor,
);

const kDivider = Divider(
  color: kAccentColor,
  thickness: kLessPadding,
);

const kSmallDivider = Divider(
  color: kAccentColor,
  thickness: 5.0,
);

/////////////// drawer //////////////

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
