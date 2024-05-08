import 'package:get/get.dart';
import 'package:ird_selection_project/data/model/chapter.dart';
import 'package:sqflite/sqflite.dart';
import '../data/database_helper/dbhelper.dart';

class ChapterQueryController extends GetxController {
  late Future<Database> database;
  List<Map<String, dynamic>> results = [];
  late List<Chapter> chapterList = [];

  Future<void> chapterQuery({required int bookId}) async {
    database = DbHelperController().initializeDatabase();
    final db = await database;
    results = await db.query(
      'chapter',
      where: 'book_id = ?',
      whereArgs: [bookId], // Replace with actual book ID if needed
    );
    print(results);
    for (Map<String, dynamic> row in results) {
      Chapter chapter = Chapter(
          id: row['id'],
          chapterId: row['chapter_id'],
          bookId: row['book_id'],
          title: row['title'],
          number: row['number'],
          hadithRange: row['hadis_range'],
          bookName: row['book_name']);
      chapterList.add(chapter);
    }
    update();
  }
}
