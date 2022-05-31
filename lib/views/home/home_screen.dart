import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:seemon/views/home/components/body.dart';
import 'package:seemon/views/home/components/appbar.dart';

class HomeScreen extends GetWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      appBar: home_appbar(),
      body: Body(),
    );
  }
}
