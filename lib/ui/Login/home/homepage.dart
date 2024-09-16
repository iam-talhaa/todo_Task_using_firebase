import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_practise_todo/Utils/Utils.dart';
import 'package:firebase_practise_todo/ui/Login/home/Update_screen.dart';
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
        title: Text(
          "Tasks Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
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
              maxLines: 3,
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

                  _reference.child(id).set({
                    'title': _title.text.toString(),
                    'description': _description.text.toString(),
                    'ID': id
                  }).then((v) {
                    UTils().Toastmsg("Task Added", Colors.blue[400]);
                    _title.clear();
                    _description.clear();
                  }).onError((error, s) {
                    UTils().Toastmsg(error.toString(), Colors.blue[400]);
                  });
                },
                B_text: "Add Task",
                B_height: 40.0,
                B_width: 200.0,
                text_color: Colors.white),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: _reference,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        onTap: () {
                          print('object');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => UpdateScreen(
                                    description: snapshot
                                        .child('description')
                                        .value
                                        .toString(),
                                    title: snapshot
                                        .child('titile')
                                        .value
                                        .toString(),
                                    id: snapshot.child('ID').value.toString(),
                                  )));
                        },
                        trailing: IconButton(
                            onPressed: () {
                              _reference
                                  .child(snapshot.child('ID').value.toString())
                                  .remove()
                                  .then((v) {
                                UTils().Toastmsg("Task Remove Successfully",
                                    Colors.blue[400]);
                              }).onError((error, s) {});
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(
                            snapshot.child('description').value.toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
