import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'phonebook_model.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Mendapatkan path untuk database
    String path = join(await getDatabasesPath(), 'phonebook.db');
    print("Database Path: $path");  // Debugging log untuk memeriksa path database

    // Membuka database atau membuatnya jika belum ada
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, phone TEXT)',
        );
      },
    );
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'phonebook.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE contacts(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          phone TEXT
        )
      ''');
    });
  }

  Future<void> insertContact(Contact contact) async {
    final db = await database;
    await db.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,  // Ganti jika kontak sudah ada
    );
    print("Contact inserted: ${contact.name}, ${contact.phone}");
  }


  Future<List<Contact>> getContacts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    print("Contacts fetched from DB: $maps");  // Debugging log
    return List.generate(maps.length, (i) {
      return Contact(
        id: maps[i]['id'],
        name: maps[i]['name'],
        phone: maps[i]['phone'],
      );
    });
  }


  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
