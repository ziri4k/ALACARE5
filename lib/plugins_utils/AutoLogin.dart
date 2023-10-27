import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final login_status_key = "login_status_key";
  static final user_id = "user_id_key";

  static Future<bool> setLoginStatus(bool status) async {////used in login screen after successful login.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(login_status_key, status);
  }

  static Future<bool> isLoggedIn() async {////used in main.dart file for checking auto-login
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool(login_status_key);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }

  static Future<bool> saveUserId(String userName) async {//used in login screen after successful login
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(user_id, userName);
  }

  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(user_id);
  }

  static Future<bool> clearPreference() async {////used in logout-button tap.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(password_user_idkey);
    prefs.setBool(login_status_key, false);
    return true;
  }
}