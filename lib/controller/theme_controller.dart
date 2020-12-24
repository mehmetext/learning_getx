import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  GetStorage _box = GetStorage();
  RxBool _isDarkMode;

  @override
  void onInit() {
    super.onInit();
    _isDarkMode = false.obs;
    isDarkMode = _getThemeFromStorage();
  }

  bool get isDarkMode => _isDarkMode.value;
  set isDarkMode(bool isDarkMode) => _isDarkMode.value = isDarkMode;

  bool _getThemeFromStorage() => _box.read("isDarkMode") ?? false;

  Future<void> _setThemeToStorage(bool isDarkMode) =>
      _box.write("isDarkMode", isDarkMode);

  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  switchThemeMode(bool value) {
    isDarkMode = value;
    if (!value) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
    _setThemeToStorage(value);
  }
}
