import 'package:get/get.dart';
import '../cache/cache.dart';
import '../controller/theme/theme_controller.dart';

class App {
  static Future<void> init() async {
    await AppCache.init();
    await PreparerControllers.prepareController();
  }
}

class PreparerControllers {
  static Future<void> prepareController() async {
    Get.put(ThemeController());
  }
}
