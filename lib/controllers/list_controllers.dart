import 'package:anand_yogalaya/models/categories.dart';
import 'package:anand_yogalaya/models/contents.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:get/get.dart';

//This controller contains various lists which is required by the whole app.
class ListController extends GetxController {
  RxList<ContentModel> contentList = <ContentModel>[
    ContentModel(
      id: 'efggggytEwrqgfgt',
      name: 'Padmasana',
      duration: 5,
      categories: ['ragrcgraYRerdgf'],
    ),
    ContentModel(
      id: 'ef12ggytEwrqgfgt',
      name: 'Buddhasana',
      duration: 6,
      categories: ['ragrcgraYRerdgf'],
    ),
    ContentModel(
      id: 'ef12ggytEwrqfdfgfgt',
      name: 'Shavasana',
      duration: 15,
      categories: ['ragrcgraYRer21323'],
    ),
  ].obs;

  RxList<CategoryModel> categoryList = <CategoryModel>[
    CategoryModel(
        id: 'ragrcgraYRerdgf',
        name: 'Meditation',
        totalDuration: 10,
        color: kAccentGreen,
        imageUrl: '',
        isPlayList: true,
        contents: ['efggggytEwrqgfgt', 'ef12ggytEwrqgfgt']),
    CategoryModel(
      id: 'ragrcgraYRer21323',
      name: 'Body Pain Yogas',
      totalDuration: 15,
      color: kAccentRed,
      imageUrl: '',
      isPlayList: true,
      contents: ['ef12ggytEwrqfdfgfgt'],
    ),
    CategoryModel(
      id: 'ragrcgra1241241',
      name: 'Yogas At Home',
      totalDuration: 30,
      color: kAccentYellow,
      imageUrl: '',
      isPlayList: true,
    ),
    CategoryModel(
      id: 'ragrcgraYRe554545rdgf',
      name: 'Relaxing Yogas',
      totalDuration: 15,
      color: kAccentPurple,
      imageUrl: '',
      isPlayList: true,
    ),
    CategoryModel(
      id: 'rag11212erdgf',
      name: 'Morning Yoga',
      totalDuration: 60,
      color: kAccentTosca,
      imageUrl: '',
      isPlayList: true,
    ),
    CategoryModel(
      id: 'ragrcgra0000YRerdgf',
      name: 'Suryanamaskar',
      totalDuration: 100,
      color: kAccentGreen,
      imageUrl: '',
      isPlayList: true,
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
