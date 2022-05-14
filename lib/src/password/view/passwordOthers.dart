import 'package:cofredesenha/models/SaveAccaunt.dart';
import 'package:cofredesenha/src/home.dart';
import 'package:cofredesenha/src/home/viewPassword.dart';
import 'package:cofredesenha/src/password/edit/editOthers.dart';
import 'package:cofredesenha/utils/screenUtils.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:cofredesenha/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class Password extends StatefulWidget {
  String? local;
  String? pass;
  String? ob;
  int? id;
  Password({Key? key,this.local,this.pass,this.ob, this.id}) : super(key: key);

  @override
  _Password createState() => _Password();
}

class _Password extends State<Password> {

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
              MaterialPageRoute(builder: (context) => EditPassword(local: widget.local,pass: widget.pass,
              ob: widget.ob,
              id: widget.id,
              )));},
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
                    Text("Local: ${widget.local!}", style: DefaultStyle.textStyle(
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
              Row(
                  children:[
                    Icon(
                      Icons.password,
                      color: DefaultColors.secondaryColor,
                    ),
                    SizedBox(width: 10,),
                    Text("Senha: ${widget.pass!}", style: DefaultStyle.textStyle(
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
              Text("Observação: ${widget.ob!}", style: DefaultStyle.textStyle(
                  color: DefaultColors.secondaryColor,
                  fontWeight: FontWeight.w700,
                  size: 18
              ),),
            ],)

          ],
          )
            ,),
        ),
      ],
    );
  }

  _copy(){
    FlutterClipboard.copy(widget.pass!).then(( value ) =>
        print('copied'));
    DefaultScreenUtils.onMessage(context: context, message: "Senha copiada para sua Área de transferência!", isError: false);
  }
}
