import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_list_app/authorisation/appwriteAuth.dart';
import 'package:to_do_list_app/authorisation/appwriteAuth.dart';
import 'package:to_do_list_app/signup.dart';
import 'todo_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  //CircularProgressIndicator(),
                ]),
          );
        });

    try {
      final AppWriteProvider appwrite = AppWriteProvider();
      await appwrite.createEmailSession(
        email: _email.text,
        password: _password.text,
      );
      //Navigator.pop(context);
    } on AppwriteException catch (e) {
      // Navigator.pop(context);
      showAlert(title: 'Login failed', text: e.message.toString());
    }
  }

  showAlert({required String title, required String text}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  signInWithProvider(String provider) {
    try {
      final AppWriteProvider appwrite = AppWriteProvider();
      appwrite.signInWithProvider(provider: provider);
    } on AppwriteException catch (e) {
      showAlert(title: 'Login failed', text: e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AppWriteAuth"),
        backgroundColor: Colors.pink,
        leading: const Icon(
          Icons.arrow_circle_right_outlined,
          size: 30.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 30, left: 30.0),
                  child: Text(
                    "Login \n       Page",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 70.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 45.0,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  focusColor: Colors.black,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                focusColor: Colors.black,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New User? "),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 70.0,
            ),
            SizedBox(
              width: 150.0,
              height: 50.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: () {
                    signIn();
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListCreationPage()));
                  },
                  child: const Text("Log In")),
            )
          ],
        ),
      ),
    );
  }
}
