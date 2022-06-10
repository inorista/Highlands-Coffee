import 'package:flutter/material.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';

class login_button extends StatefulWidget {
  const login_button({
    Key? key,
  }) : super(key: key);

  @override
  State<login_button> createState() => _login_buttonState();
}

class _login_buttonState extends State<login_button> {
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

    return Padding(
      padding: EdgeInsets.all(kPaddingDefault),
      child: GestureDetector(
        onTapCancel: () => onCancel(),
        onTapDown: (_) => onPressed(),
        onTapUp: (_) => onCancel(),
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          highlightColor: const Color(0xffD43E43),
          splashColor: const Color(0xffD43E43),
          onPressed: () {},
          minWidth: MediaQuery.of(context).size.width,
          color: Color(0xffB2282D),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: AnimatedOpacity(
              opacity: _opacity,
              curve: Curves.bounceIn,
              duration: Duration(milliseconds: 200),
              child: Text(
                "Đăng Ký / Đăng Nhập",
                style: kStyleLoginButtonText_reverse,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
