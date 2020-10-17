import 'package:flutter/material.dart';
import 'package:test_notif/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMS',
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}
