import 'package:get/get.dart';

class BaseServerController extends GetxController {
  late int statusCode;
  String? message = '';
  bool hasError = false;
}
