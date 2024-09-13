import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have an Account",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(onPressed: () {}, child: Text("Sign Up"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
