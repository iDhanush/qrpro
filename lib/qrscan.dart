import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.pink,),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // MobileScanner(
              //   // fit: BoxFit.contain,
              //   onDetect: (capture) {
              //     final List<Barcode> barcodes = capture.barcodes;
              //     final Uint8List? image = capture.image;
              //     for (final barcode in barcodes) {
              //       debugPrint('Barcode found! ${barcode.rawValue}');
              //     }
              //   },
              // ),
              TextField(
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
              SizedBox(height: 20,),
              ElevatedButton(
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
            ],
          ),
        ));
  }
}
