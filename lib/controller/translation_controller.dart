import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslationController extends GetxController {
  GetStorage _box = GetStorage();
  Rx<Locale> _locale;

  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    String localeCodeFromBox = _getLocaleCode();
    if (localeCodeFromBox == null) {
      _locale = Get.deviceLocale.obs;
    } else {
      _locale = _localeFromCode(localeCodeFromBox).obs;
    }
  }

  String _getLocaleCode() => _box.read("locale");

  _setLocaleCode(String localeCode) => _box.write("locale", localeCode);

  changeLocale(String code) {
    _setLocaleCode(code);
    _locale.value = _localeFromCode(code);
    Get.updateLocale(_locale.value);
  }

  String getLocaleCode() {
    return "${locale.languageCode}_${locale.countryCode}";
  }

  Locale _localeFromCode(String code) {
    List<String> splitted = code.split("_");
    return Locale(splitted[0], splitted[1]);
  }
}
