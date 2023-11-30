import "package:get/get.dart";
import "package:graph_ql_demo/controllers/list_controller.dart";

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ListController.new);
  }
}
