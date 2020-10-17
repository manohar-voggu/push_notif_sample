import 'package:flutter/material.dart';
import 'package:test_notif/models/user.dart';
import 'package:test_notif/screens/courses.dart';
import 'package:test_notif/services/moodle_client.dart' as moodle;

class Login extends StatelessWidget {
  static const String routeName = '/login';
  String host = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'host',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              host = value;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'token',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (value) async {
              User user = await moodle.auth(host, value);
              if (user != null) {
                Navigator.pushReplacementNamed(context, Courses.routeName,
                    arguments: {'user': user, 'host': host});
              }
            },
          ),
        ],
      ),
    );
  }
}
