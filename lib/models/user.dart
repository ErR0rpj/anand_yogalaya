class User {
  String? name;
  String? id;
  String? email;
  String? photoUrl;
  bool? isPremium;
  String? premiumStartDate; // To be TimeStamp
  String? premiumEndDate; // To be TimeStamp
  String? phoneNo;
  String? dob;
  String? gender;
  List<String>? contentLikedByUser;

  User(
      {this.name,
        this.id,
        this.email,
        this.photoUrl,
        this.isPremium,
        this.premiumStartDate,
        this.premiumEndDate,
        this.phoneNo,
        this.dob,
        this.gender,
        this.contentLikedByUser});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    isPremium = json['isPremium'];
    premiumStartDate = json['premiumStartDate'];
    premiumEndDate = json['premiumEndDate'];
    phoneNo = json['phoneNo'];
    dob = json['dob'];
    gender = json['gender'];
    contentLikedByUser = json['contentLikedByUser'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['isPremium'] = this.isPremium;
    data['premiumStartDate'] = this.premiumStartDate;
    data['premiumEndDate'] = this.premiumEndDate;
    data['phoneNo'] = this.phoneNo;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['contentLikedByUser'] = this.contentLikedByUser;
    return data;
  }
}