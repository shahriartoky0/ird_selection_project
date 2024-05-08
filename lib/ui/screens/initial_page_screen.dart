import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_selection_project/ui/screens/chapter_page_screen.dart';

import '../widget/leading_tile_icon.dart';

class InitialPageScreen extends StatefulWidget {
  const InitialPageScreen({super.key});

  @override
  State<InitialPageScreen> createState() => _InitialPageScreenState();
}

class _InitialPageScreenState extends State<InitialPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text('আল হাদিস',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white)))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('সব হাদিসের বই ',
                style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: 8),
            Expanded(
                child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: leadingTileIcon(iconColor: Colors.green, text: 'B'),
                  tileColor: Colors.white,
                  title: Text('Book Name',
                      style: Theme.of(context).textTheme.labelMedium),
                  subtitle: Text('Writer Name',
                      style: Theme.of(context).textTheme.labelSmall),
                  trailing: Column(children: [
                    SizedBox(height: 5),
                    Text('Total hadis',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontSize: 18)),
                    SizedBox(height: 5),
                    Text('হাদিস', style: Theme.of(context).textTheme.labelSmall)
                  ]),
                  onTap: () {
                    Get.to(ChapterPageScreen());
                  },
                );
              },
              separatorBuilder: (_, __) {
                return Divider();
              },
            ))
          ],
        ),
      ),
    );
  }
}
