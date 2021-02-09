import 'package:flutter/material.dart';
import 'package:flutter_persistence_al/screens/contato_form.dart';

class ContatosList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Contatos"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                "Nome",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text("Sobrenome"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContatoForm(),
            ),
          ).then((novoContato) => {

          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
