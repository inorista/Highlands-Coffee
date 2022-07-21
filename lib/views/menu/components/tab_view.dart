import 'package:flutter/material.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/models/category.dart';
import 'package:seemon/views/menu/components/menu_item.dart';

class TabView extends StatelessWidget {
  const TabView({
    Key? key,
    required this.crCategory,
  }) : super(key: key);

  final category crCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kPaddingDefault),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            crCategory.nameCategory.toTitleCase(),
            style: kStyleCategoryMenu,
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.65,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: kPaddingDefault),
              itemCount: crCategory.categoryProduct.length,
              itemBuilder: (BuildContext context, index) => menu_item(crProduct: crCategory.categoryProduct[index]),
            ),
          ),
        ],
      ),
    );
  }
}
