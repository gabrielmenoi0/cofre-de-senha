import 'dart:math';

import 'package:cofredesenha/data/database.dart';
import 'package:cofredesenha/models/BankModel.dart';
import 'package:cofredesenha/models/SaveAccaunt.dart';
import 'package:cofredesenha/models/passwordModel.dart';
import 'package:cofredesenha/src/home.dart';
import 'package:cofredesenha/src/home/passwordGenerator.dart';
import 'package:cofredesenha/src/home/viewPassword.dart';
import 'package:cofredesenha/utils/button.dart';
import 'package:cofredesenha/utils/screenUtils.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:cofredesenha/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditBank extends StatefulWidget {
  String? bank;
  String? agency;
  String? accaunt;
  String? password;
  String? type;
  int? id;


  EditBank({Key? key, this.bank, this.agency, this.accaunt, this.password,this.type, this.id}) : super(key: key);

  @override
  _EditBank createState() => _EditBank();
}

class _EditBank extends State<EditBank> {

  @override
  void initState() {
    BankController.text = widget.bank!;
    passwordController.text = widget.password!;
    AgencyController.text = widget.agency!;
    AccauntController.text = widget.accaunt!;
    save.id = widget.id!;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  final DatabaseProvider _dbHelper = DatabaseProvider.db;
  String data = "";
  List<Passwords> info = [];
  final _formKey = GlobalKey<FormState>();
  BankModel save = BankModel();
  TextEditingController BankController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController AgencyController = TextEditingController();
  TextEditingController AccauntController = TextEditingController();
  TextEditingController _controllerTamanho = TextEditingController(text: "8");

  String senha = "";

  bool letrasMaiusculas = true;
  bool letrasMinusculas = true;
  bool numeros = true;
  bool simbolos = true;

  senhaGerada(bool letrasMai, bool letrasMin, bool numeros, bool simbolos) {

    if(letrasMai == false && letrasMin == false && numeros == false && simbolos == false) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(

              content: Text("Para gerar senha é necessário que pelo menos uma opção esteja selecionada."),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () => Navigator.pop(context),
                )
              ],

            );
          }
      );
    } else {

      String letrasMaiusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      String letrasMinusculas = "abcdefghijklmnopqrstuvwxyz";
      String numbers = "0123456789";
      String symbolos = "!@#\$%&*(){}[]-_=+<>,./";

      int tam = int.parse(_controllerTamanho.text);

      String senhaGer = "";
      senhaGer += (letrasMai ? letrasMaiusculas : "");
      senhaGer += (letrasMin ? letrasMinusculas : "");
      senhaGer += (numeros ? numbers : "");
      senhaGer += (simbolos ? symbolos : "");

      String pass = "";

      for(int i = 0; i < tam; i++) {
        int random = Random.secure().nextInt(senhaGer.length);
        pass += senhaGer[random];
        setState(() {
          senha = pass;
        });
      }

      return senha;

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _button(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: (){
              // Navigator.pop(context);
              // Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));

            }
        ),
        title: Text("Edite sua Conta",
            style: DefaultStyle.textStyle(
                size: 24,
                fontWeight: FontWeight.w700,
                color: DefaultColors.darkColor2)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  formBill(),
                  SizedBox(
                    height: 500,
                    child: PasswordGenerator(),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
  _botaoGerarSenha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultButton(
            callback: ()=> senhaGerada(
              letrasMaiusculas,
              letrasMinusculas,
              numeros,
              simbolos,
            ),
            context: context, title: "Gerar senha",
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20))
      ],
    );

  }
  formBill() {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        TextFormField(
          onSaved: (value){
            save.bank = BankController.text;
          },
          controller: BankController,
          keyboardType: TextInputType.text,
          validator: (String? name) {
            if (name!.isEmpty) {
              return "Campo obrigatório";
            }
          },
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: "Banco",
            labelStyle: DefaultStyle.textStyle(
                size: 20,
                color: DefaultColors.darkColor2,
                fontWeight: FontWeight.w400),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Color.fromRGBO(218, 218, 221, 1))),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        TextFormField(
          onSaved: (value){
            save.agency = AgencyController.text;
          },
          controller: AgencyController,
          keyboardType: TextInputType.text,
          // inputFormatters: [mask],
          validator: (String? name) {
            if (name!.isEmpty) {
              return "Campo obrigatório";
            }
          },
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: "Agência",
            labelStyle: DefaultStyle.textStyle(
                size: 20,
                color: DefaultColors.darkColor2,
                fontWeight: FontWeight.w400),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Color.fromRGBO(218, 218, 221, 1))),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        TextFormField(
          onSaved: (value){
            save.account = AccauntController.text;
          },
          controller: AccauntController,
          keyboardType: TextInputType.text,
          // validator: (String? name) {
          //   if (name!.isEmpty) {
          //     return "Campo obrigatório";
          //   }
          // },
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: "Conta",
            labelStyle: DefaultStyle.textStyle(
                size: 20,
                color: DefaultColors.darkColor2,
                fontWeight: FontWeight.w400),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Color.fromRGBO(218, 218, 221, 1))),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        TextFormField(
          onSaved: (value){
            save.password = passwordController.text;
            save.type = "Default";
          },
          controller: passwordController,
          keyboardType: TextInputType.text,
          // validator: (String? name) {
          //   if (name!.isEmpty) {
          //     return "Campo obrigatório";
          //   }
          // },
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: DefaultStyle.textStyle(
                size: 20,
                color: DefaultColors.darkColor2,
                fontWeight: FontWeight.w400),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Color.fromRGBO(218, 218, 221, 1))),
          ),
        ),
      ],
    );
  }
  _button() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: DefaultButton(
        context: context,
        title: "Alterar",
        callback: go,
      ),
    );
  }

  go() async{
    try{
      String? teste;
      if (!_formKey.currentState!.validate()) return;
      save.id = save.id;
      _formKey.currentState!.save();

      var auth = await _dbHelper.editBank(save);
      print(save.toJson());
      // Navigator.pop(context);
      // Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));

    }catch(e){
      DefaultScreenUtils.onMessage(context: context, message: "Erro ao alterar!", isError: true);
    }

  }

  emptyRefund() {
    return Column(
      children: [
        // Center(
        //     child: Image.asset(
        //       DefaultAssets.emptyDependents,
        //       height: 250,
        //     )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nenhuma senha cadastrada!",
              style: DefaultStyle.textStyle(
                  fontWeight: FontWeight.w700,
                  color: DefaultColors.darkColor2,
                  size: 24),
            )
          ],
        ),
      ],
    );
  }
}
