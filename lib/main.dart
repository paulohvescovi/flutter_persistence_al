import 'package:flutter/material.dart';
import 'package:flutter_persistence_al/database/app_database.dart';
import 'package:flutter_persistence_al/screens/contato_form.dart';
import 'package:flutter_persistence_al/screens/contatos_list.dart';
import 'package:flutter_persistence_al/screens/dashboard.dart';

import 'models/Contato.dart';

void main() {
  runApp(MyApp());
  // save(new Contato(1,"Paulo", 123)).then((contatoSalvo) {
  //   debugPrint(contatoSalvo.toString());
  // });
  findAll().then((contatoList) {
    debugPrint(contatoList.first.toString());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: DashBoard()
    );
  }
}


