
import 'package:flutter_persistence_al/database/app_database.dart';
import 'package:flutter_persistence_al/models/Contato.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDao {

  static const tableSQL = "CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, $nome TEXT, $numero_conta INTEGER)";
  static const tableName = "contatos";

  static const id = "id";
  static const nome = "nome";
  static const numero_conta = "numero_conta";

  Future<int> save (Contato contato) async {
    Database db = await getDatabase();

    Map<String, dynamic> map = toMap(contato);

    return db.insert(tableName, map);
  }

  Map<String, dynamic> toMap(Contato contato) {
    Map<String, dynamic> map = Map();
    map[nome] = contato.nome;
    map[numero_conta] = contato.numeroConta;
    return map;
  }

  Future<List<Contato>> findAll() async {
    List<Contato> contatos = List();
    Database db = await getDatabase();

    var mapList = await db.query(tableName);
    mapList.forEach((row) {
      toContato(contatos, row);
    });
    return contatos;
  }

  void toContato(List<Contato> contatos, Map<String, dynamic> row) {
    contatos.add(
        new Contato(
            row[id],
            row[nome],
            row[numero_conta]
        )
    );
  }

}