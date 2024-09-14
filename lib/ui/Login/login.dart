import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practise_todo/Utils/Utils.dart';
import 'package:firebase_practise_todo/ui/Login/Signup/Signup.dart';
import 'package:firebase_practise_todo/ui/Login/home/homepage.dart';
import 'package:firebase_practise_todo/widgets/Custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
        title: Text(
          "Login Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/login.png')),
              TextFormField(
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Enter Your Email";
                  } else
                    null;
                },
                controller: _emailController,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Enter Your Email"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Enter Your Password";
                  } else
                    null;
                },
                controller: _passwordController,
                style: TextStyle(color: Colors.black),
                obscureText: true,
                obscuringCharacter: "#",
                keyboardType: TextInputType.text,
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
                    if (_formKey.currentState!.validate()) {
                      _auth
                          .signInWithEmailAndPassword(
                              email: _emailController.text.toString().trim(),
                              password:
                                  _passwordController.text.toString().trim())
                          .then((v) {
                        UTils()
                            .Toastmsg("SignIn Successfully", Colors.blue[200]);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen()));
                      }).onError((Error, s) {
                        UTils().Toastmsg(Error.toString(), Colors.red);
                      });
                    }
                  },
                  B_text: "Login",
                  B_height: 40.0,
                  B_width: 200.0,
                  text_color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have an Account",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => signUpScreen()));
                      },
                      child: Text("Sign Up"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
