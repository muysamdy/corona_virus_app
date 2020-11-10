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
import 'package:coronavirus_rest_api/service/api.dart';
import 'package:coronavirus_rest_api/service/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _accessToken = '';
  int _cases;

  void _incrementCounter() async {
    final apiService = APIService(API.sandbox());
    final accessToken = await apiService.getAccessToken();
    final cases = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.cases);

    setState(() {
      _accessToken = accessToken;
      _cases = cases as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'accessToke: $_accessToken',
              style: Theme.of(context).textTheme.headline4,
            ),
            if (_cases != null)
              Text(
                'cases : $_cases',
                style: Theme.of(context).textTheme.headline4,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
