import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  // Construtor com acesso privado
  DB._();

  // Criar instancia do DB
  static final DB instance = DB._();

  // Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'app_modular.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_perfil);
  }

  String get _perfil => '''
      CREATE TABLE usu_usuario (
        usu_codigo INTEGER PRIMARY KEY AUTOINCREMENT,
        usu_nome TEXT,
        usu_email TEXT
      );
  ''';
}
