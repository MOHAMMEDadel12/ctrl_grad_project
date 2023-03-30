import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/local_network/cashe_helper.dart';


class LanguageCacheHelper {
  static Future<void> saveLanguageCode(String languageCode) async {
    final sharedPref = await SharedPreferences.getInstance();
    CacheHelper.saveData(key: 'LOCALE', value: languageCode);
  }

  static String getLanguageCode() {
    final langCode = CacheHelper.getData(key: 'LOCALE');
    if (langCode != null) {
      return langCode;
    } else {
      return "en";
    }
  }

  static Future<void> saveIsSelected(bool isSelected) async {
    final sharedPref = await SharedPreferences.getInstance();
    CacheHelper.saveData(key: 'isSelected', value: isSelected);
    if (kDebugMode) {
      print('saved color');
    }
  }

  static bool getIsSelected() {
    final isSelected = CacheHelper.getData(key: 'isSelected');
    if (isSelected != null) {
      if (kDebugMode) {
        print(isSelected);
      }
      return isSelected;
    } else {
      if (kDebugMode) {
        print(isSelected);
      }
      return false;
    }
  }
}
