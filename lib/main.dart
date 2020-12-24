import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learning_getx/controller/theme_controller.dart';
import 'package:learning_getx/controller/translation_controller.dart';
import 'package:learning_getx/messages.dart';
import 'package:learning_getx/view/home_view.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeController _themeController = Get.put(ThemeController());
  TranslationController _translationController = Get.put(TranslationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Messages(),
      locale: _translationController.locale,
      fallbackLocale: Locale("en", "EN"),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: _themeController.theme,
      darkTheme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
