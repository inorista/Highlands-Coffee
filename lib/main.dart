import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seemon/binding/home_binding.dart';
import 'package:seemon/views/dashboard/dashboard_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      defaultTransition: Transition.fade,
      title: 'Highlands Coffee',
      theme: ThemeData(
        fontFamily: "OpenSans",
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xffFFFFFF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/dashboard',
      getPages: [
        GetPage(
          name: '/dashboard',
          page: () => DashboardScreen(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
