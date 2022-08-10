import 'package:resi_cek_app/Model/search_history.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const _databaseName = "resiDb.db";
  static const _table = "search_history";

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    String sql =
        "CREATE TABLE search_history(id INT AUTO_INCREMENT PRIMARY KEY, resi_id TEXT, courier TEXT, created_date TEXT, updated_date TEXT)";

    return openDatabase(join(path, _databaseName),
        onCreate: (database, name) async {
      await database.execute(sql);
    }, version: 1);
  }

  Future<int> insertHistory(SearchHistoryModel searchHistory) async {
    final Database db = await initializeDB();
    var result = await db.insert(_table, searchHistory.toMap());

    return result;
  }

  Future<List<SearchHistoryModel>> getSearchHistory() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query(_table);

    return List.generate(
      maps.length,
      (index) => SearchHistoryModel(
        resi_id: maps[index]['resi_id'].toString(),
        courier: maps[index]['courier'],
        created_date: maps[index]['created_date'],
        updated_date: maps[index]['updated_date'],
      ),
    );
  }
}
