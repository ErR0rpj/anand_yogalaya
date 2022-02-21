import 'package:cloud_firestore/cloud_firestore.dart';

class ContentModel {
  String id = '';
  String name = '';
  String? description;
  String? videoUrl; //If video url is null, content will be treated as blog
  String? photoUrl;
  int? duration; //Duration to complete the content in seconds
  bool isPremium = false;
  String searchKeyWords = '';
  int views = 0;
  DateTime? addedDate;
  List<String>? categories;

  ContentModel({
    required this.id,
    required this.name,
    this.description,
    this.photoUrl,
    this.videoUrl,
    this.duration,
    this.isPremium = false,
    this.searchKeyWords = '',
    this.views = 0,
    this.addedDate,
    this.categories,
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
    if (categories != null) {
      for (int i = 0; i < categories!.length; i++) {
        keywords += ' ' + categories![i];
      }
    }

    searchKeyWords = keywords.trim().toLowerCase();
  }

  ContentModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photoUrl = json['photoUrl'];
    videoUrl = json['videoUrl'];
    duration = json['duration'];
    isPremium = json['isPremium'];
    searchKeyWords = json['searchKeyWords'];
    views = json['views'];
    addedDate = json['addedDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            json['addedDate'].millisecondsSinceEpoch)
        : null;
    categories =
        json['categories'] != null ? List<String>.from(json['categories']) : [];
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
    data['searchKeyWords'] = searchKeyWords;
    data['views'] = views;
    data['addedDate'] = addedDate;
    data['categories'] = categories;
    return data;
  }

  ContentModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    name = documentSnapshot['name'];
    description = documentSnapshot['description'];
    //photoUrl = documentSnapshot['photoUrl'];
    videoUrl = documentSnapshot['videoUrl'];
    duration = documentSnapshot['duration'];
   /* isPremium = documentSnapshot['isPremium'];
    searchKeyWords = documentSnapshot['searchKeyWords'];
    views = documentSnapshot['views'];
    addedDate = documentSnapshot['addedDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
        documentSnapshot['addedDate'].millisecondsSinceEpoch)
        : null;*/
    categories =
    documentSnapshot['categories'] != null ? List<String>.from(documentSnapshot['categories']) : [];
  }

}
