import 'package:flutter/material.dart';
import 'package:ird_selection_project/ui/style/colors.dart';
import 'package:ird_selection_project/ui/widget/leading_tile_icon.dart';
import 'package:ird_selection_project/ui/widget/my_app_bar.dart';

class HadithPageScreen extends StatelessWidget {
  const HadithPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'book Name', subtitle: 'chapter name'),
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
                topLeft: Radius.circular(20.0), // Adjust corner radius
                topRight: Radius.circular(20.0), // Adjust corner radius
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Chapter Title',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium?.copyWith(color: greenColor)),
                                  SizedBox(width: 5),
                                  Text('1/1 Oddhay : ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(fontSize: 21)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                child: Divider(color: bodyBackGroundColor),
                              ),
                              Text('Quranic Verse ',
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: leadingTileIcon(
                                  text: 'B', iconColor: Colors.green),
                              tileColor: Colors.white,
                              title: Text('Book Name',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              subtitle: Text('হাদিস : ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          fontSize: 20, color: greenColor)),
                              trailing: Wrap(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 8),
                                        backgroundColor: Colors.green),
                                    onPressed: () {},
                                    child: Text('hadis category',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                fontSize: 12,
                                                color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text('Describer: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              color: Colors.green.shade500)),
                                  SizedBox(height: 8),
                                  Text('The Hadith',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider(color: bodyBackGroundColor);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
