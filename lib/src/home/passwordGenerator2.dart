import 'package:cofredesenha/src/home.dart';
import 'package:cofredesenha/src/home/passwordGenerator.dart';
import 'package:cofredesenha/utils/button.dart';
import 'package:cofredesenha/utils/screenUtils.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class PasswordGenerator2 extends StatefulWidget {

  @override
  _PasswordGenerator2State createState() => _PasswordGenerator2State();
}

class _PasswordGenerator2State extends State<PasswordGenerator2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
        body: PasswordGenerator(),
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



// _showInfoFlushbarHelper(BuildContext context) {
//   FlushbarHelper.createInformation(
//     title: 'Senha copiada',
//     message: 'Agora é só colar onde você quiser!',
//   ).show(context);
// }

}