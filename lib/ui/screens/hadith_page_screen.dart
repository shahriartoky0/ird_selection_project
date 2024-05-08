import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ird_selection_project/controller/section_query_controller.dart';
import 'package:ird_selection_project/ui/style/colors.dart';
import 'package:ird_selection_project/ui/widget/my_app_bar.dart';
import '../../controller/hadith_query_controller.dart';
import '../widget/chapter_details_container.dart';
import '../widget/hadith_part.dart';
import '../widget/hadith_ref_tile.dart';

class HadithPageScreen extends StatefulWidget {
  final String bookName;
  final String chapterName;
  final int bookId;
  final int chapterId;

  const HadithPageScreen(
      {super.key,
      required this.bookName,
      required this.chapterName,
      required this.bookId,
      required this.chapterId});

  @override
  State<HadithPageScreen> createState() => _HadithPageScreenState();
}

class _HadithPageScreenState extends State<HadithPageScreen> {
  @override
  void initState() {
    Get.find<HadithQueryController>().hadithList.clear();
    Get.find<HadithQueryController>()
        .hadithQuery(bookId: widget.bookId, chapterId: widget.chapterId);
    Get.find<SectionQueryController>().sectionList.clear();
    Get.find<SectionQueryController>()
        .sectionQuery(bookId: widget.bookId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: widget.bookName, subtitle: widget.chapterName),
      body: Stack(
        children: [
          Container(
            height: 20,
            color: greenColor, // Assuming greenColor is defined somewhere
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: double.infinity,
            // Add margin to separate from colored container
            decoration: BoxDecoration(
                color: bodyBackGroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ChapterDetailsContainer(
                          chapterTitle: 'Chapter title',
                          chapterIntro: '1/1 Oddhay : ',
                          quranVerse: 'Quranic Verse '),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HadithRefTile(
                              iconLetter: 'B',
                              bookName: 'book Name',
                              hadithNumber: 0,
                              hadithCategory: 'Category',
                            ),
                            SizedBox(height: 3),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: HadithPart(
                                describer: 'describer',
                                arabicText: 'Arabic Text hadith',
                                bengaliText: 'Bangla Text Hadith',
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
