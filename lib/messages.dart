import 'package:get/get.dart';

class Messages extends Translations {
  static List<Map<String, dynamic>> languages = [
    {
      "code": "en_US",
      "name": "English",
    },
    {
      "code": "tr_TR",
      "name": "Türkçe",
    },
    {
      "code": "de_DE",
      "name": "Deutsche",
    },
  ];

  Map<String, String> enUS = {
    "home_appbar_text": "Flutter Demo Home Page",
    "how_many_pushed": "You have pushed the button this many times:",
    "decrease": "Decrease",
    "set_zero": "Set Zero",
    "increment": "Increment",
    "settings": "Settings",
    "dark_mode": "Dark Mode",
    "bravo": "Bravo!",
    "counter_is": "Your counter is %s!",
    "languages": "Languages",
    "reset_counter": "Reset Counter",
    "are_you_sure_reset_counter": "Are you really sure to reset the counter?",
    "no": "No",
    "yes": "Yes",
    "information": "Information",
    "counter_already_zero": "The counter is already zero!",
  };

  Map<String, String> trTR = {
    "home_appbar_text": "Flutter Deneme Ana Sayfası",
    "how_many_pushed": "Butona bu kadar kez bastın:",
    "decrease": "Azalt",
    "set_zero": "Sıfırla",
    "increment": "Arttır",
    "settings": "Ayarlar",
    "dark_mode": "Karanlık Modu",
    "bravo": "Tebrikler!",
    "counter_is": "Senin sayacın %s!",
    "languages": "Diller",
    "reset_counter": "Sayacı Sıfırla",
    "are_you_sure_reset_counter": "Gerçekten sayacı sıfırlamak istediğinize emin misiniz?",
    "no": "Hayır",
    "yes": "Evet",
    "information": "Bilgi",
    "counter_already_zero": "Sayaç zaten sıfır!",
  };
  
  Map<String, String> deDE = {
    "home_appbar_text": "Flutter Demo Homepage",
    "how_many_pushed": "Sie haben den Knopf so oft gedrückt:",
    "decrease": "Verringern",
    "set_zero": "Null setzen",
    "increment": "Zuwachs",
    "settings": "Einstellungen",
    "dark_mode": "Dunkler Modus",
    "bravo": "Bravo!",
    "counter_is": "Ihr Zähler ist %s!",
    "languages": "Sprachen",
    "reset_counter": "Zähler zurücksetzen",
    "are_you_sure_reset_counter": "Sind Sie wirklich sicher, den Zähler zurückzusetzen?",
    "no": "Nein",
    "yes": "Ja",
    "information": "Information",
    "counter_already_zero": "Der Zähler ist schon Null!",
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        "tr_TR": trTR,
        "de_DE": deDE,
      };
}
