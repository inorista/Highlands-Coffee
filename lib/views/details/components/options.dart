import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/constants/padding_constants.dart';

class options extends StatelessWidget {
  const options({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 30,
          width: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
