import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    // Verifica se o banco já existe
    final dbExists = await databaseExists(path);
    if (!dbExists) {
      print('Banco de dados não encontrado. Criando um novo...');
    } else {
      print('Banco de dados já existe.');
    }

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Criação das tabelas
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        matricula TEXT NOT NULL UNIQUE
      )
    ''');
    

    await db.execute('''
      CREATE TABLE order_services (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        checklistOption TEXT NOT NULL,
        photoPath TEXT NOT NULL
      )
    ''');

       
  }

  /// Método para verificar se o banco de dados existe
  Future<bool> doesDatabaseExist() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');
    return await databaseExists(path);
  }
}
