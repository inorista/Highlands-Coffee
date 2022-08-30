import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:ndialog/ndialog.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/update_controller.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateController>(
        init: UpdateController(),
        builder: (_controller) {
          Widget isChangedInfo() {
            if (_controller.isChanged == true) {
              return GestureDetector(
                onTap: () async {
                  await CustomProgressDialog.future(
                    context,
                    blur: 5,
                    future: Future.delayed(
                      Duration(milliseconds: 500),
                      () async {
                        _controller.updateUserInfo().then((value) => Get.back());
                      },
                    ),
                    loadingWidget: Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: CupertinoActivityIndicator(),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                  );
                },
                child: Text(
                  "Lưu",
                  style: kStyleOnSave,
                ),
              );
            }
            return Container();
          }

          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              color: kBackgroundColorUpdate,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () => Get.back(),
                                          child: const Icon(
                                            EvaIcons.arrowIosBack,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                        isChangedInfo(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: -20,
                              child: Opacity(
                                opacity: 0.25,
                                child: Image.asset(
                                  "assets/images/stack_pattern.png",
                                  height: 200,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(flex: 1),
                      Flexible(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextFormField(
                                controller: _controller.name,
                                hintText: "Nhập tên đầy đủ của bạn",
                                type: "Tên",
                                urlImage: "assets/images/fullname_icon.png",
                                isRequired: true,
                                isEnabled: true,
                                showArrow: false,
                              ),
                              buildTextFormField(
                                controller: _controller.email,
                                hintText: "Nhập email của bạn",
                                type: "Email",
                                urlImage: "assets/images/email_icon.png",
                                isRequired: false,
                                isEnabled: true,
                                showArrow: false,
                              ),
                              buildTextFormField(
                                controller: _controller.gender,
                                hintText: "",
                                type: "Giới Tính",
                                urlImage: "assets/images/gender_icon.png",
                                isRequired: false,
                                isEnabled: false,
                                press: () => _controller.showGenderPicker(context),
                                style: kStyleInputs,
                                showArrow: true,
                              ),
                              buildTextFormField(
                                controller: _controller.sdt,
                                hintText: _controller.phoneNumber,
                                type: "Số Điện Thoại",
                                urlImage: "assets/images/number_icon.png",
                                isRequired: false,
                                isEnabled: false,
                                errorText: "Bạn không thể thay đổi số điện thoại đã đăng ký",
                                press: null,
                                showArrow: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                  Positioned(
                    top: 50,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.125,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Center(
                        child: Image.asset(
                          "assets/images/profile_icon.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class buildTextFormField extends GetWidget<UpdateController> {
  const buildTextFormField({
    Key? key,
    required TextEditingController controller,
    required this.hintText,
    required this.urlImage,
    required this.type,
    required this.isRequired,
    required this.isEnabled,
    this.style,
    this.errorText,
    this.press,
    required this.showArrow,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String hintText;
  final String urlImage;
  final String type;
  final String? errorText;
  final bool isRequired;
  final bool isEnabled;
  final VoidCallback? press;
  final TextStyle? style;
  final bool showArrow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press ?? null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kPaddingDefault),
        child: TextFormField(
          maxLength: 22,
          onChanged: (value) => controller.setOnSaveButton(value),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: kStyleInputs,
          controller: _controller,
          cursorColor: const Color(0xff1a1add),
          decoration: InputDecoration(
            counterText: "",
            suffixIcon: showArrow ? Icon(EvaIcons.arrowIosDownward) : null,
            errorText: errorText ?? null,
            enabled: isEnabled ? true : false,
            errorStyle: kStyleErrorText,
            hintText: hintText,
            hintStyle: style ?? kStyleHint,
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            icon: Image.asset(
              urlImage,
              height: 35,
              width: 35,
            ),
            label: Row(
              children: [
                Text(
                  type,
                  style: kStyleLabel,
                ),
                if (isRequired) ...[
                  Text(
                    "*",
                    style: kStyleLabelStar,
                  ),
                ],
              ],
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffd9d9d9),
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffb79663),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
