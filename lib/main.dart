import 'package:firebase_practise_todo/ui/Login/landingScreen/landing.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Todo_using_f());
}

class Todo_using_f extends StatefulWidget {
  const Todo_using_f({super.key});

  @override
  State<Todo_using_f> createState() => _Todo_using_fState();
}

class _Todo_using_fState extends State<Todo_using_f> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landing_Screen(),
    );
  }
}
