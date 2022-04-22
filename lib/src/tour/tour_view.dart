import 'package:cofredesenha/src/password/viewPassword.dart';
import 'package:cofredesenha/src/register/register.steps.view.dart';
import 'package:cofredesenha/src/tour/page.tour.dart';
import 'package:cofredesenha/src/tour/tour.controller.dart';
import 'package:cofredesenha/utils/button.dart';
import 'package:cofredesenha/utils/images.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:cofredesenha/utils/textStyle.dart';
import 'package:flutter/material.dart';

class Tour extends StatefulWidget {
  const Tour({Key? key}) : super(key: key);

  @override
  _TourState createState() => _TourState();
}

class _TourState extends State<Tour> {
  final controller = TourController();


  @override
  void initState() {
    super.initState();
    controller.pageController = PageController(
        initialPage: 0
    );
    controller.pageController.addListener(() {
      controller.currentPage_ = controller.pageController.page!.round();

      if (controller.currentPage != controller.currentPage_) {
        controller.currentPage_ = controller.currentPage;
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.lightColor1,
      appBar:AppBar(
          backgroundColor: DefaultColors.lightColor1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: DefaultColors.secondaryColor,
              size: 20,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        actions: [TextButton(onPressed: finish, child: Text("Pular",style: DefaultStyle.textStyle(
          size: 14,
          fontWeight: FontWeight.w700,
            color:DefaultColors.secondaryColor
        ),))],
      ),
      body: SafeArea(
        child: _body(),
      ),
    );
  }
  finish(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterStepsView(document: '',)));
  }

  _body() {
    return Column(
      children: [
        Expanded(
          child: _pages(),
        ),
        _button(),
      ],
    );
  }

  List<Widget> steps = [];

  _pages() {
    return Center(
      // key: controller.formKey,
      child: PageView(
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (page){
            setState(() {
              controller.currentPage = page;
            });
          },
          children: const [
            PageRegister(
              image: DefaultAssets.tour1,
              text: "Com o app da TÁ PAGO o pagamento é ainda mais simples, prático e seguro!",
            ),
            PageRegister(
              image: DefaultAssets.tour2,
              text: "Será exibido em formato de carrosel todos o seus benefícios, basta escolher um ;)",
            ),
            PageRegister(
              image: DefaultAssets.tour3,
              text: "Você também pode clicar no botão pagar no menu inferior e depois escolher o benefício na próxima tela.",
            ),
            PageRegister(
              image: DefaultAssets.tour4,
              text: "Para fazer pagamento digite o valor da compra e clique em gerar senha :)",
            ),
            PageRegister(
              image: DefaultAssets.tour5,
              text: "Agora informe a senha ou exiba o QR Code para finalizar o pagamento!",
            ),

          ]
      ),
    );

  }
  List<Widget> pagesHere = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  Widget _buildBullets() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(pagesHere, (index, img) {
            return InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                width:  10,
                height: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentPage_ >= index ?  DefaultColors.secondaryColor : Colors.white),
              ),
            );
          }
          )
      ),
    );
  }

  List<T> map<T>(list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  _button(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBullets(),
        SizedBox(height: 10,),
        Padding(padding: EdgeInsets.all(10),child:DefaultButton(context: context, title: "Próximo",callback:() => controller.onStepNext(context)))
      ],
    );

  }
}
