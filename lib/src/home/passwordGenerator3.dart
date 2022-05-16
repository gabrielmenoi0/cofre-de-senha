import 'package:cofredesenha/src/home.dart';
import 'package:cofredesenha/src/home/passwordGenerator.dart';
import 'package:cofredesenha/utils/button.dart';
import 'package:cofredesenha/utils/screenUtils.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class PasswordGenerator3 extends StatefulWidget {

  @override
  _PasswordGenerator3State createState() => _PasswordGenerator3State();
}

class _PasswordGenerator3State extends State<PasswordGenerator3> {

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