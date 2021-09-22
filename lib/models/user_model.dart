class UserModel {
  String name;
  String phone;
  String email;
  String uId;
  bool isEmailVerified;
  String bio;
  String education;
  String address;
  String dateOfBirth;
  String gender;
  String work;
  String relationship;
  String profileImage;
  String coverImage;
  String password;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.uId,
    this.isEmailVerified,
    this.bio,
    this.education,
    this.dateOfBirth,
    this.work,
    this.gender,
    this.relationship,
    this.profileImage,
    this.coverImage,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
    relationship = json['relationship'];
    gender = json['gender'];
    work = json['work'];
    dateOfBirth = json['dateOfBirth'];
    education = json['education'];
    bio = json['bio'];
    profileImage = json['profileImage'];
    coverImage = json['coverImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      'uId': uId,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
      'education': education,
      'dateOfBirth': dateOfBirth,
      'work': work,
      'gender': gender,
      'relationship': relationship,
      'profileImage': profileImage,
      'coverImage': coverImage,
    };
  }
}
