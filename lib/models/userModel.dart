class UserModel {
  int? id;
  String? bank;
  String? name;
  String? cpf;
  String? cpfUser;
  String? agency;
  String? account;

  UserModel(
      {this.bank,
        this.name,
        this.cpf,
        this.cpfUser,
        this.agency,
        this.account,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bank = json['bank'];
    name = json['nameAccount'];
    cpf = json['cpfAccount'];
    agency = json['agencyAccount'];
    account = json['account'];
    cpfUser = json['cpfUser'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank'] = this.bank;
    data['nameAccount'] = this.name;
    data['cpfAccount'] = this.cpf;
    data['cpfUser'] = this.cpfUser;
    data['agencyAccount'] = this.agency;
    data['account'] = this.account;
    return data;
  }
}
