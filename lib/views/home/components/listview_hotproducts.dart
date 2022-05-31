import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:seemon/views/details/detail_screen.dart';

class listview_hot_products extends StatelessWidget {
  const listview_hot_products({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.fetchData(),
      builder: (context, AsyncSnapshot sn) {
        if (!sn.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          height: 180,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: kPaddingListView),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: _controller.dataThucuong.length,
            itemBuilder: (context, index) => InkWell(
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  child: Container(
                    width: 130,
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
                          flex: 4,
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
          ),
        );
      },
    );
  }
}
