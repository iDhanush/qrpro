import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
          ),
          CircleAvatar(
            radius: 85,
            backgroundImage: AssetImage(
              'images/gojo.jpg',
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text('Gojo Stataro',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(
            height: 18,
          ),
          Text(
            '9967662431',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
