import 'dart:convert';
import 'package:http/http.dart';
import 'package:test_notif/models/user.dart';

final String path = '/webservice/rest/server.php';

Future<User> auth(String host, String token) async {
  var params = {
    'wsfunction': 'core_webservice_get_site_info',
    'moodlewsrestformat': 'json',
    'wstoken': '$token',
  };
  var uri = Uri.http(host, path, params);
  Response resp = await get(uri);
  if (resp.statusCode == 200) {
    var decoded = json.decode(resp.body);
    return User(
      userId: decoded['userid'],
      fullName: decoded['fullname'],
      email: decoded['username'],
      dpUrl: decoded['userpictureurl'],
      token: token,
    );
  } else {
    return null;
  }
}

registerDevice(String host, String token, String fcmToken) async {
  var params = {
    'wsfunction': 'core_user_add_user_device',
    'moodlewsrestformat': 'json',
    'wstoken': '$token',
    'appid': 'com.example.mycms',
    'name': 'myAndroidNickName',
    'model': 'android',
    'platform': 'android',
    'version': '10.3.2',
    'pushid': '$fcmToken',
    'uuid': '12311-8EC8-4A93-A6C231228',
  };
  var uri = Uri.http(host, path, params);
  Response resp = await get(uri);
  print('sent request: ${uri.toString()}');
  if (resp.statusCode == 200)
    print('SUCCESS: POST done');
  else
    print('ERROR: POST failed');
}
