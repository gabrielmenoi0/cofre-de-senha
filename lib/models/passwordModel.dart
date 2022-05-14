class Passwords {
  int? id;
  String? local;
  String? senha;
  String? observation;

  Passwords({this.local, this.senha, this.observation});

  Passwords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    local = json['local'];
    senha = json['senha'];
    observation = json['observation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['local'] = this.local;
    data['senha'] = this.senha;
    data['observation'] = this.observation;
    return data;
  }
}