import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String _databaseName = "ItemsDatabase.db";
  static const int _databaseVersion = 1;

  final String itemsTable = 'items_table';
  final String stockRecordsTable = 'stock_records_table';

  final String columnName = 'item_name';
  final String columnId = 'item_id';
  final String columnBarcode = 'item_barcode';
  final String columnPrice = 'item_price';
  final String columnQuantity = 'item_quantity';

  String columnRecordDocNumber = 'record_doc_number';
  String columnRecordTime = 'record_time';

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onOpen: (db) => print("Database open"),
    );
  }

  // SQL code to create the database tables
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $itemsTable (
            $columnId TEXT PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnBarcode TEXT NOT NULL UNIQUE,
            $columnPrice REAL NOT NULL,
            $columnQuantity INTEGER NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE $stockRecordsTable (
            $columnRecordDocNumber INTEGER NOT NULL,
            $columnRecordTime TEXT NOT NULL,
            $columnId TEXT NOT NULL,
            $columnQuantity INTEGER NOT NULL,
            PRIMARY KEY ($columnRecordDocNumber, $columnRecordTime, $columnId),
            FOREIGN KEY ($columnId) REFERENCES $itemsTable($columnId)
          )
          ''');
  }

  insertData(String sql) async {
    Database myDatabase = _database!;
    return await myDatabase.rawInsert(sql);
  }

  upadteData(String sql) async {
    Database myDatabase = _database!;
    return await myDatabase.rawUpdate(sql);
  }

  deletetData(String sql) async {
    Database myDatabase = _database!;
    return await myDatabase.rawDelete(sql);
  }

  readtData(String sql) async {
    Database myDatabase = _database!;
    return await myDatabase.rawQuery(sql);
  }
}
