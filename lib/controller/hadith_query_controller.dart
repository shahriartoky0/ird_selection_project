import 'package:get/get.dart';
import 'package:ird_selection_project/data/model/hadith.dart';
import 'package:sqflite/sqflite.dart';
import '../data/database_helper/dbhelper.dart';

class HadithQueryController extends GetxController {
  late Future<Database> database;
  List<Map<String, dynamic>> results = [];
  late List<Hadith> hadithList = [];

  Future<void> hadithQuery(
      {required int bookId, required int chapterId}) async {
    database = DbHelperController().initializeDatabase();
    final db = await database;
    results = await db.query(
      'hadith',
      where: 'book_id = ? AND chapter_id = ?',
      whereArgs: [bookId, chapterId],
    );

    print(results);
    for (Map<String, dynamic> row in results) {
      Hadith hadith = Hadith(
          chapterId: row['chapter_id'],
          bookId: row['book_id'],
          bookName: row['book_name'],
          sectionId: row['section_id'],
          narrator: row['narrator'],
          bn: row['bn'],
          ar: row['ar'],
          arDiacless: row['ar_diacless'],
          note: row['note'],
          gradeId: row['grade_id'],
          grade: row['grade'],
          gradeColor: row['grade_color'],
          hadithId: row['hadith_id']);
      hadithList.add(hadith);
    }
    update();
  }
}
