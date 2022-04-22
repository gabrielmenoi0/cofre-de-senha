class RegisterModel {
  String? nome;
  String? senha;
  String? email;


  RegisterModel(
      {this.nome,
        this.senha,
        this.email,});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    nome = json['NOME'];
    senha = json['SENHA'];
    email = json['EMAIL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['NOME'] = nome;
    data['SENHA'] = senha;
    data['EMAIL'] = email;
    return data;
  }
}