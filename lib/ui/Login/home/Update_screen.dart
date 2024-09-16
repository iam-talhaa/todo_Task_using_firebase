import 'package:firebase_practise_todo/widgets/Custom_btn.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  final title;
  final description;
  final id;
  const UpdateScreen(
      {super.key,
      required this.description,
      required this.title,
      required this.id});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController _update_titile = TextEditingController();
  TextEditingController _update_Descritpion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Update'),
        actions: [],
      ),
      body: Column(
        children: [
          TextFormField(
            maxLines: 3,
            controller: widget.title,
            decoration: InputDecoration(
                hintMaxLines: 3,
                hintText: "Title",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          TextFormField(
            maxLines: 3,
            controller: widget.description,
            decoration: InputDecoration(
                hintMaxLines: 3,
                hintText: "Description",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          Custom_button(
              B_color: Colors.indigo[800],
              ontap: () {},
              B_text: "Update",
              B_height: 40.0,
              B_width: 200.0,
              text_color: Colors.white)
        ],
      ),
    );
  }
}
