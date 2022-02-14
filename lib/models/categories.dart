import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Categories {
  String id = '';
  String name = '';
  int? totalDuration;
  bool isPlayList =
      true; //Default value is true because all the categories will be updated at first.
  bool isPremium = false;
  String searchKeyWords = '';
  List<String>? contents;

  //Color varible is not stored in firebase, it is defined for in app UI purpose.
  Color color = Colors.indigo;
  String imageUrl = 'assets/images/yoga_1.png';

  Categories({
    required this.id,
    required this.name,
    this.totalDuration,
    this.isPlayList = true,
    this.searchKeyWords = '',
    this.contents,
    this.color = Colors.indigo,
    this.imageUrl = 'assets/images/yoga_1.png',
  }) {
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

  Categories.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    name = documentSnapshot['name'];
    totalDuration = documentSnapshot['totalDuration'];
    isPlayList = documentSnapshot['isPlayList'];
    searchKeyWords = documentSnapshot['searchKeyWords'];
    isPremium = documentSnapshot['isPremium'];
    contents = documentSnapshot['contents'] != null
        ? List<String>.from(documentSnapshot['contents'])
        : [];
  }

  Categories.fromMap(Map<String, dynamic> json) {
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
