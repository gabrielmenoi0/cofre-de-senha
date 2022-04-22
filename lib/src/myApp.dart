import 'package:cofredesenha/data/database.dart';
import 'package:cofredesenha/models/cliente.dart';
import 'package:cofredesenha/models/userModel.dart';
import 'package:cofredesenha/src/message.view.dart';
import 'package:cofredesenha/src/password/viewPassword.dart';
import 'package:cofredesenha/src/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: DefaultTheme.themeData,
        home: SafeArea(
          child: FutureBuilder<Cliente?>(
            future: _getCustomer(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Splash();
              }
              if(snapshot.hasData) {
                return const ViewPassword();
              }
              else {
                  return const MessageView();
                }
            },
          ),
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
