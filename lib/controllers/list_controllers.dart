import 'package:anand_yogalaya/models/categories.dart';
import 'package:anand_yogalaya/models/contents.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:get/get.dart';

//This controller contains various lists which is required by the whole app.
class ListController extends GetxController {
  RxList<Contents> contentList = <Contents>[
    Contents(
      id: 'efggggytEwrqgfgt',
      name: 'Padmasana',
      duration: 5,
      categories: ['ragrcgraYRerdgf'],
    ),
    Contents(
      id: 'ef12ggytEwrqgfgt',
      name: 'Buddhasana',
      duration: 6,
      categories: ['ragrcgraYRerdgf'],
    ),
    Contents(
      id: 'ef12ggytEwrqfdfgfgt',
      name: 'Shavasana',
      duration: 15,
      categories: ['ragrcgraYRer21323'],
    ),
  ].obs;

  RxList<Categories> categoryList = <Categories>[
    Categories(
        id: 'ragrcgraYRerdgf',
        name: 'Meditation',
        totalDuration: 10,
        color: kAccentGreen,
        icon: 'assets/images/yoga_1.png',
        contents: ['efggggytEwrqgfgt', 'ef12ggytEwrqgfgt']),
    Categories(
      id: 'ragrcgraYRer21323',
      name: 'Body Pain Yogas',
      totalDuration: 15,
      color: kAccentRed,
      icon: 'assets/images/yoga_2.png',
      contents: ['ef12ggytEwrqfdfgfgt'],
    ),
    Categories(
      id: 'ragrcgra1241241',
      name: 'Yogas At Home',
      totalDuration: 30,
      color: kAccentYellow,
      icon: 'assets/images/yoga_3.png',
    ),
    Categories(
      id: 'ragrcgraYRe554545rdgf',
      name: 'Relaxing Yogas',
      totalDuration: 15,
      color: kAccentPurple,
      icon: 'assets/images/yoga_1.png',
    ),
    Categories(
      id: 'rag11212erdgf',
      name: 'Morning Yoga',
      totalDuration: 60,
      color: kAccentTosca,
      icon: 'assets/images/yoga_2.png',
    ),
    Categories(
      id: 'ragrcgra0000YRerdgf',
      name: 'Suryanamaskar',
      totalDuration: 100,
      color: kAccentGreen,
      icon: 'assets/images/yoga_3.png',
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
