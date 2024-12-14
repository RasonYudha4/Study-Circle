import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ImageService {
  static final ImageService _instance = ImageService._internal();
  factory ImageService() => _instance;

  static Database? _database;

  ImageService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'images.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE images(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image BLOB,
            userId TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertImage(Uint8List image, String userId) async {
    final db = await database;
    await db.insert('images', {'image': image, 'userId': userId});
  }

  Future<List<Uint8List>> getImages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('images');
    return List.generate(maps.length, (i) {
      return maps[i]['image'] as Uint8List;
    });
  }

  Future<Uint8List?> getImageByUserId(String userId) async {
    final db = await database;
    final result = await db.query('images',
        where: 'userId = ?', whereArgs: [userId], limit: 1);
    if (result.isEmpty) {
      return null;
    }
    return result.first['image'] as Uint8List;
  }

  Future<void> updateImageByUserId(String userId, Uint8List image) async {
    final db = await database;
    await db.update('images', {'image': image},
        where: 'userId = ?', whereArgs: [userId]);
  }
}
