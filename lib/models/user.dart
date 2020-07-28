class User {
  String uid;
  String name;
  String email;
  String username;
  String status;
  int state;
  String profilePhoto;

  User(
      {this.uid,
      this.name,
      this.email,
      this.username,
      this.status,
      this.state,
      this.profilePhoto});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    status = json['status'];
    state = json['state'];
    profilePhoto = json['profilePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['status'] = this.status;
    data['state'] = this.state;
    data['profilePhoto'] = this.profilePhoto;
    return data;
  }
}
