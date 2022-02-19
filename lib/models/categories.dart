import 'package:anand_yogalaya/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id = '';
  String name = '';
  String imageUrl ='https://firebasestorage.googleapis.com/v0/b/anandyogalaya-8991a.appspot.com/o/categories%2FAsans.png?alt=media&token=336aba73-a341-416b-b27c-0f6da04e55b9';
  int? totalDuration;
  bool isPlayList =
      true; //Default value is true because all the categories will be updated at first.
  bool isPremium = false;
  String searchKeyWords = '';
  List<String>? contents;

  //Color varible is not stored in firebase, it is defined for in app UI purpose.
  Color? color = Colors.indigo[400];


  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.totalDuration,
    this.isPlayList = true,
    this.searchKeyWords = '',
    this.contents,
    this.color = Colors.indigo,

  }) {
    contents ??= [];
    if (searchKeyWords.isEmpty) {
      createSearchKeywords();
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

    searchKeyWords = keywords.trim().toLowerCase();
  }

  CategoryModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    name = documentSnapshot['name'];
    totalDuration = documentSnapshot['totalDuration'];
    imageUrl = documentSnapshot['imageUrl'];
  /*  isPlayList = documentSnapshot['isPlayList'];
    searchKeyWords = documentSnapshot['searchKeyWords'];
    isPremium = documentSnapshot['isPremium'];*/
    contents = documentSnapshot['contents'] != null
        ? List<String>.from(documentSnapshot['contents'])
        : [];
  }

  CategoryModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalDuration = json['totalDuration'];
    isPlayList = json['isPlayList'];
    searchKeyWords = json['searchKeyWords'];
    isPremium = json['isPremium'];
    contents =
        json['contents'] != null ? List<String>.from(json['contents']) : [];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['totalDuration'] = totalDuration;
    data['isPlayList'] = isPlayList;
    data['isPremium'] = isPremium;
    data['searchKeyWords'] = searchKeyWords;
    data['contents'] = contents;
    return data;
  }
}
