import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> with WidgetsBindingObserver {

  String data = 'initial data';
  DateTime time = DateTime.now();
  String d = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    time = DateTime.now();
  }

  void _handleBarcode(BarcodeCapture capture) {
    data = capture.barcodes[0].rawValue!;

    d = '${DateTime.now().millisecondsSinceEpoch - time.millisecondsSinceEpoch}';
    time = DateTime.now();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: AspectRatio(
                aspectRatio: 1,
                child: MobileScanner(
                  onDetect: _handleBarcode,
                ),
              ),
            ),

            SizedBox(height: 100,),

            Text('Сканирование: $d мс'),

            SizedBox(height: 100,),

            Text(data)
          ],
        )
      ),
    );
  }
}
