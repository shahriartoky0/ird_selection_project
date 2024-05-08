import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_selection_project/ui/screens/hadith_page_screen.dart';
import 'package:ird_selection_project/ui/style/colors.dart';
import 'package:ird_selection_project/ui/widget/leading_tile_icon.dart';

import '../widget/my_app_bar.dart';

class ChapterPageScreen extends StatelessWidget {
  const ChapterPageScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Book Name', subtitle: 'Range of hadidth '),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: leadingTileIcon(
                  iconColor: greenColor, text: (index + 1).toString()),
              tileColor: Colors.white,
              title: Text('Chaper Name',
                  style: Theme.of(context).textTheme.labelMedium),
              subtitle:
                  Text('Range', style: Theme.of(context).textTheme.labelSmall),
              onTap: () {
                Get.to(HadithPageScreen());
              },
            );
          },
          separatorBuilder: (_, __) {
            return Divider();
          },
          itemCount: 10),
      // Other Scaffold contents
    );
  }
}
