import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/writer_model.dart';

class WriterDatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'writers_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE writers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        phone TEXT NOT NULL,
        specialization TEXT NOT NULL,
        hireDate TEXT NOT NULL,
        status TEXT NOT NULL
      )
    ''');
  }

  Future<List<WriterModel>> getAllWriters() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('writers');
    return List.generate(maps.length, (i) => WriterModel.fromMap(maps[i]));
  }

  Future<WriterModel?> getWriterById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'writers',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return WriterModel.fromMap(maps.first);
    }
    return null;
  }

  Future<int> insertWriter(WriterModel writer) async {
    final db = await database;
    return await db.insert('writers', writer.toMap());
  }

  Future<int> updateWriter(WriterModel writer) async {
    final db = await database;
    return await db.update(
      'writers',
      writer.toMap(),
      where: 'id = ?',
      whereArgs: [writer.id],
    );
  }

  Future<int> deleteWriter(int id) async {
    final db = await database;
    return await db.delete(
      'writers',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
