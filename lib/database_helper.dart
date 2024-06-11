
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'dictionary.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE words(id INTEGER PRIMARY KEY, english TEXT, turkish TEXT)",
        ).then((_) {
          // Insert predefined words
          db.insert('words', {'english': 'hello', 'turkish': 'merhaba'});
          db.insert('words', {'english': 'goodbye', 'turkish': 'güle güle'});
          db.insert('words', {'english': 'please', 'turkish': 'lütfen'});
          db.insert('words', {'english': 'thank you', 'turkish': 'teşekkür ederim'});
          db.insert('words', {'english': 'yes', 'turkish': 'evet'});
          db.insert('words', {'english': 'no', 'turkish': 'hayır'});
          db.insert('words', {'english': 'cat', 'turkish': 'kedi'});
          db.insert('words', {'english': 'dog', 'turkish': 'köpek'});
          db.insert('words', {'english': 'water', 'turkish': 'su'});
          db.insert('words', {'english': 'food', 'turkish': 'yemek'});
          db.insert('words', {'english': 'house', 'turkish': 'ev'});
          db.insert('words', {'english': 'car', 'turkish': 'araba'});
          db.insert('words', {'english': 'school', 'turkish': 'okul'});
          db.insert('words', {'english': 'book', 'turkish': 'kitap'});
          db.insert('words', {'english': 'computer', 'turkish': 'bilgisayar'});
          db.insert('words', {'english': 'phone', 'turkish': 'telefon'});
          db.insert('words', {'english': 'friend', 'turkish': 'arkadaş'});
          db.insert('words', {'english': 'love', 'turkish': 'aşk'});
          db.insert('words', {'english': 'money', 'turkish': 'para'});
          db.insert('words', {'english': 'work', 'turkish': 'iş'});
          db.insert('words', {'english': 'music', 'turkish': 'müzik'});
          db.insert('words', {'english': 'movie', 'turkish': 'film'});
          db.insert('words', {'english': 'happiness', 'turkish': 'mutluluk'});
          db.insert('words', {'english': 'sadness', 'turkish': 'üzüntü'});
          db.insert('words', {'english': 'beauty', 'turkish': 'güzellik'});
          db.insert('words', {'english': 'strength', 'turkish': 'güç'});
          db.insert('words', {'english': 'weakness', 'turkish': 'zayıflık'});
          db.insert('words', {'english': 'truth', 'turkish': 'gerçek'});
          db.insert('words', {'english': 'lie', 'turkish': 'yalan'});
          db.insert('words', {'english': 'health', 'turkish': 'sağlık'});
        });
      },
      version: 1,
    );
  }

  static Future<Map<String, dynamic>?> getWord(String english) async {
    final db = await database();
    final List<Map<String, dynamic>> results = await db.query(
      'words',
      where: "english = ?",
      whereArgs: [english],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  static Future<List<Map<String, dynamic>>> getWords() async {
    final db = await database();
    return db.query('words');
  }
}