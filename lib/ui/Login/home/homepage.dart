import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_practise_todo/widgets/Custom_btn.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _description = TextEditingController();
  TextEditingController _title = TextEditingController();
  DatabaseReference _reference = FirebaseDatabase.instance.ref("Todo");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _title,
            decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _description,
            decoration: InputDecoration(
                hintMaxLines: 3,
                hintText: "Description",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          SizedBox(
            height: 20,
          ),
          Custom_button(
              B_color: Colors.indigo[800],
              ontap: () {
                final id = DateTime.now().millisecondsSinceEpoch.toString();

                _reference.child('id').set('Title');
              },
              B_text: "Add Task",
              B_height: 40.0,
              B_width: 200.0,
              text_color: Colors.white)
        ],
      ),
    );
  }
}
