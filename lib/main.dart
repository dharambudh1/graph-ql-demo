import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:graph_ql_demo/utils/app_routes.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GraphQL Demo",
      navigatorKey: Get.key,
      theme: getThemeData(brightness: Brightness.light),
      darkTheme: getThemeData(brightness: Brightness.dark),
      getPages: AppRoutes.instance.getPages(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData getThemeData({required Brightness brightness}) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorSchemeSeed: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
    return themeData;
  }
}
