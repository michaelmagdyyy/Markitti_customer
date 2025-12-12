import 'package:shared_preferences/shared_preferences.dart';

import '../../models/person_model.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setValue(String key, var value) async {
    if (value.runtimeType == String) {
      prefs.setString(key, value);
    }
    if (value.runtimeType == int) {
      prefs.setInt(key, value);
    }
    if (value.runtimeType == bool) {
      prefs.setBool(key, value);
    }
  }

  static dynamic getValue(String key) {
    return prefs.get(key).runtimeType == String
        ? prefs.getString(key)
        : prefs.get(key).runtimeType == int
            ? prefs.getInt(key)
            : prefs.getBool(key);
  }

  static clear() async {
    await prefs.remove(AppCached.id);
    await prefs.remove(AppCached.name);
    await prefs.remove(AppCached.email);
    await prefs.remove(AppCached.mobileNumber);
    await prefs.remove(AppCached.token);

    await prefs.remove('show_store');
  }
}

class AppCached {
  static String id = "id";
  static String name = "fullname";
  static String cardNum = "cardNum";
  static String mobileNumber = "phone";
  static String email = "email";
  static String token = "token";
  static String tokenName = "tokenName";
  static String cardId = "cardId";
  static String subscription_ends_at = "subscription_ends_at";
}

saveData({required PersonModel model, bool saveToken = true}) {
  CacheHelper.setValue(AppCached.id, model.cardInfo?.cardId);
  CacheHelper.setValue(AppCached.email, model.personalData?.eMail);
  CacheHelper.setValue(AppCached.name, model.personalData?.fullName);
  CacheHelper.setValue(AppCached.subscription_ends_at, model.subscription_ends_at);
  CacheHelper.setValue(AppCached.mobileNumber, model.cardInfo?.mobileNumber);
  CacheHelper.setValue(AppCached.cardNum, model.cardInfo?.cardNo);
  CacheHelper.setValue(AppCached.cardId, model.cardInfo?.cardId);
  if (saveToken) CacheHelper.setValue(AppCached.token, model.csrfTokenValue);
  if (saveToken) CacheHelper.setValue(AppCached.tokenName, model.csrfTokenName);
}
