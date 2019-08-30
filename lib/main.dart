import 'package:flutter/material.dart';

import './test_signature1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer Signature',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Signature1(),
    );
  }
}
