import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../../utils/const.dart';
import '../subcategoryScreen/subcategories.dart';
import '../workoutdetailScreen/detailScreen.dart';


class SearchPageScreen extends StatefulWidget{
  const SearchPageScreen({Key? key}) : super(key: key);

  @override
  SearchPageScreenState createState() => SearchPageScreenState();

}

class SearchPageScreenState extends State<SearchPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
    );
  }
}
