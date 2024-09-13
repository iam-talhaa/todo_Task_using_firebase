import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practise_todo/Utils/Utils.dart';
import 'package:firebase_practise_todo/ui/Login/login.dart';
import 'package:firebase_practise_todo/widgets/Custom_btn.dart';
import 'package:flutter/material.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({
    super.key,
  });

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController EmailContorller = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
        title: Text(
          "SignUp Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _keyform,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/login.png')),
              TextFormField(
                validator: (v) {
                  if (EmailContorller.text.isEmpty) {
                    return "Enter Your email";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                controller: EmailContorller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (v) {
                  if (PasswordController.text.isEmpty) {
                    return "Enter Your Password";
                  } else
                    null;
                },
                style: TextStyle(color: Colors.black),
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.text,
                controller: PasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password"),
              ),
              SizedBox(
                height: 30,
              ),
              Custom_button(
                  B_color: Colors.indigo[800],
                  ontap: () {
                    if (_keyform.currentState!.validate()) {
                      _auth
                          .createUserWithEmailAndPassword(
                              email: EmailContorller.text.toString().trim(),
                              password:
                                  PasswordController.text.toString().trim())
                          .then((v) {
                        UTils().Toastmsg("SignUp SuccessFully", Colors.green);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()));
                      }).onError((Error, s) {
                        UTils().Toastmsg(Error.toString(), Colors.red);
                      });
                    }
                  },
                  B_text: "SignUp",
                  B_height: 40.0,
                  B_width: 200.0,
                  text_color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an Account",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()));
                      },
                      child: Text("Login"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
