import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Firebase initializes before runApp
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Notes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Center(child: Text('Firebase Initialized')),
      ),
    );
  }
}
