import "package:get/get.dart";
import "package:graph_ql_demo/controllers/details_controller.dart";

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(DetailsController.new);
  }
}
