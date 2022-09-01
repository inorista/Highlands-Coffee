import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/models/branch.dart';

class branch_widget extends StatelessWidget {
  final branch crBranch;

  const branch_widget({
    required this.crBranch,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_controller) {
        Color getColorSelected() {
          if (crBranch.branchName == _controller.currentBranch?.branchName) {
            return const Color(0xfffffaf1);
          }
          return Colors.white;
        }

        Widget getCheckMarkCurrentBranch() {
          if (crBranch.branchName == _controller.currentBranch?.branchName) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  EvaIcons.checkmark,
                  size: 16,
                  color: const Color(0xff5da16d),
                ),
                Text(
                  "Quán hiện tại",
                  style: kStyleCheckedBranch,
                ),
              ],
            );
          }
          return Container();
        }

        return GestureDetector(
          onTap: () {
            _controller.changeBranchAndAnime(crBranch);
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: getColorSelected(),
              border: const Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: const Color(0xffd1d1d5),
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      "${crBranch.branchName}",
                      style: kStyleBranchNameMap,
                    ),
                    const Spacer(),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 80,
                      ),
                      child: Text(
                        "${crBranch.branchAddress}",
                        style: kStyleBranchAddress,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: <Widget>[
                        const Icon(
                          EvaIcons.clockOutline,
                          size: 14,
                          color: Color(0xff666666),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: kPaddingListView),
                          child: Text(
                            "07:00 - 21:00",
                            style: kStyleBranchAddress,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                Positioned(
                  top: 30,
                  right: 0,
                  child: Image.asset(
                    "assets/images/flag.png",
                    height: 25,
                    width: 25,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: -16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: const BoxDecoration(
                      color: Color(0xfffef5d6),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    child: getCheckMarkCurrentBranch(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
