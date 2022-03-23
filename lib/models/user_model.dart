import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id; //ID can be mobile number or email to find users easily
  String? name;
  String? email;
  bool isAdmin = false;
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
    isAdmin = json['isAdmin'];
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
    id ??= '';
    name ??= '';
    email ??= '';
    photoUrl ??= '';
    phoneNo ??= '';
    gender ??= '';
    contentLikedByUser ??= [];

    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['isAdmin'] = isAdmin;
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
    try {
      id = snapshot.id;
      email = snapshot['email'];
      name = snapshot['name'];
      isAdmin = snapshot['isAdmin'];
      contentLikedByUser = snapshot['contentLikedByUser'] != null
          ? List<String>.from(snapshot['contentLikedByUser'])
          : [];
      photoUrl = snapshot['photoUrl'];
      isPremium = snapshot['isPremium'];
      premiumStartDate = snapshot['premiumStartDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              snapshot['premiumStartDate'].millisecondsSinceEpoch)
          : null;
      premiumEndDate = snapshot['premiumEndDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              snapshot['premiumEndDate'].millisecondsSinceEpoch)
          : null;
      phoneNo = snapshot['phoneNo'];
      dob = snapshot['dob'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              snapshot['dob'].millisecondsSinceEpoch)
          : null;
      gender = snapshot['gender'];
    } catch (e) {
      try {
        id = snapshot.id;
        email = snapshot['email'];
        name = snapshot['name'];
        isAdmin = isAdmin;
        contentLikedByUser = snapshot['contentLikedByUser'] != null
            ? List<String>.from(snapshot['contentLikedByUser'])
            : [];
      } catch (e) {
        id = snapshot.id;
        email = snapshot['email'];
        name = snapshot['name'];
        isAdmin = false;
        contentLikedByUser = snapshot['contentLikedByUser'] != null
            ? List<String>.from(snapshot['contentLikedByUser'])
            : [];
      }
    }
  }
}
