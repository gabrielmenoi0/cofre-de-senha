import 'dart:convert';
import 'dart:io';

import 'package:cofredesenha/models/SaveAccaunt.dart';
import 'package:cofredesenha/models/cliente.dart';
import 'package:cofredesenha/models/registerModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


//USER
const String tableUser = 'User';
const String columnId = 'id';
const String columnCode = 'codigo';
const String columnDoc = 'cpf';
const String columnName = 'NOME';
const String columnCashback = 'utiliza_saldo_cashback';
const String columnCompanyName = 'empresa_credito';
const String columnCompanyBenefits = 'produto_guid';
const String columnAdress = 'endereco';
const String columnNumber = 'numero_endereco';
const String columnComplement = 'complemento';
const String columnBairro = 'bairro';
const String columnCep = 'cep';
const String columnCountry = 'uf';
const String columnCity = 'cidade';
const String columnSenha = 'SENHA';
const String columnEmail = 'EMAIL';



const String tableAccount = 'Account';
// const String columnIdAccount = 'idAccount';
const String columnLocal = 'local';
const String columnPassword = 'password';
const String columnObservation = 'observation';


const String tableBenefitsPayment = 'Benefits';
const String columnCodeBenefit = 'codigo';
const String columnNameBenefit = 'nome';
const String columnValueBenefit = 'saldo';

const String tableProduct = "tableProduct";
const String columncodigo = "codigo";
const String columnnome = "nome";
const String columnsaldo = "saldo";
const String columncodBeneficiadorAtual = "cod_beneficiador_atual";
const String columnpermiteSaque = "permite_saque";
const String columnbeneficiador = "beneficiador";
const String columndependente = "dependente";
const String columncodTitular = "cod_titular";
const String columnparcelamento = "parcelamento";
const String columnramos = "ramos";


// const String tableListBenefitsPayment = 'ListBenefits';



class DatabaseProvider {

  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // // if _database is null we instantiate it
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database.db");

    // await deleteDatabase(path);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
    create table $tableUser (
    $columnId integer primary key autoincrement,
    $columnCode text,
    $columnDoc text,
    $columnName text,
    $columnSenha text,
    $columnCashback text,
    $columnCompanyName text,
    $columnCompanyBenefits text,
    $columnAdress text,
    $columnNumber text,
    $columnComplement text,
    $columnBairro text,
    $columnCep text,
    $columnCountry text,
    $columnCity text,
    $columnEmail text 
    
    )''');

    await db.execute('''
    create table $tableAccount (
    $columnId integer primary key autoincrement,
    $columnLocal text not null,
    $columnPassword text not null,
    $columnObservation text not null
    )''');

    await db.execute('''
    create table $tableBenefitsPayment (
    $columnId integer primary key autoincrement,
    $columnValueBenefit text
    )''');

    await db.execute('''
    create table $tableProduct (
    $columnId integer primary key autoincrement,
    $columncodigo text,
    $columnnome text,
    $columnsaldo text,
    $columncodBeneficiadorAtual text,
    $columnpermiteSaque text,
    $columnbeneficiador text,
    $columndependente integer,
    $columncodTitular text,
    $columnparcelamento text,
    $columnramos text
    )''');

  }


  Future<int> saveCustomer(RegisterModel responseModel,) async {
    final db = await database;
    var res = await db.insert(tableUser, {
      columnName: responseModel.nome ?? "",
      columnSenha: responseModel.senha ?? "",
      columnEmail: responseModel.email ?? "",
    });

    return res;
  }

  Future<int> deleteCustomer() async {
    final db = await database;
    var res = await db.delete(tableUser);
    return res;
  }

  Future<Cliente> getCustomer() async {
    final db = await database;
    var res = await db.query(tableUser);

    List<Cliente> list = res.isNotEmpty
        ? res.map((c) => Cliente.fromJson(c)).toList()
        : [];
    return list.first;
  }
  //
  // Future<int> updateCustomer(Cliente customerModel) async {
  //   final db = await database;
  //
  //   var res = await db.update(tableUser, {
  //     columnDoc: customerModel.cpf ?? "",
  //     columnCode: customerModel.codigo ?? "",
  //     columnName: customerModel.nome ?? "",
  //     columnCashback: customerModel.utilizaSaldoCashback ?? "",
  //     columnAdress: customerModel.endereco ?? "",
  //     columnNumber: customerModel.numeroEndereco ?? "",
  //     columnComplement: customerModel.complemento ?? "",
  //     columnBairro: customerModel.bairro ?? "",
  //     columnCep: customerModel.cep ?? "",
  //     columnCountry: customerModel.uf ?? "",
  //     columnCity: customerModel.cidade ?? "",
  //
  //   }, where: '$columnId = ?',
  //       whereArgs: [customerModel.id]
  //   );
  //
  //   return res;
  // }
  // Future<List<Benefit>> getBenefit() async {
  //   final db = await database;
  //   var res = await db.query(tableBenefitsPayment);
  //
  //   List<Benefit> list = res.isNotEmpty
  //       ? (json.decode(res.toString()) as List).map((c) => Benefit.fromJson(c)).toList()
  //       : [];
  //   return list;
  // }
  // Future<void> saveBenefit(List<Benefit> saveBenefitModel) async {
  //   final db = await database;
  //
  //   await db.insert(tableBenefitsPayment, {
  //     columnValueBenefit: json.encode(saveBenefitModel),
  //   });
  //
  // }
  // Future<int> saveProduct(Produtos product) async {
  //   final db = await database;
  //
  //   var res = await db.insert(tableProduct, product.toJson() );
  //   return res;
  //
  // }
  //
  // Future<List<Produtos>> getAllProduct() async {
  //   final db = await database;
  //   var res = await db.rawQuery('SELECT * FROM $tableProduct');
  //   List<Produtos> lista =[];
  //   for(Map p in res){
  //     lista.add(Produtos.fromJson(p as Map<String,dynamic>));
  //   }
  //   return lista;
  // }

  Future<int> saveAccount(SaveAccountModel saveAccountModel) async {
    final db = await database;
    // var cpf = await getCustomer();
    var res = await db.insert(tableAccount, {
      columnLocal: saveAccountModel.local ?? "",
      columnPassword: saveAccountModel.password ?? "",
      columnObservation: saveAccountModel.observation ?? "",

    });

    return res;
  }

  Future<int> deleteAccount(SaveAccountModel saveAccountModel) async {
    final db = await database;
    var res = await db.delete(tableAccount,where: "id = ?", whereArgs: [saveAccountModel.id]);
    return res;
  }

  Future<List<SaveAccountModel>> getAccount() async {
    final db = await database;
    var res = await db.query(tableAccount);
    List<SaveAccountModel> list = res.isNotEmpty
        ? res.map((c) => SaveAccountModel.fromJson(c)).toList()
        : [];
    return list;
  }
}
