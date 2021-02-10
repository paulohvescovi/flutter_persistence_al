import 'package:flutter_persistence_al/database/dao/contato_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  String path = join(await getDatabasesPath(), 'banco.db');

  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContatoDao.tableSQL);
  }, version: 1);

}