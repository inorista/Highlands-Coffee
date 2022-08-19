import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';

class bottom_sheet_change_method extends StatefulWidget {
  const bottom_sheet_change_method({
    Key? key,
  }) : super(key: key);

  @override
  State<bottom_sheet_change_method> createState() => _bottom_sheet_change_methodState();
}

class _bottom_sheet_change_methodState extends State<bottom_sheet_change_method> {
  double _opacity = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      setState(() {
        _opacity = 0.5;
      });
    }

    void onCancel() {
      setState(() {
        _opacity = 1;
      });
    }

    return Container(
      height: MediaQuery.of(context).size.height / 4 + 20,
      padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  EvaIcons.close,
                  size: 32,
                  color: Color(0xff666666),
                ),
              ),
              const Spacer(),
              const Text("Chọn Phương thức giao hàng"),
              const Spacer(flex: 2),
            ],
          ),
          const Spacer(),
          Container(
            height: 90,
            padding: const EdgeInsets.all(kPaddingDefault),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xfff7d046),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: kPaddingDefault),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("assets/images/payment_method.jpg"),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Nhận món tại", style: kPickMethodText),
                            ],
                          ),
                          const Spacer(),
                          Text("Lê Văn Sỹ", style: kStoreName),
                          Flexible(
                            child: Text(
                              "188A Lê Văn Sỹ, Phường 10, Phú Nhuận, Hồ Chí Minh",
                              overflow: TextOverflow.ellipsis,
                              style: kStoreAddress,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault * 2, vertical: kPaddingItems),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffedc945),
                    ),
                    child: Center(
                      child: Text("Sửa", style: kEditConfirmBox),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: GestureDetector(
              onTapCancel: () => onCancel(),
              onTapDown: (_) => onPressed(),
              onTapUp: (_) => onCancel(),
              child: FlatButton(
                onPressed: () => Get.back(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                highlightColor: const Color(0xffB2282D),
                color: const Color(0xffB2282D),
                splashColor: const Color(0xffD43E43),
                child: Center(
                  child: AnimatedOpacity(
                    opacity: _opacity,
                    curve: Curves.bounceIn,
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      "Xác nhận",
                      style: kStyleLoginButtonText_reverse,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
