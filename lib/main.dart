import 'package:coronavirus_rest_api/repository/data_repository.dart';
import 'package:coronavirus_rest_api/screen/daskboard.dart';
import 'package:coronavirus_rest_api/service/api.dart';
import 'package:coronavirus_rest_api/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This Widget is the root of application
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(apiService: APIService(API.sandbox())),
      child: MaterialApp(
        title: 'Coronavirus Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF222222),
        ),
        home: Dashboard(),
      ),
    );
  }
}

void main() => runApp(MyApp());
