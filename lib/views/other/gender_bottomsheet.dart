import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/update_controller.dart';
import 'package:seemon/views/other/gender_widget.dart';

class GenderPicker extends StatefulWidget {
  const GenderPicker({Key? key}) : super(key: key);

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
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
    UpdateController _controller = Get.put(UpdateController());
    return Container(
      height: MediaQuery.of(context).size.height / 3.5 + 10,
      padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  EvaIcons.close,
                  size: 30,
                  color: Color(0xff666666),
                ),
              ),
              Spacer(),
              Text(
                "Chọn giới tính của bạn",
                style: kStyleChangeGender,
              ),
              Spacer(),
              GestureDetector(
                child: const Icon(
                  EvaIcons.close,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Spacer(),
          ...List.generate(
            _controller.listGender.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: kPaddingSize),
                child: gender_widget(
                  index: index,
                  gender: _controller.listGender[index],
                ),
              );
            },
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
