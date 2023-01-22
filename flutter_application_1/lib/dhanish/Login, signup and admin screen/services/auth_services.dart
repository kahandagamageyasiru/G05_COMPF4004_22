import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/models/user.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/providers/user_provider.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/screens/signup_screen.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/screens/coach-home.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/screens/home_screen.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/utils/constants.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/screens/admin.dart';

/*Future<String> getUserType(usertype) async {
  final response = await http.post(
    Uri.parse('${Constants.uri}/api/signin'),
    body: jsonEncode({
      'usertype': usertype,
    }),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    print(responseData);
    return responseData['userType'];
  } else {
    throw Exception('Failed to get userType');
  }
}*/

/*Future<http.Response> getData() async {
  final response =
      await http.get(Uri.parse('${Constants.uri}/api/getusertype'));
  return response;
}*/

/*Future<String> getUserType() async {
  final response =
      await http.get(Uri.parse('${Constants.uri}/api/getusertype'));
  print(response.statusCode);
  print(response.body);
  final decodedResponse = jsonDecode(response.body);
  return decodedResponse['usertype'];
}*/

Future<String> getUserType(String email) async {
  final response = await http.get(
    Uri.parse("${Constants.uri}/api/getusertype?email=$email"),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    final userType = jsonDecode(response.body)["usertype"];
    print(userType);
    return userType;
  } else {
    print("Getting user type failed. Response: ${response.body}");
    throw Exception("Failed to get userType");
  }
}

/*if (response.statusCode == 200) {
    final userType = jsonDecode(response.body)["userType"];
    return userType;
  } else {
    print("Getting user type failed. Response: ${response.body}");
    throw Exception("Failed to get userType");
  }*/

/*Future<String> getUserType() async {
  return 'member';
}
*/

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String usertype,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        token: '',
        usertype: usertype,
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    const String adminEmail = 'admin@gmail.com';
    const String adminPassword = 'admin123';

    if (email == adminEmail && password == adminPassword) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const adminpage()),
        (route) => false,
      );
      return;
    }
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

          /*final response = await getData();*/
          /*final userType = jsonDecode(response.body);*/
          final userType = await getUserType(email);
          if (userType == 'member') {
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false,
            );
          } else {
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const CoachHomeScreen(),
              ),
              (route) => false,
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('${Constants.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${Constants.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
      (route) => false,
    );
  }
}
