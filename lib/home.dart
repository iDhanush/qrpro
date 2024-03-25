import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrpro/qrscan.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}




class _homepageState extends State<homepage> {

  "+++++"
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.pinkAccent),
      body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Icon(Icons.person_2_outlined, size: 150, color: Colors.black87),
              Padding(
                padding: EdgeInsets.all(10),
                child: QrImageView(
                  data: '1234567890',
                  version: QrVersions.auto,
                  size: 200.0,
                  foregroundColor: Colors.pinkAccent,
                  gapless: true,
                ),
              ),
              FittedBox(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QrPage()));
                  },
                  child: const Text(
                    'SCAN',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              FittedBox(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QrPage()));
                  },
                  child: const Text(
                    'PROFILE',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
