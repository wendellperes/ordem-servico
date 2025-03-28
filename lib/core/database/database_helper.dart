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
      CREATE TABLE products (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      description TEXT,
      price REAL NOT NULL,
      supplier_id INTEGER NOT NULL,
      FOREIGN KEY (supplier_id) REFERENCES suppliers (id) ON DELETE CASCADE
      )
        ''');

        // Inserindo dados iniciais na tabela de produtos
        await db.insert('products', {
      'name': 'Produto A',
      'description': 'Descrição do Produto A',
      'price': 10.99,
      'supplier_id': 1,
        });

        await db.insert('products', {
      'name': 'Produto B',
      'description': 'Descrição do Produto B',
      'price': 20.50,
      'supplier_id': 1,
        });

        await db.insert('products', {
      'name': 'Produto C',
      'description': 'Descrição do Produto C',
      'price': 15.75,
      'supplier_id': 2,
        });

        await db.insert('products', {
      'name': 'Produto D',
      'description': 'Descrição do Produto D',
      'price': 12.30,
      'supplier_id': 2,
        });

        await db.insert('products', {
      'name': 'Produto E',
      'description': 'Descrição do Produto E',
      'price': 18.40,
      'supplier_id': 3,
        });

        await db.insert('products', {
      'name': 'Produto F',
      'description': 'Descrição do Produto F',
      'price': 25.00,
      'supplier_id': 3,
        });

        await db.insert('products', {
      'name': 'Produto G',
      'description': 'Descrição do Produto G',
      'price': 30.99,
      'supplier_id': 4,
        });

        await db.insert('products', {
      'name': 'Produto H',
      'description': 'Descrição do Produto H',
      'price': 22.75,
      'supplier_id': 4,
        });

        await db.insert('products', {
      'name': 'Produto I',
      'description': 'Descrição do Produto I',
      'price': 19.99,
      'supplier_id': 5,
        });

        await db.insert('products', {
      'name': 'Produto J',
      'description': 'Descrição do Produto J',
      'price': 35.50,
      'supplier_id': 5,
        });
  }

  /// Método para verificar se o banco de dados existe
  Future<bool> doesDatabaseExist() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');
    return await databaseExists(path);
  }
}
