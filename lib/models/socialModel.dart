class SocialModel {
  int? id;
  String? name;
  String? password;
  String? type;
  String? ob;

  SocialModel(
      {this.id,
        this.name,
        this.password,
        this.type,
        this.ob,
      });

  SocialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['passwordSocial'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['passwordSocial'] = this.password;
    data['type'] = this.type;
    return data;
  }
}
