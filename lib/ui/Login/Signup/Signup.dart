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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text("SignUp Screen"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
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
              height: 40,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have an Account",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(onPressed: () {}, child: Text("Login"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
