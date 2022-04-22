import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cofredesenha/data/database.dart';
import 'package:cofredesenha/models/registerModel.dart';
import 'package:cofredesenha/src/message.view.dart';
import 'package:cofredesenha/src/password/viewPassword.dart';
import 'package:cofredesenha/src/register/step/register.email.step.widget.dart';
import 'package:cofredesenha/src/register/step/register.name.step.widget.dart';
import 'package:cofredesenha/src/register/step/register.password.step.widget.dart';
import 'package:cofredesenha/utils/button.dart';
import 'package:cofredesenha/utils/screenUtils.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:cofredesenha/utils/textStyle.dart';
import 'package:flutter/material.dart';


class RegisterStepsView extends StatefulWidget {
  final String document;

  const RegisterStepsView({Key? key, required this.document}) : super(key: key);

  @override
  _RegisterStepsView createState() => _RegisterStepsView();
}

class _RegisterStepsView extends State<RegisterStepsView> {

  // final RegisterController _registerController = RegisterController();

  final DatabaseProvider _dbHelper = DatabaseProvider.db;

  final CarouselController _controller = CarouselController();

  int currentPage = 0;

  final _formKey = GlobalKey<FormState>();

  final RegisterModel _registerModel = RegisterModel();

  bool _isChecked = false;
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultColors.secondaryColor,
        centerTitle: true,
        title: Text(
            _title(),
            style: DefaultStyle.textStyle(
                size: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white
            )
        ),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            _back();
          },
        ),
      ),
      body: _body(),
      bottomNavigationBar: _button(),
    );
  }

  _title() {
    switch(currentPage) {
      case 2:
        return "Cadastre uma senha";
      case 5:
        return "Termos gerais";
      default:
        return "Cadastro";
    }
  }

  Widget _body() {
    return Form(
      key: _formKey,
      child: CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: false,
            enableInfiniteScroll: false,
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0,
            initialPage: currentPage,
            onPageChanged: (val, reason) {
              setState(() {
                currentPage = val;
              });
            }
        ),
        items: [
          RegisterNameStepWidget(
            value: _registerModel.nome ?? "",
            onSaved: (value) => _registerModel.nome = value ?? "",
            onSubmit: () => _next()
          ),
          RegisterEmailStepWidget(
            value: _registerModel.email ?? "",
            onSaved: (value) => _registerModel.email = value ?? "",
            onSubmit: () => _next()
          ),
          RegisterPasswordStepWidget(
            value: _registerModel.senha ?? "",
            onSaved: (value) => _registerModel.senha = value ?? "",
            onSubmit: () => _next()
          ),
          // RegisterTermStepWidget(
          //   isChecked: _isChecked,
          //   onConfirm: (_) {
          //     setState(() {
          //       _isChecked = !_isChecked;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }

  _button() {
    return DefaultButton(
      padding: const EdgeInsets.all(10),
      context: context,
      title: currentPage == 2 ? "Concluir" : "Continuar",
      callback: () => _next(),
    );
  }

  _next() async {
    if(_formKey.currentState != null && !_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    // if(currentPage == 3) {
    //   var result = await _sendCode(CPFValidator.strip(_registerModel.telefone ?? ""));
    //
    //   if(result) {
    //     DefaultScreenUtils.onMessage(context: context, message: "Código reenviado com sucesso!", isError: false);
    //   } else {
    //     DefaultScreenUtils.onMessage(context: context, message: "Houve um erro ao reenviar código!", isError: true);
    //     return;
    //   }
    // }

    // if(currentPage == 4 && !_isVerified) return;
    if(currentPage == 2) {
      try{
        await _register();
      }catch(e){
        DefaultScreenUtils.onMessage(context: context, message: "Erro ao cadastrar!", isError: true);
      }

    }

    _controller.nextPage();
  }

  _back() {
    if(currentPage == 0) {
      Navigator.of(context).pop();
    } else {
      _controller.previousPage();
    }
  }

  // Future<bool> _sendCode(String phone) async {
  //   return true;
  // }
  //
  // Future<bool> _validateCode(String phone) async {
  //   await Navigator.push(context, MaterialPageRoute(builder: (context) => VerifiedView(onClick: () {
  //     Navigator.of(context).pop();
  //   })));
  //
  //   return true;
  // }


  _register() async {

      print("REGISTRO ${_registerModel.toJson()}");
      await _dbHelper.saveCustomer(_registerModel);
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ViewPassword()));
      // await _registerController.register(_registerModel);

  }

}