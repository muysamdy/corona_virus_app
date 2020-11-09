import 'package:shared_preferences/shared_preferences.dart';

Future<void> setToken(String token) async => (await SharedPreferences.getInstance()).setString("token", token);

Future<String> token() async => (await SharedPreferences.getInstance()).getString("token");

