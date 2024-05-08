import 'package:get/get.dart';
import 'package:ird_selection_project/data/database_helper/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import '../data/model/books.dart';

class BooksQueryController extends GetxController {
  late Future<Database> database;
  List<Map<String, dynamic>> results = [];
  late List<Books> bookList = [];

  Future<void> booksQuery() async {
    database = DbHelperController().initializeDatabase();
    final db = await database;
    results = await db.query('books');
    print(results);
    for (Map<String, dynamic> row in results) {
      Books book = Books(
        id: row['id'] as int,
        title: row['title'] as String,
        titleAr: row['title_ar'] as String,
        numberOfHadith: row['number_of_hadis'] as int,
        abvrCode: row['abvr_code'] as String,
        bookName: row['book_name'] as String,
        bookDescription: row['book_descr'] as String,
      );

      bookList.add(book);
    }
    update();
  }
}
