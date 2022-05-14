import 'package:cofredesenha/data/database.dart';
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

class EditPassword extends StatefulWidget {
  String? local;
  String? pass;
  String? ob;
  int? id;


  EditPassword({Key? key, this.local, this.pass,this.ob, this.id}) : super(key: key);

  @override
  _EditPassword createState() => _EditPassword();
}

class _EditPassword extends State<EditPassword> {

  @override
  void initState() {
    localController.text = widget.local!;
    passwordController.text = widget.pass!;
    observationController.text = widget.ob!;
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
  SaveAccountModel save = SaveAccountModel();
  TextEditingController localController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController observationController = TextEditingController();

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
  formBill() {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        TextFormField(
          onSaved: (value){
            save.local = localController.text;
          },
          controller: localController,
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
            labelText: "Local",
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
          },
          controller: passwordController,
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
        SizedBox(
          height: 24,
        ),
        TextFormField(
          onSaved: (value){
            save.observation = observationController.text;
          },
          controller: observationController,
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
            labelText: "Observação",
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
      _formKey.currentState!.save();
      save.id = save.id;
      var auth = await _dbHelper.editAccount(save);
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
