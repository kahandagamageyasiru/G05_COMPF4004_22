import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class SignUp extends StatelessWidget {
  SignUp({super.key});
  var email;
  var password;
  

  @override
  Widget build(BuildContext context) {
    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      print(token);
      if (token != null) {
        Navigator.pushNamed(context, LandingScreen.id);
      }
    }

    checkToken();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      child: SafeArea(
        child: ListView(
          restorationId: 'text_field_demo_list_view',
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                placeholder: "Email",
                keyboardType: TextInputType.emailAddress,
                clearButtonMode: OverlayVisibilityMode.editing,
                autocorrect: false,
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                placeholder: "Password",
                clearButtonMode: OverlayVisibilityMode.editing,
                obscureText: true,
                autocorrect: false,
                onChanged: (value) {
                  password = value;
                },
              ),
            ),

            

            TextButton.icon(
                onPressed: () async {
                  await signup(email, password);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String? token = prefs.getString("token");
                  if (token != null) {
                    Navigator.pushNamed(context, LandingScreen.id);
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text("Sign UP")),
                
                
            
            Container(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                  ),
                  child: const Text("Login")),
            ),
                
          ],
        ),     
      ), 
    );
  }
}


class Radiobutton extends  StatefulWidget {
  @override
  State<Radiobutton> createState() => radbutton();
}

class radbutton extends State<Radiobutton> {
  String? gender; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container( 
            padding: EdgeInsets.all(20),
            child: 
          Column(
            children: [           
                RadioListTile(
                    title: Text("Member"),
                    value: "Member", 
                    groupValue: gender, 
                    onChanged: (value){
                      setState(() {
                          gender = value.toString();
                      });
                    },
                ),

                RadioListTile(
                    title: Text("Instructor"),
                    value: "Instructor", 
                    groupValue: gender, 
                    onChanged: (value){
                      setState(() {
                          gender = value.toString();
                      });
                    },
                ),
            ],
          ),
        ),
    );
  } 
}




signup(email, password) async {
  var url = "http://10.0.2.2:5000/signup";
  final http.Response response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  print(response.body);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var parse = jsonDecode(response.body);

  await prefs.setString('token', parse["token"]);
}

class Login extends StatelessWidget {
  static const String id = "LoginSection";

  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          automaticallyImplyLeading: false,
        ),
        child: SafeArea(
          child: ListView(
            restorationId: 'text_field_demo_list_view',
            padding: const EdgeInsets.all(16),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoTextField(
                  placeholder: "Email",
                  keyboardType: TextInputType.emailAddress,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  autocorrect: false,
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoTextField(
                  placeholder: "Password",
                  clearButtonMode: OverlayVisibilityMode.editing,
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              TextButton.icon(
                  onPressed: () async {
                    await login(email, password);
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String? token = prefs.getString("token");
                    print(token);
                    if (token != null) {
                      Navigator.pushNamed(context, LandingScreen.id);
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}

login(email, password) async {
  var url = "http://10.0.2.2:5000/login";
  final http.Response response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  print(response.body);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var parse = jsonDecode(response.body);

  await prefs.setString('token', parse["token"]);
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static const String id = "LandingScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text("Welcome to the Landing Screen")),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.pushNamed(context, LandingScreen.id);
      }

      if (index == 2) {
        Navigator.pushNamed(context, Logout.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Logout',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}

class Logout extends StatelessWidget {
  static const String id = "Logout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Logout")),
          TextButton.icon(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('token');
                Navigator.pushNamed(context, Login.id);
              },
              icon: const Icon(Icons.send),
              label: const Text("Logout"))
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
