import 'package:cofredesenha/data/database.dart';
import 'package:cofredesenha/models/cliente.dart';
import 'package:cofredesenha/models/BankModel.dart';
import 'package:cofredesenha/src/login.dart';
import 'package:cofredesenha/src/message.view.dart';
import 'package:cofredesenha/src/home/viewPassword.dart';
import 'package:cofredesenha/src/splash.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
final DatabaseProvider _dbHelper = DatabaseProvider.db;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: DefaultColors.secondaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light
    ));

    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting('pt_BR');
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        // theme: DefaultTheme.themeData,
        home: FutureBuilder<Cliente?>(
          future: _getCustomer(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Splash();
            }
            if(snapshot.hasData) {
              return const MessageView();
            }
            else {
                return const MessageView();
              }
          },
        )
    );
  }

  Future<Cliente> _getCustomer() async {
    Cliente result = await _dbHelper.getCustomer();
    // try{
    //   await OneSignalController().configureOneSignal();
    //   await Future.delayed(const Duration(seconds: 2));
    // }
    // catch(e){
    //
    // }
    // await Future.delayed(const Duration(seconds: 5));

    return result;
  }
}
