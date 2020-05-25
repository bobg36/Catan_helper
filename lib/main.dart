import 'package:flutter/material.dart';
import 'HexPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HexPage.route,
      routes: {
        HexPage.route: (context) => HexPage(),
      },
    );
  }
}
