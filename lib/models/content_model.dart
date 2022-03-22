import 'dart:math';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../services/youtube_player_configured/youtube_player_flutter.dart';

class ContentModel {
  String id = '';
  String name = '';
  String? description;
  String? videoUrl; //If video url is null, content will be treated as blog
  String photoUrl = '';
  int? duration; //Duration to complete the content in seconds
  bool isPremium = false;
  String searchKeywords = '';
  int views = 0;
  DateTime? addedDate;
  List<String>? categories;
  List<String>? likes;

  //Color varible is not stored in firebase, it is defined for in app UI purpose.
  Color color = Colors.indigo[400]!;
  late CachedNetworkImage imageWidget;

  ContentModel({
    this.id = '',
    required this.name,
    this.description,
    this.photoUrl = '',
    this.videoUrl,
    this.duration,
    this.isPremium = false,
    this.searchKeywords = '',
    this.views = 0,
    this.addedDate,
    this.categories,
    this.likes,
  }) {
    _initialize();
  }

  void _initialize() {
    addedDate ??= DateTime.now();

    if (id.isEmpty) {
      id = name + '_';
      if (addedDate != null) {
        id += addedDate!.millisecondsSinceEpoch.toString();
      }
    }

    categories ??= [];
    likes ??= [];

    if (searchKeywords.trimLeft().trimRight().isEmpty) {
      createSearchKeywords();
    }

    if (videoUrl != null && videoUrl!.trimLeft().trimRight().isNotEmpty) {
      String url = YoutubePlayer.getThumbnail(
        videoId: YoutubePlayer.convertUrlToId(videoUrl!)!,
      );

      if (url.isNotEmpty) {
        photoUrl = url;
      }
    }

    categories ??= [];
    likes ??= [];

    color = colorList[Random().nextInt(colorList.length)];

    imageWidget = CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: photoUrl,
      imageBuilder: (_, child) {
        return FittedBox(
          fit: BoxFit.fill,
          child: Image(
            image: child,
          ),
        );
      },
      placeholder: (context, url) =>
          Shimmer.fromColors(
            baseColor: kPrimaryPurple,
            highlightColor:
            kPrimaryPurple.withOpacity(0.5),
            period: Duration(seconds: 2),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: kPrimaryPurple
              ),
              /*decoration: ShapeDecoration(
                  color: kPrimaryPurple.withOpacity(0.5), shape: CircleBorder()),*/
            ),
          ),
      errorWidget: (context, url, error) => ClipRRect(
        borderRadius: BorderRadius.circular(TOP_WORKOUT_IMAGE_RADIUS),
        child: const Icon(
          Icons.play_arrow_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
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
    likes = json['likes'] != null ? List<String>.from(json['likes']) : [];
    _initialize();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    duration ??= 0;
    description ??= '';
    videoUrl ??= '';
    addedDate ??= DateTime.now();
    categories ??= [];
    likes ??= [];

    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['photoUrl'] = photoUrl;
    data['videoUrl'] = videoUrl;
    data['duration'] = duration;
    data['isPremium'] = isPremium;
    data['searchKeywords'] = searchKeywords;
    data['views'] = views;
    data['addedDate'] = addedDate;
    data['categories'] = categories;
    data['likes'] = likes;
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
    likes = documentSnapshot['likes'] != null
        ? List<String>.from(documentSnapshot['likes'])
        : [];
    _initialize();
  }
}
