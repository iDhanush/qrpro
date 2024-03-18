import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qrpro/register.dart';

import 'home.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController rollControl = TextEditingController();
  TextEditingController passControl = TextEditingController();

  void loginUser() async {
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/login');
    var resp = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            {"rollno": rollControl.text, "password": passControl.text}));
    print(resp.body);
    if (resp.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homepage(),
          ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text((resp.body))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: const Text(
          'QR PRO',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person_pin,
                color: Colors.pinkAccent,
                size: 100,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: rollControl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pinkAccent, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Username'),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: passControl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pinkAccent, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Password'),
              ),
              SizedBox(
                height: 25,
              ),
              FittedBox(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  onPressed: () {
                    loginUser();
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(color: Colors.white10),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => registor(),
                          ));
                    },
                    child: Text('REGISTER'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
