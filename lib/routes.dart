import 'package:flutter/material.dart';
import 'package:test_notif/screens/courses.dart';
import 'package:test_notif/screens/login.dart';

final String initialRoute = Login.routeName;

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  Login.routeName: (BuildContext context) => Login(),
  Courses.routeName: (BuildContext context) => Courses(),
};
