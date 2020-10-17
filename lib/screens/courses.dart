import 'package:flutter/material.dart';
import 'package:test_notif/models/user.dart';
import 'package:test_notif/services/moodle_client.dart' as moodle;
import 'package:firebase_messaging/firebase_messaging.dart';

class Courses extends StatefulWidget {
  static const String routeName = '/courses';
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    final User user = arguments['user'];
    FirebaseMessaging firebaseMessaging = FirebaseMessaging();
    firebaseMessaging.getToken().then((value) {
      print('FCM TOKEN: $value');
      moodle.registerDevice(arguments['host'], user.token, value);
    });
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions'),
      ),
      body: Center(
        child: Text(
            'Set app to background for notifications to be visible. You might want to open any other app or your home screen'),
      ),
    );
  }
}
