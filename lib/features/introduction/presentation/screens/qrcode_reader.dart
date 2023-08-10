import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QRCodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("QR Code Reader"),
      ),
    );
  }
}
