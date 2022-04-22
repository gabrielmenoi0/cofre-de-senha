import 'package:cofredesenha/data/database.dart';
import 'package:cofredesenha/models/SaveAccaunt.dart';
import 'package:cofredesenha/src/password/addPassword.dart';
import 'package:cofredesenha/utils/button.dart';
import 'package:cofredesenha/utils/images.dart';
import 'package:cofredesenha/utils/screenUtils.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:cofredesenha/utils/textStyle.dart';
import 'package:flutter/material.dart';


class ViewPassword extends StatefulWidget {
  const ViewPassword({Key? key}) : super(key: key);

  @override
  _ViewPassword createState() => _ViewPassword();
}

class _ViewPassword extends State<ViewPassword> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final DatabaseProvider _dbHelper = DatabaseProvider.db;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _button(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          go();
          },
        child: Icon(Icons.add),
        // label: const Text('Adicionar'),
        // icon: const Icon(Icons.add),
        backgroundColor: DefaultColors.secondaryColor,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //     size: 20,
        //   ),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title: Text("Cofre de Senhas",
            style: DefaultStyle.textStyle(
                size: 24,
                fontWeight: FontWeight.w700,
                color: DefaultColors.darkColor2)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<SaveAccountModel>?>(
                future: _dbHelper.getAccount(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return DefaultScreenUtils.onLoading();
                  }
                  if (snapshot.hasError) {
                    return const Text("Houve um erro ao encontrar dados!");
                  }

                  // _items.sort((a,b) => a.createdAt.isAfter(b.createdAt)? -1: 1);

                  if (snapshot.data!.isEmpty) {
                    return emptyRefund();
                  }

                  return _list(content: snapshot.data!);
                },
              ),
              SizedBox(height: 100)
            ],
          )
        ),
      ),
    );
  }

  _list({required List<SaveAccountModel> content}) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 10 / 2),
      itemCount: content.length,
      itemBuilder: (BuildContext context, int index) {
        SaveAccountModel item = content[index];

        return _card(item);
      },
    );
  }

  _button() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: DefaultButton(
        context: context,
        title: "+ Adicionar conta",
        callback: go,
      ),
    );
  }

  go() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddPassword()));
    setState(() {

    });
  }

  static Widget closeBottom(BuildContext context,
      {Color? iconColor = Colors.grey}) =>
      Container(
        alignment: Alignment.centerRight,
        child: IconButton(
            icon: Icon(
              Icons.clear,
              color: iconColor,
            ),
            onPressed: () => Navigator.pop(context)),
      );

  static BoxDecoration decorationBottom() =>
      const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14), topRight: Radius.circular(14)));

  bottomExlude(BuildContext context,SaveAccountModel item) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            return Wrap(
              children: [
                closeBottom(context),
                Container(
                  decoration: decorationBottom(),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Atenção!",
                              style: DefaultStyle.textStyle(
                                  size: 24,
                                  fontWeight: FontWeight.w700,
                                  color: DefaultColors.secondaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Tem certeza que deseja excluir essa conta?",
                          style: DefaultStyle.textStyle(
                              size: 20,
                              fontWeight: FontWeight.w400,
                              color: DefaultColors.darkColor1),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                child: DefaultButton(
                                  context: context,
                                  title: "Sim",
                                ),
                                onTap: () => exlude(item),
                              ),

                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: DefaultButton(
                                fillColor: DefaultColors.secondaryColor,
                                context: context,
                                title: "Não",
                                callback: () => Navigator.pop(context),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  _card(SaveAccountModel item) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 10,
        child: Padding(padding: EdgeInsets.all(20), child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Local: ${item.local!}", style: DefaultStyle.textStyle(
                color: DefaultColors.secondaryColor,
                fontWeight: FontWeight.w700,
                size: 18
            ),),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("Senha: ${item.password?.substring(0, 1).toString()}",
                  style: DefaultStyle.textStyle(
                      fontWeight: FontWeight.w400,
                      color: DefaultColors.darkColor2,
                      size: 14
                  ),),
                Text(".***-**"),


              ],
            ),
            GestureDetector(
              onTap: ()=> callbottom(item),
              child: Icon(
                Icons.delete,
                size: 30,
              )
            ),Visibility(
              visible: true,
              child: Text("Observação: ${item.observation!}", style: DefaultStyle.textStyle(
                color: DefaultColors.secondaryColor,
                fontWeight: FontWeight.w700,
                size: 18
            ),),),

          ],
        ),),
      ),
    )
    ;
  }
  callbottom(SaveAccountModel item){
    return bottomExlude(context, item);
  }
  // selectbill(SaveAccountModel item){
  //   Navigator.of(context).pop(item);
  //   print(item);
  // }
  exlude(SaveAccountModel item) async {

    var auth = await _dbHelper.deleteAccount(item);
    Navigator.pop(context);
    setState(() {

    });
  }

  emptyRefund() {
    return Center(
      child: SizedBox(
        height: 450,
        child: Column(
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
                  "Nenhuma Senha cadastrada.",
                  style: DefaultStyle.textStyle(
                      fontWeight: FontWeight.w700,
                      color: DefaultColors.darkColor2,
                      size: 24),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
