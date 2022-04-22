class PasswordModel {
  int? status;
  String? statusInformation;
  String? statusDescription;
  Results? results;

  PasswordModel(
      {this.status,
        this.statusInformation,
        this.statusDescription,
        this.results});

  PasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusInformation = json['status_information'];
    statusDescription = json['status_description'];
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_information'] = this.statusInformation;
    data['status_description'] = this.statusDescription;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  List<Passwords>? passwords;

  Results({this.passwords});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['Passwords'] != null) {
      passwords = <Passwords>[];
      json['Passwords'].forEach((v) {
        passwords!.add(new Passwords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.passwords != null) {
      data['Passwords'] = this.passwords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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