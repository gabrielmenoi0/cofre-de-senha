import 'package:cofredesenha/models/SaveAccaunt.dart';
import 'package:cofredesenha/src/home.dart';
import 'package:cofredesenha/src/home/viewPassword.dart';
import 'package:cofredesenha/src/password/edit/editSocial.dart';
import 'package:cofredesenha/utils/screenUtils.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:cofredesenha/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class PasswordSocial extends StatefulWidget {
  String? nome;
  String? password;
  String? type;
  String? ob;
  int? id;
  PasswordSocial({Key? key,this.nome,this.password,this.type,this.ob,this.id}) : super(key: key);

  @override
  _PasswordSocial createState() => _PasswordSocial();
}

class _PasswordSocial extends State<PasswordSocial> {

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
              MaterialPageRoute(builder: (context) => EditSocial(password: widget.password,id: widget.id,type: widget.type,nome: widget.nome,ob: widget.ob,)));},
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
        title: Text("Social",
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
              children: [
                Icon(
                  Icons.local_hotel_sharp,
                  color: DefaultColors.secondaryColor,
                ),
                SizedBox(width: 10,),
                Text("${widget.nome!}", style: DefaultStyle.textStyle(
                    color: DefaultColors.secondaryColor,
                    fontWeight: FontWeight.w700,
                    size: 18
                ),),
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
        // SizedBox(height: 25,),
        // Card(
        //   elevation: 10,
        //   child: Padding(padding: EdgeInsets.all(15),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Row(children: [
        //           Icon(
        //             Icons.emoji_objects_sharp,
        //             color: DefaultColors.secondaryColor,
        //           ),
        //           SizedBox(width: 10,),
        //           Text("Observação: ${widget.ob!}", style: DefaultStyle.textStyle(
        //               color: DefaultColors.secondaryColor,
        //               fontWeight: FontWeight.w700,
        //               size: 18
        //           ),),
        //         ],)
        //
        //       ],
        //     )
        //     ,),
        // ),
      ],
    );
  }

  _copy(){
    FlutterClipboard.copy(widget.password!).then(( value ) =>
        print('copied'));
    DefaultScreenUtils.onMessage(context: context, message: "Senha copiada para sua Área de transferência!", isError: false);
  }
}