import 'package:flutter_persistence_al/models/Contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase(){
  return getDatabasesPath().then((dbPath) {

    final String path = join(dbPath, 'banco.db');

    return openDatabase(path, onCreate: (db, version) {
        db.execute(
          "CREATE TABLE contatos (id INTEGER PRIMARY KEY, nome TEXT, numero_conta INTEGER)",
        );
    }, version: 1);

  });
}

/**
 * retorna o id inserido
 */
Future<int> save (Contato contato){
    return createDatabase().then((db) {

      Map<String, dynamic> map = Map();
      map['id'] = contato.id;
      map['nome'] = contato.nome;
      map['numero_conta'] = contato.numeroConta;

      return db.insert("contatos", map);
    });
}

Future<List<Contato>> findAll(){
  return createDatabase().then((db) {
      return db.query('contatos').then((maps) {
        List<Contato> contatos = List();

        maps.forEach((map) {
          contatos.add(
                new Contato(
                    map['id'],
                    map['nome'],
                    map['numero_conta']
                )
          );
        });
        return contatos;
    });
  });
}