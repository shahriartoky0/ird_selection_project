import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_selection_project/controller/chapter_query_controller.dart';
import 'package:ird_selection_project/ui/screens/hadith_page_screen.dart';
import 'package:ird_selection_project/ui/style/colors.dart';
import 'package:ird_selection_project/ui/widget/leading_tile_icon.dart';

import '../../data/model/books.dart';
import '../../data/model/chapter.dart';
import '../../utilities/utilities.dart';
import '../widget/my_app_bar.dart';

class ChapterPageScreen extends StatefulWidget {
  final Books book;

  const ChapterPageScreen({super.key, required this.book});

  @override
  State<ChapterPageScreen> createState() => _ChapterPageScreenState();
}

class _ChapterPageScreenState extends State<ChapterPageScreen> {
  @override
  void initState() {
    Get.find<ChapterQueryController>().chapterList.clear();
    Get.find<ChapterQueryController>().chapterQuery(bookId: widget.book.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: widget.book.title,
          subtitle:
              '${convertToBengaliNumber(widget.book.numberOfHadith.toString())} টি হাদিস'),
      body:
          GetBuilder<ChapterQueryController>(builder: (chapterQueryController) {
        return ListView.separated(
            itemBuilder: (context, index) {
              Chapter chapter = chapterQueryController.chapterList[index];
              return ListTile(
                leading: leadingTileIcon(
                    iconColor: greenColor,
                    text: convertToBengaliNumber((index + 1).toString())),
                tileColor: Colors.white,
                title: Text(chapter.title,
                    style: Theme.of(context).textTheme.labelMedium),
                subtitle: Text('হাদিসের রেঞ্জ : ${chapter.hadithRange}',
                    style: Theme.of(context).textTheme.labelSmall),
                onTap: () {
                  Get.to(HadithPageScreen(
                    bookName: widget.book.title,
                    chapterName: chapter.title,
                    bookId: widget.book.id,
                    chapterId: chapter.chapterId, iconLetter: widget.book.abvrCode,
                  ));
                },
              );
            },
            separatorBuilder: (_, __) {
              return Divider();
            },
            itemCount: chapterQueryController.chapterList.length);
      }),
      // Other Scaffold contents
    );
  }
}
