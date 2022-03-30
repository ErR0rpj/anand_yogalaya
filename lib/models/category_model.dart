import 'package:anand_yogalaya/controllers/content_controller.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryModel {
  String id = '';
  String name = '';
  String imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/anandyogalaya-8991a.appspot.com/o/categories%2FAsans.png?alt=media&token=336aba73-a341-416b-b27c-0f6da04e55b9';
  int? totalDuration;
  bool isPlayList =
      true; //Default value is true because all the categories will be updated at first.
  bool isPremium = false;
  String searchKeywords = '';
  List<String>? contents;

  //Color varible is not stored in firebase, it is defined for in app UI purpose.
  Color? color = Colors.indigo[400];
  late CachedNetworkImage imageWidget;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.totalDuration = 0,
    required this.isPlayList,
    this.isPremium = false,
    this.searchKeywords = '',
    this.contents,
    this.color = Colors.indigo,
  }) {
    _initialize();
  }

  void _initialize() {
    contents ??= [];

    if(totalDuration == null || totalDuration! <= 0){
      totalDuration = 0;
      _calculateTotalDuration();
    }

    if (imageUrl.isEmpty) {
      imageUrl =
          'https://firebasestorage.googleapis.com/v0/b/anandyogalaya-8991a.appspot.com/o/categories%2FAsans.png?alt=media&token=336aba73-a341-416b-b27c-0f6da04e55b9';
    }

    if (searchKeywords.trimLeft().trimRight().isEmpty) {
      createSearchKeywords();
    }

    imageWidget = CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Future<void> _calculateTotalDuration()async{
    ContentController contentController = Get.find();

    for(int i=0;i<contentController.getContentList.length;i++){
      if(contents!.contains(contentController.getContentList[i].id)){
        totalDuration= totalDuration! + contentController.getContentList[i].duration!;
      }
    }
  }

  //Creates the srachkeywords to help in searching
  void createSearchKeywords() {
    String keywords = '';

    keywords += name;
    if (isPremium) {
      keywords += ' premium vip';
    }
    if (contents != null) {
      for (int i = 0; i < contents!.length; i++) {
        keywords += ' ' + contents![i];
      }
    }

    searchKeywords = keywords.trim().toLowerCase();
  }

  CategoryModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot['id'];
    name = documentSnapshot['name'];
    totalDuration = documentSnapshot['totalDuration'];
    imageUrl = documentSnapshot['imageUrl'];
    isPlayList = documentSnapshot['isPlayList'];
    searchKeywords = documentSnapshot['searchKeywords'];
    isPremium = documentSnapshot['isPremium'];
    contents = documentSnapshot['contents'] != null
        ? List<String>.from(documentSnapshot['contents'])
        : [];
    print('Reading doc snapshot; $name');
    _initialize();
  }

  CategoryModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalDuration = json['totalDuration'];
    isPlayList = json['isPlayList'];
    searchKeywords = json['searchKeywords'];
    isPremium = json['isPremium'];
    contents =
        json['contents'] != null ? List<String>.from(json['contents']) : [];

    _initialize();
  }

  Map<String, dynamic> toMap() {
    contents ??= [];

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['totalDuration'] = totalDuration;
    data['isPlayList'] = isPlayList;
    data['isPremium'] = isPremium;
    data['searchKeywords'] = searchKeywords;
    data['contents'] = contents;
    return data;
  }
}
