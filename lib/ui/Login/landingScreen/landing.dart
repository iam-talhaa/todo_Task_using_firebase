import 'package:firebase_practise_todo/ui/Login/Signup/Signup.dart';
import 'package:firebase_practise_todo/ui/Login/login.dart';
import 'package:firebase_practise_todo/widgets/Custom_btn.dart';
import 'package:flutter/material.dart';

class Landing_Screen extends StatefulWidget {
  const Landing_Screen({super.key});

  @override
  State<Landing_Screen> createState() => _Landing_ScreenState();
}

class _Landing_ScreenState extends State<Landing_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(image: AssetImage("assets/donetask.png"))),
          Divider(),
          Custom_button(
            B_color: Colors.indigo[800],
            ontap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen()));
            },
            B_text: "Login",
            B_height: 40.0,
            B_width: 200.0,
            text_color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Custom_button(
            B_color: Colors.indigo[800],
            ontap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => signUpScreen()));
            },
            B_text: "Sign Up",
            B_height: 40.0,
            B_width: 200.0,
            text_color: Colors.white,
          )
        ],
      ),
    );
  }
}
