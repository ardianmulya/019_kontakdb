import 'package:flutter/material.dart';
import 'package:kontak_db/widget/form_kontak.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Form Kontak"),
      ),
      body: const FormKontak(),
    ));
  }
}

