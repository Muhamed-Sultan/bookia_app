import 'package:shared_preferences/shared_preferences.dart';

class SharedLocal {
  static SharedPreferences? prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
 