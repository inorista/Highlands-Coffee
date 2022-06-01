import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/controllers/detail_controllers.dart';
import 'package:seemon/models/thucuong.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:intl/intl.dart';

class options extends StatelessWidget {
  const options({
    Key? key,
    required this.index,
    required this.size,
    required this.fixedPrice,
    this.thucuong,
    required this.press,
  }) : super(key: key);
  final String size;
  final int index;
  final double fixedPrice;
  final thucuong;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('###,000', 'ID');
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (dtController) {
        final minPrice = thucuong.listPrice[0];

        Color getTheIndexColorBG() {
          if (dtController.selectedSize == index) {
            return kSelectedSizeBG;
          }
          return kUnselectedSizeBG;
        }

        Color getTheIndexColorText() {
          if (dtController.selectedSize == index) {
            return kSelectedSizeText;
          }
          return kUnselectedSizeText;
        }

        Color getTheIndexColorCompare() {
          if (dtController.selectedSize == index) {
            return kSelectedCompare;
          }
          return kUnselectedCompare;
        }

        Text comparePrice() {
          return Text(
            "+${currencyFormatter.format(fixedPrice - minPrice).toString()}₫",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              color: getTheIndexColorText(),
            ),
          );
        }

        Container isFirstItem() {
          if (index == 0) {
            return Container();
          }
          return Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            width: double.infinity,
            decoration: BoxDecoration(
              color: getTheIndexColorCompare(),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: comparePrice(),
          );
        }

        Column isNotFirstItem() {
          if (index != 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: kPaddingSize),
                  child: Text(
                    "${size}",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: getTheIndexColorText(),
                    ),
                  ),
                ),
                isFirstItem(),
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${size}",
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: getTheIndexColorText(),
                ),
              ),
            ],
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
          child: InkWell(
            onTap: press,
            child: Container(
              height: 45,
              width: 60,
              decoration: BoxDecoration(
                color: getTheIndexColorBG(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: isNotFirstItem(),
            ),
          ),
        );
      },
    );
  }
}
