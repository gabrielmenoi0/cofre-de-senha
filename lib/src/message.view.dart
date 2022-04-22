import 'package:cofredesenha/data/database.dart';
import 'package:cofredesenha/src/password/viewPassword.dart';
import 'package:cofredesenha/src/tour/tour_view.dart';
import 'package:cofredesenha/utils/button.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:cofredesenha/utils/textStyle.dart';
import 'package:flutter/material.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  _MessageView createState() => _MessageView();
}

class _MessageView extends State<MessageView> {

  final _formKey = GlobalKey<FormState>();
  final DatabaseProvider _dbHelper = DatabaseProvider.db;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _content()
    );
  }

  _content() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(
                //   height: 200,
                //   child: Image.asset(
                //     DefaultAssets.logo,
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Bom te ver por aqui!\nNosso app veio para simplificar\nsua forma de pagamento!",
                  textAlign: TextAlign.left,
                  style: DefaultStyle.textStyle(
                      size: 24,
                      fontWeight: FontWeight.w700,
                      color: DefaultColors.textColor
                  ),
                ),
                const SizedBox(
                  height: 10 * 2,
                ),
                DefaultButton(
                  context: context,
                  title:  data.isEmpty || data == "" ? "Começar" : "Entrar",
                  callback: () => _open(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  _open() async {

    data.isEmpty || data == "" ?
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Tour())) : Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewPassword()));
  }

}


