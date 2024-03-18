import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class registor extends StatefulWidget {
  const registor({Key? key}) : super(key: key);

  @override
  State<registor> createState() => _registorState();
}

class _registorState extends State<registor> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void RegUser() async {
    String name = nameController.text;
    int roll = int.parse(rollController.text);
    String email = emailController.text;
    String pass = passController.text;
    print('object');
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/register');
    var resp = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            {"name": name, "rollno": roll, "email": email, "password": pass}));
    if (resp.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => loginpage(),
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
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(children: [
            const Align(
              alignment: Alignment.center,
            ),
            const Text(
              'Registration',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(
                  'Name',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: rollController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(
                  'Roll Number',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(
                  'email',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(
                  'Password',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.pink,
              ),
              onPressed: () {
                RegUser();

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => profilepage(),
                //     ));
              },
              child: Text(
                'Register',
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
