import 'package:bitcoin_ticker/screen/bitcoin_ticker.dart';
import'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BitcoinScreen(),
    );
  }
}
