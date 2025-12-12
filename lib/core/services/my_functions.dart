import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyFunctions{
  static bool isRTL(BuildContext context) => Directionality.of(context).toString().contains(TextDirection.RTL.value.toLowerCase());
  static bool isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
  static Future<String> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      print("Firebase Token: $token");
      return token;
    } else {
      print("No Firebase token found.");
      return "";
    }
  }
}