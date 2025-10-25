class ProfileUserModel {
  String? name;
  String? email;
  String? phone;
  String? bio;
  String? image;

  ProfileUserModel({this.name, 
  this.email, 
  this.phone, 
  this.bio, this.image});

  ProfileUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    bio = json['bio'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['bio'] = bio;
    data['image'] = image;
    return data;
  }
}