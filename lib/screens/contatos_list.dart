import 'package:flutter/material.dart';
import 'package:flutter_persistence_al/database/dao/contato_dao.dart';
import 'package:flutter_persistence_al/models/Contato.dart';
import 'package:flutter_persistence_al/screens/contato_form.dart';

class ContatosList extends StatelessWidget {

  final ContatoDao contatoDao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Contatos"),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future: contatoDao.findAll(),
        builder: (context, snapshot) {

          switch(snapshot.connectionState){

            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return ProgressBarCarregando();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              List<Contato> contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CardContatoItem(contatos[index]);
                },
                itemCount: contatos.length,
              );
              break;
          }
          return Text("Ocorreu um problema nesscarniça");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContatoForm(),
                ),
              );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CardContatoItem extends StatelessWidget {
  final Contato contato;

  CardContatoItem(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(contato.numeroConta.toString()),
      ),
    );
  }
}


class ProgressBarCarregando extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text("Carregando contatos")
        ],
      ),
    );
  }
}
