class Contents {
  String? name;
  int? description;
  String? photoUrl;
  String? videoUrl;
  int? duration;
  bool? isPremium;
  String? searchKeyWords;
  int? views;
  String? addedDate; // to be changed into TimeStamp
  List<String>? categories;

  Contents(
      {this.name,
        this.description,
        this.photoUrl,
        this.videoUrl,
        this.duration,
        this.isPremium,
        this.searchKeyWords,
        this.views,
        this.addedDate,
        this.categories});

  Contents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    photoUrl = json['photoUrl'];
    videoUrl = json['videoUrl'];
    duration = json['duration'];
    isPremium = json['isPremium'];
    searchKeyWords = json['searchKeyWords'];
    views = json['views'];
    addedDate = json['addedDate'];
    categories = json['categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['photoUrl'] = this.photoUrl;
    data['videoUrl'] = this.videoUrl;
    data['duration'] = this.duration;
    data['isPremium'] = this.isPremium;
    data['searchKeyWords'] = this.searchKeyWords;
    data['views'] = this.views;
    data['addedDate'] = this.addedDate;
    data['categories'] = this.categories;
    return data;
  }
}