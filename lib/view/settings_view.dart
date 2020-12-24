import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/controller/theme_controller.dart';
import 'package:learning_getx/controller/translation_controller.dart';
import 'package:learning_getx/messages.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  ThemeController _themeController = Get.find();
  TranslationController _translationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _darkModeChangerWidget,
            _changeLanguageWidget,
          ],
        ),
      ),
    );
  }

  Widget get _darkModeChangerWidget => Obx(
        () => SwitchListTile(
          title: Text("dark_mode".tr),
          value: _themeController.isDarkMode,
          onChanged: (value) {
            _themeController.switchThemeMode(value);
          },
        ),
      );

  Widget get _changeLanguageWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "languages".tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Messages.languages.length,
            itemBuilder: (c, i) => ListTile(
              onTap: () {
                _translationController
                    .changeLocale(Messages.languages[i]["code"]);
              },
              trailing: _getTrailingIcon(Messages.languages[i]["code"]),
              title: Text("${Messages.languages[i]["name"]}"),
            ),
          ),
        ],
      );

  Widget _getTrailingIcon(String languageCode) {
    if (languageCode != _translationController.getLocaleCode()) {
      return Icon(Icons.check_box_outline_blank);
    } else {
      return Icon(Icons.check);
    }
  }
}
