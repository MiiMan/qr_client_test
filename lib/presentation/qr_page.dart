import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    // required options for the scanner
  );

  StreamSubscription<Object?>? _subscription;

  void _handleBarcode(BarcodeCapture capture) {
    print(capture.barcodes);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // Start listening to lifecycle changes.
  //   WidgetsBinding.instance.addObserver(this);
  //
  //   // Start listening to the barcode events.
  //   _subscription = controller.barcodes.listen(_handleBarcode);
  //
  //   // Finally, start the scanner itself.
  //   unawaited(controller.start());
  // }
  //
  // @override
  // Future<void> dispose() async {
  //   // Stop listening to lifecycle changes.
  //   WidgetsBinding.instance.removeObserver(this);
  //   // Stop listening to the barcode events.
  //   unawaited(_subscription?.cancel());
  //   _subscription = null;
  //   // Dispose the widget itself.
  //   super.dispose();
  //   // Finally, dispose of the controller.
  //   await controller.dispose();
  // }
  //
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // If the controller is not ready, do not try to start or stop it.
  //   // Permission dialogs can trigger lifecycle changes before the controller is ready.
  //   if (!controller.value.hasCameraPermission) {
  //     return;
  //   }
  //
  //   switch (state) {
  //     case AppLifecycleState.detached:
  //     case AppLifecycleState.hidden:
  //     case AppLifecycleState.paused:
  //       return;
  //     case AppLifecycleState.resumed:
  //     // Restart the scanner when the app is resumed.
  //     // Don't forget to resume listening to the barcode events.
  //       _subscription = controller.barcodes.listen(_handleBarcode);
  //
  //       unawaited(controller.start());
  //     case AppLifecycleState.inactive:
  //     // Stop the scanner when the app is paused.
  //     // Also stop the barcode events subscription.
  //       unawaited(_subscription?.cancel());
  //       _subscription = null;
  //       unawaited(controller.stop());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          child: AspectRatio(
            aspectRatio: 1,
            child: MobileScanner(
              onDetect: _handleBarcode,
            ),
          ),
        ),
      ),
    );
  }
}
