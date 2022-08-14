class FeedModel {
  int? id;
  String? mediaFiles;
  String? description;
  String? title;
  int? like;

  FeedModel(
      {this.id, this.mediaFiles, this.description, this.title, this.like});

  FeedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaFiles = json['media_files'];
    description = json['description'];
    title = json['title'];
    like = json['like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media_files'] = this.mediaFiles;
    data['description'] = this.description;
    data['title'] = this.title;
    data['like'] = this.like;
    return data;
  }
}
