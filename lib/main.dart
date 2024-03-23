import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iot/firebase_options.dart';
import 'package:iot/screens/charts_panel/charts_panel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChartsPanel(),
    );
  }
}
