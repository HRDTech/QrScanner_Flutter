import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';



class QRCodeScannerApp extends StatefulWidget {
  @override
  _QRCodeScannerAppState createState() => _QRCodeScannerAppState();
}

class _QRCodeScannerAppState extends State<QRCodeScannerApp> {
  late QRViewController _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController viewDataScanner = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Scanner'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: QRView(
                key: _qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Text('Scan a QR code'),
              ),
            ),
            Expanded(
              child: TextField(
                controller: viewDataScanner,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
      _controller.scannedDataStream.listen((scanData) {
        print('Scanned data: ${scanData.code}');
        viewDataScanner.text = scanData.code!;
        // Handle the scanned data as desired
      });
    });
  }
}