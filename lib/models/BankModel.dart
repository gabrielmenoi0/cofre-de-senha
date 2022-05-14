class BankModel {
  int? id;
  String? bank;
  String? agency;
  String? account;
  String? password;
  String? type;

  BankModel(
      {this.bank,
        this.agency,
        this.account,
        this.password,
        this.type,
      });

  BankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bank = json['bank'];
    agency = json['agencyAccount'];
    account = json['account'];
    password = json['bankpassword'];
    type = json['type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank'] = this.bank;
    data['agencyAccount'] = this.agency;
    data['account'] = this.account;
    data['bankpassword'] = this.password;
    data['type'] = this.type;
    return data;
  }
}
