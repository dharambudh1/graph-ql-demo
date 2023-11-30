import "package:get/get.dart";
import "package:graph_ql_demo/bindings/details_binding.dart";
import "package:graph_ql_demo/bindings/list_binding.dart";
import "package:graph_ql_demo/screens/details_screen.dart";
import "package:graph_ql_demo/screens/list_screen.dart";

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  String listScreen = "/";

  String detailsScreen = "/detailsScreen";

  List<GetPage<dynamic>> getPages() {
    return <GetPage<dynamic>>[
      GetPage<dynamic>(
        name: listScreen,
        page: ListScreen.new,
        binding: ListBinding(),
      ),
      GetPage<dynamic>(
        name: detailsScreen,
        page: DetailsScreen.new,
        binding: DetailsBinding(),
      ),
    ];
  }
}
