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
        ],
      ),
    );
  }
}
