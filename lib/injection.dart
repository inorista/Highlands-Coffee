import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:seemon/controllers/home_controllers.dart';

final locator = GetIt.instance;

void configInjection() {
  locator.registerFactory<HomeController>(() => HomeController());
}
