import 'package:flutter/material.dart';

import '../style/colors.dart';
import 'leading_tile_icon.dart';

class HadithRefTile extends StatelessWidget {
  final String iconLetter;
  final iconColor;
  final String bookName;
  final int hadithNumber;
  final String hadithCategory;
  final categoryColor;

  const HadithRefTile({
    super.key,
    required this.iconLetter,
    this.iconColor = Colors.green,
    required this.bookName,
    required this.hadithNumber,
    required this.hadithCategory,
    this.categoryColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingTileIcon(text: iconLetter, iconColor: iconColor),
      tileColor: Colors.white,
      title: Text(bookName, style: Theme.of(context).textTheme.labelMedium),
      subtitle: Text('হাদিস : $hadithNumber',
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontSize: 20, color: greenColor)),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            backgroundColor: categoryColor),
        onPressed: () {},
        child: Text(hadithCategory,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 12, color: Colors.white)),
      ),
    );
  }
}