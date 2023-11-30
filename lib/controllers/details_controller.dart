import "package:get/get.dart";
import "package:graph_ql_demo/models/get_a_char.dart";

class DetailsController extends GetxController {
  final RxString _id = "".obs;

  final Rx<GetAChar> _getAChar = GetAChar().obs;

  String get id => _id.value;
  set id(String value) => _id(value);

  GetAChar get getAChar => _getAChar.value;
  set getAChar(GetAChar value) => _getAChar(value);
}
