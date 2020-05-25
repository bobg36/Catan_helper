import 'package:flutter/material.dart';

class TradePage extends StatefulWidget {
  static const String route = '/';
  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FlatButton(
            color: Colors.green,
            child: Text('Are you sure you want to reset?'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
