import 'package:get/get.dart';
import 'package:seemon/controllers/home_controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
