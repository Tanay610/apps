import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_list_app/authorisation/appwriteAuth.dart';
import 'package:appwrite/appwrite.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  createAccount() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircularProgressIndicator(),
                ]),
          );
        });
    try {
      final AppWriteProvider appwrite = AppWriteProvider();
      await appwrite.createUser(
          email: _email.text, password: _password.text, name: _name.text);
      Navigator.pop(context);
      const snackbar = SnackBar(content: Text('Account created!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } on AppwriteException catch (e) {
      Navigator.pop(context);
      showAlert(title: 'Account creation failed', text: e.message.toString());
    }
  }

  showAlert({required String title, required String text}) {
    showDialog(
        context: context,
        builder: (context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AppWriteAuth"),
        backgroundColor: Colors.pink,
        leading: const Icon(
          Icons.add_reaction,
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
                    "SignUp \n       Page",
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
              controller: _name,
              decoration: const InputDecoration(
                  labelText: "UserName",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  focusColor: Colors.black,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                  labelText: "E-mail",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  focusColor: Colors.black,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already User? "),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Login",
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
                    createAccount();
                  },
                  child: const Text("Sign Up")),
            )
          ],
        ),
      ),
    );
  }
}
