import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id; //ID can be mobile number or email to find users easily
  String? name;
  String? email;
  String? phoneNo;
  DateTime? dob;
  String? gender;
  String? photoUrl; //Profile phtot url to be stored in firebase storage
  bool isPremium = false; //Default value is false
  DateTime? premiumStartDate;
  DateTime? premiumEndDate;
  List<String>?
      contentLikedByUser; //This is list of UID of liked contents by user.

  UserModel({
    this.name,
    this.id,
    this.email,
    this.photoUrl,
    this.isPremium = false,
    this.premiumStartDate,
    this.premiumEndDate,
    this.phoneNo,
    this.dob,
    this.gender,
    this.contentLikedByUser,
  });

  UserModel.fromMap(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    isPremium = json['isPremium'];
    premiumStartDate = json['premiumStartDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            json['premiumStartDate'].millisecondsSinceEpoch)
        : null;
    premiumEndDate = json['premiumEndDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            json['premiumEndDate'].millisecondsSinceEpoch)
        : null;
    phoneNo = json['phoneNo'];
    dob = json['dob'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            json['dob'].millisecondsSinceEpoch)
        : null;
    gender = json['gender'];
    contentLikedByUser = json['contentLikedByUser'] != null
        ? List<String>.from(json['contentLikedByUser'])
        : [];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data['isPremium'] = isPremium;
    data['premiumStartDate'] = premiumStartDate;
    data['premiumEndDate'] = premiumEndDate;
    data['phoneNo'] = phoneNo;
    data['dob'] = dob;
    data['gender'] = gender;
    data['contentLikedByUser'] = contentLikedByUser;
    return data;
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    email = snapshot['email'];
    name = snapshot['name'];
    contentLikedByUser = snapshot['contentLikedByUser'] != null
        ? List<String>.from(snapshot['contentLikedByUser'])
        : [];
  }
}
