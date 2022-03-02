import 'dart:math';

import 'package:anand_yogalaya/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContentModel {
  String id = '';
  String name = '';
  String? description;
  String? videoUrl; //If video url is null, content will be treated as blog
  String? photoUrl;
  int? duration; //Duration to complete the content in seconds
  bool isPremium = false;
  String searchKeywords = '';
  int views = 0;
  DateTime? addedDate;
  List<String>? categories;

  //Color varible is not stored in firebase, it is defined for in app UI purpose.
  Color color = Colors.indigo[400]!;

  ContentModel({
    required this.id,
    required this.name,
    this.description,
    this.photoUrl,
    this.videoUrl,
    this.duration,
    this.isPremium = false,
    this.searchKeywords = '',
    this.views = 0,
    this.addedDate,
    this.categories,
  }) {
    _initialize();
  }

  void _initialize() {
    if (searchKeywords.trimLeft().trimRight().isEmpty) {
      createSearchKeywords();
    }

    color = colorList[Random().nextInt(colorList.length)];
  }

  //Creates the srachkeywords to help in searching
  void createSearchKeywords() {
    String keywords = '';

    keywords += name;
    if (isPremium) {
      keywords += ' premium vip';
    }
    if (categories != null) {
      for (int i = 0; i < categories!.length; i++) {
        keywords += ' ' + categories![i];
      }
    }

    searchKeywords = keywords.trim().toLowerCase();
  }

  ContentModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photoUrl = json['photoUrl'];
    videoUrl = json['videoUrl'];
    duration = json['duration'];
    isPremium = json['isPremium'];
    searchKeywords = json['searchKeywords'];
    views = json['views'];
    addedDate = json['addedDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            json['addedDate'].millisecondsSinceEpoch)
        : null;
    categories =
        json['categories'] != null ? List<String>.from(json['categories']) : [];

    _initialize();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['photoUrl'] = photoUrl;
    data['videoUrl'] = videoUrl;
    data['duration'] = duration;
    data['isPremium'] = isPremium;
    data['searchKeyWords'] = searchKeywords;
    data['views'] = views;
    data['addedDate'] = addedDate;
    data['categories'] = categories;
    return data;
  }

  ContentModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot['id'];
    name = documentSnapshot['name'];
    description = documentSnapshot['description'];
    photoUrl = documentSnapshot['photoUrl'];
    videoUrl = documentSnapshot['videoUrl'];
    duration = documentSnapshot['duration'];
    searchKeywords = documentSnapshot['searchKeywords'];
    isPremium = documentSnapshot['isPremium'];
    views = documentSnapshot['views'];
    addedDate = documentSnapshot['addedDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            documentSnapshot['addedDate'].millisecondsSinceEpoch)
        : null;
    categories = documentSnapshot['categories'] != null
        ? List<String>.from(documentSnapshot['categories'])
        : [];

    _initialize();
  }
}
