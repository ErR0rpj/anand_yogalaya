class Categories {
  String? name;
  int? totalDuration;
  bool? isPlayList;
  String? searchKeyWords;
  List<String>? contents;

  Categories(
      {this.name,
        this.totalDuration,
        this.isPlayList,
        this.searchKeyWords,
        this.contents});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    totalDuration = json['totalDuration'];
    isPlayList = json['isPlayList'];
    searchKeyWords = json['searchKeyWords'];
    contents = json['contents'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['totalDuration'] = this.totalDuration;
    data['isPlayList'] = this.isPlayList;
    data['searchKeyWords'] = this.searchKeyWords;
    data['contents'] = this.contents;
    return data;
  }
}