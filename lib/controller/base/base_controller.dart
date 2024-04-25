
import '../server/server_controller.dart';

class BaseController extends ServerController{
  bool isLoading = false;
  late String builderId;
  void updateListeners({bool isLoading = false, String? builderId}){
    this.isLoading = isLoading;
    update([builderId ?? this.builderId]);
  }
}