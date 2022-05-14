import 'package:cofredesenha/models/SaveAccaunt.dart';
import 'package:cofredesenha/src/home.dart';
import 'package:cofredesenha/src/home/viewPassword.dart';
import 'package:cofredesenha/src/password/edit/editBank.dart';
import 'package:cofredesenha/utils/screenUtils.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:cofredesenha/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class PasswordBank extends StatefulWidget {
  String? bank;
  String? agency;
  String? accaunt;
  String? password;
  int? id;
  PasswordBank({Key? key,this.bank, this.agency, this.accaunt, this.password, this.id}) : super(key: key);

  @override
  _PasswordBank createState() => _PasswordBank();
}

class _PasswordBank extends State<PasswordBank> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: DefaultColors.secondaryColor,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => EditBank(bank:widget.bank ,password: widget.password,agency: widget.agency, accaunt: widget.accaunt,id: widget.id,)));},
        child: Icon(Icons.edit,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home())),
        ),
        title: Text("Senhas",
            style: DefaultStyle.textStyle(
                size: 24,
                fontWeight: FontWeight.w700,
                color: DefaultColors.darkColor2)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: [
                formBill(),
              ],
            )
        ),
      ),
    );
  }
  formBill() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 10,
          child: Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.local_hotel_sharp,
                      color: DefaultColors.secondaryColor,
                    ),
                    SizedBox(width: 10,),
                    Text("Banco: ${widget.bank!}", style: DefaultStyle.textStyle(
                        color: DefaultColors.secondaryColor,
                        fontWeight: FontWeight.w700,
                        size: 18
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25,),
        Card(
          elevation: 10,
          child: Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(
                    Icons.emoji_objects_sharp,
                    color: DefaultColors.secondaryColor,
                  ),
                  SizedBox(width: 10,),
                  Text("Agência: ${widget.agency!}", style: DefaultStyle.textStyle(
                      color: DefaultColors.secondaryColor,
                      fontWeight: FontWeight.w700,
                      size: 18
                  ),),
                ],)

              ],
            )
            ,),
        ),
        SizedBox(height: 25,),
        Card(
          elevation: 10,
          child: Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(
                    Icons.emoji_objects_sharp,
                    color: DefaultColors.secondaryColor,
                  ),
                  SizedBox(width: 10,),
                  Text("Conta: ${widget.accaunt!}", style: DefaultStyle.textStyle(
                      color: DefaultColors.secondaryColor,
                      fontWeight: FontWeight.w700,
                      size: 18
                  ),),
                ],),

              ],
            )
            ,),
        ),
        SizedBox(height: 25,),
        Card(
          elevation: 10,
          child: Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    children:[
                      Icon(
                        Icons.password,
                        color: DefaultColors.secondaryColor,
                      ),
                      SizedBox(width: 10,),
                      Text("Senha: ${widget.password!}", style: DefaultStyle.textStyle(
                          color: DefaultColors.secondaryColor,
                          fontWeight: FontWeight.w700,
                          size: 18
                      ),),
                    ]),
                IconButton(onPressed: (){_copy();}, icon: Icon(Icons.copy)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _copy(){
    FlutterClipboard.copy(widget.password!).then(( value ) =>
        print('copied'));
    DefaultScreenUtils.onMessage(context: context, message: "Senha copiada para sua Área de transferência!", isError: false);
  }
}