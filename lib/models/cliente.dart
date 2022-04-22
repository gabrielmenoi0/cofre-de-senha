class LoginResponseModel {
  int? status;
  String? statusInformation;
  String? statusDescription;
  Results? results;

  LoginResponseModel(
      {this.status,
        this.statusInformation,
        this.statusDescription,
        this.results});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
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
  Cliente? cliente;
  List<ClienteSaldo>? clienteSaldo;
  List<ClienteExtrato>? clienteExtrato;

  Results({this.cliente, this.clienteSaldo, this.clienteExtrato});

  Results.fromJson(Map<String, dynamic> json) {
    cliente =
    json['cliente'] != null ? new Cliente.fromJson(json['cliente']) : null;
    if (json['cliente_saldo'] != null) {
      clienteSaldo = <ClienteSaldo>[];
      json['cliente_saldo'].forEach((v) {
        clienteSaldo!.add(new ClienteSaldo.fromJson(v));
      });
    }
    if (json['cliente_extrato'] != null) {
      clienteExtrato = <ClienteExtrato>[];
      json['cliente_extrato'].forEach((v) {
        clienteExtrato!.add(new ClienteExtrato.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cliente != null) {
      data['cliente'] = this.cliente!.toJson();
    }
    if (this.clienteSaldo != null) {
      data['cliente_saldo'] =
          this.clienteSaldo!.map((v) => v.toJson()).toList();
    }
    if (this.clienteExtrato != null) {
      data['cliente_extrato'] =
          this.clienteExtrato!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cliente {

  String? nome;
  String? email;

  //DATABASE LOCAL
  int? id;


  Cliente(
      {
        this.nome,
        this.email,
      });

  Cliente.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}

class ClienteSaldo {
  String? codigo;
  String? nome;
  String? saldo;
  int? dependente;
  String? codTitular;
  String? parcelamento;

  ClienteSaldo(
      {this.codigo,
        this.nome,
        this.saldo,
        this.dependente,
        this.codTitular,
        this.parcelamento});

  ClienteSaldo.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nome = json['nome'];
    saldo = json['saldo'];
    dependente = json['dependente'];
    codTitular = json['cod_titular'];
    parcelamento = json['parcelamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['nome'] = this.nome;
    data['saldo'] = this.saldo;
    data['dependente'] = this.dependente;
    data['cod_titular'] = this.codTitular;
    data['parcelamento'] = this.parcelamento;
    return data;
  }
}

class ClienteExtrato {
  String? registro;
  String? pai;
  String? cpf;
  String? produtoGuid;
  String? acao;
  String? estornado;
  String? qtdeParcelas;
  String? valorTotalParcelado;
  String? acaoDescricao;
  String? dataAcao;
  String? valor;
  String? empresaDebito;
  String? ramo;
  String? ramoIcone;
  String? empresaCredito;
  String? produtoNome;
  String? dependenteNome;

  ClienteExtrato(
      {this.registro,
        this.pai,
        this.cpf,
        this.produtoGuid,
        this.acao,
        this.estornado,
        this.qtdeParcelas,
        this.valorTotalParcelado,
        this.acaoDescricao,
        this.dataAcao,
        this.valor,
        this.empresaDebito,
        this.ramo,
        this.ramoIcone,
        this.empresaCredito,
        this.produtoNome,
        this.dependenteNome});

  ClienteExtrato.fromJson(Map<String, dynamic> json) {
    registro = json['registro'];
    pai = json['pai'];
    cpf = json['cpf'];
    produtoGuid = json['produto_guid'];
    acao = json['acao'];
    estornado = json['estornado'];
    qtdeParcelas = json['qtde_parcelas'];
    valorTotalParcelado = json['valor_total_parcelado'];
    acaoDescricao = json['acao_descricao'];
    dataAcao = json['data_acao'];
    valor = json['valor'];
    empresaDebito = json['empresa_debito'];
    ramo = json['ramo'];
    ramoIcone = json['ramo_icone'];
    empresaCredito = json['empresa_credito'];
    produtoNome = json['produto_nome'];
    dependenteNome = json['dependente_nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registro'] = this.registro;
    data['pai'] = this.pai;
    data['cpf'] = this.cpf;
    data['produto_guid'] = this.produtoGuid;
    data['acao'] = this.acao;
    data['estornado'] = this.estornado;
    data['qtde_parcelas'] = this.qtdeParcelas;
    data['valor_total_parcelado'] = this.valorTotalParcelado;
    data['acao_descricao'] = this.acaoDescricao;
    data['data_acao'] = this.dataAcao;
    data['valor'] = this.valor;
    data['empresa_debito'] = this.empresaDebito;
    data['ramo'] = this.ramo;
    data['ramo_icone'] = this.ramoIcone;
    data['empresa_credito'] = this.empresaCredito;
    data['produto_nome'] = this.produtoNome;
    data['dependente_nome'] = this.dependenteNome;
    return data;
  }
}