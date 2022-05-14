import 'package:cofredesenha/src/home.dart';
import 'package:cofredesenha/utils/button.dart';
import 'package:cofredesenha/utils/screenUtils.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class PasswordGenerator extends StatefulWidget {

  @override
  _PasswordGeneratorState createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {

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
        // backgroundColor: Colors.white,
        // appBar: _appBar(),
        body: _body()
    );
  }

  _appBar() {
    return AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: (){
            // Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));

          }
      ),
      title: Text("Gerador de senhas", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      centerTitle: true,
      backgroundColor: DefaultColors.secondaryColor,
      elevation: 0,
    );
  }

  _body() {
    return Card(
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Gerador de senhas", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .70,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                      "$senha",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  color: DefaultColors.primaryColor,
                  child: TextButton(
                    // color: DefaultColors.secondaryColor,
                    // padding: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.content_copy, color: Colors.white,),
                        Text("Copiar", style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    onPressed: (){
                      Clipboard.setData(ClipboardData(text: senha));
                      senha.isNotEmpty ? DefaultScreenUtils.onMessage(context: context, message: "Senha copiada para sua Área de transferência!", isError: false): "";

                      // _showInfoFlushbarHelper(context);
                    },
                  ),
                )


              ],
            ),
            _botaoGerarSenha(),
            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xfffff),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Tamanho"),
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          child: TextField(
                            controller: _controllerTamanho,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Letras maiúsculas"),
                        Checkbox(
                          value: letrasMaiusculas,
                          checkColor: Colors.white,
                          activeColor: DefaultColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              letrasMaiusculas = value!;
                            });
                          },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Letras minúsculas"),
                        Checkbox(
                          value: letrasMinusculas,
                          checkColor: Colors.white,
                          activeColor: DefaultColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              letrasMinusculas = value!;
                            });
                          },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Números"),
                        Checkbox(
                          value: numeros,
                          checkColor: Colors.white,
                          activeColor: DefaultColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              numeros = value!;
                            });
                          },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Símbolos"),
                        Checkbox(
                          value: simbolos,
                          checkColor: Colors.white,
                          activeColor: DefaultColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              simbolos = value!;
                            });
                          },
                        )
                      ],
                    ),

                  ],
                )
            ),
          ],
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

  // _showInfoFlushbarHelper(BuildContext context) {
  //   FlushbarHelper.createInformation(
  //     title: 'Senha copiada',
  //     message: 'Agora é só colar onde você quiser!',
  //   ).show(context);
  // }

}