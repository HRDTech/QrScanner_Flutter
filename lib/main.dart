import 'package:app_report/pages/scanner_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueAccent,
          useMaterial3: true,
        ),
      home: QRCodeScannerApp(),
    );
  }
}
