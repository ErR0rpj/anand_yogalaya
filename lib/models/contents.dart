class Contents {
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

  Contents({
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

  Contents.fromMap(Map<String, dynamic> json) {
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
}
