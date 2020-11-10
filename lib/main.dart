// import 'package:coronavirus_rest_api/service/api.dart';
// import 'package:coronavirus_rest_api/service/api_service.dart';
// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   // This Widget is the root of application
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Restful API',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String _accessT = '';

//   Future<void> _incrementCounter() async {
//     final apiService = APIService(API.sandbox());
//     final accessToke = await apiService.getAccessToken();
//     setState(() => _accessT = accessToke);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('test'),
//       ),
//       body: Container(),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.plus_one),
//         onPressed: _incrementCounter,
//       ),
//     );
//   }
// }

// void main() => runApp(MyApp());
