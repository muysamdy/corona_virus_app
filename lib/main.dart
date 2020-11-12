import 'package:coronavirus_rest_api/repository/data_repository.dart';
import 'package:coronavirus_rest_api/screen/daskboard.dart';
import 'package:coronavirus_rest_api/service/api.dart';
import 'package:coronavirus_rest_api/service/api_service.dart';
import 'package:coronavirus_rest_api/service/data_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  // This Widget is the root of application
  const MyApp({Key key, @required this.sharedPreferences}) : super(key: key);
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(API.sandbox()),
        dataCacheService:
            DataCacheService(sharedPreferences: sharedPreferences),
      ),
      child: MaterialApp(
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate
        // ],
        // supportedLocales: [
        //   const Locale('km', 'KH'),
        // ],
        title: 'Coronavirus Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF222222),
        ),
        home: Dashboard(),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'km_KH';
  await initializeDateFormatting();
  final sharedPreference = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreference));
}
