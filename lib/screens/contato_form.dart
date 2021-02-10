
import 'package:flutter/material.dart';
import 'package:flutter_persistence_al/database/dao/contato_dao.dart';
import 'package:flutter_persistence_al/models/Contato.dart';

class ContatoForm extends StatefulWidget {

  @override
  _ContatoFormState createState() => _ContatoFormState();
}

class _ContatoFormState extends State<ContatoForm> {

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroContaController = TextEditingController();
  final ContatoDao contatoDao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo contato"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                    labelText: "Nome completo",
                    labelStyle: TextStyle(fontSize: 24.0)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: TextField(
                controller: _numeroContaController,
                decoration: InputDecoration(
                  labelText: "Numero da conta",
                  labelStyle: TextStyle(fontSize: 24.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 50,
                child: RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    final String nomeCompleto = _nomeController.text;
                    final int numeroConta = int.tryParse(_numeroContaController.text);

                    final Contato contato = new Contato(0, nomeCompleto, numeroConta);
                    contatoDao.save(contato).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
