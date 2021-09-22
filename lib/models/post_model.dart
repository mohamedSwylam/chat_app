class PostModel {
  String name;
  String uId;
  String profileImage;
  String dateTime;
  String text;
  String postImage;

  PostModel({
    this.name,
    this.dateTime,
    this.text,
    this.uId,
    this.postImage,
    this.profileImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
    uId = json['uId'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateTime': dateTime,
      'postImage': postImage,
      'text': text,
      'uId': uId,
      'profileImage': profileImage,
    };
  }
}
