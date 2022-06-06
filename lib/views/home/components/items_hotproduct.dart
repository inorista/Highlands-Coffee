import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/detail/detail_screen.dart';

class items_hotproduct extends StatefulWidget {
  const items_hotproduct({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<items_hotproduct> createState() => _items_hotproductState(this.index);
}

class _items_hotproductState extends State<items_hotproduct> with TickerProviderStateMixin {
  final int index;
  _items_hotproductState(this.index);
  double scaleInit = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      setState(() {
        scaleInit = 0.95;
      });
    }

    void onCancel() {
      setState(() {
        scaleInit = 1;
      });
    }

    HomeController _controller = Get.put(HomeController());
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTapDown: (_) => onPressed(),
      onTapUp: (_) => onCancel(),
      onTapCancel: () => onCancel(),
      onTap: () {
        Get.to(
          () => DetailScreen(
            thucuong: _controller.dataThucuong[index],
          ),
        );
      },
      child: Hero(
        tag: _controller.dataThucuong[index].tenThucuong,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Transform.scale(
            scale: this.scaleInit,
            child: Container(
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(-0.1, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(kPaddingItems),
                        color: const Color(0xffF6F1E7),
                        child: ClipRRect(
                          child: Image.network(
                            _controller.dataThucuong[index].anhThucuong,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(kPaddingItems),
                      child: Text(
                        _controller.dataThucuong[index].tenThucuong.toString().toTitleCase(),
                        style: kStyleNameItems,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
