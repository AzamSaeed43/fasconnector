import 'package:cloud_firestore/cloud_firestore.dart';

import 'mainhomescreen.dart';
import 'sizebox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'LoginPage';
  static Map<String, dynamic>? user;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? Email;
  String? Password;
  String ErrorMsg = "";
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  getData() async {
    String? Admin;
    Map<String, dynamic>? dataEmail;

    CollectionReference admin = FirebaseFirestore.instance.collection("Admin");

    await admin
        .where('Email', isEqualTo: '$Email')
        .get()
        .then((value) => value.docs.forEach((element) {
              print(element.data());
              print("--------------------");
              dataEmail = element.data() as Map<String, dynamic>?;
              LoginScreen.user = dataEmail;
              Admin = dataEmail?['Email'];
              print(dataEmail?['Email']);
            }));

    if (Admin != null) {
      print("Login ${Admin.toString()} as Admin");

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainHomeScreen()));
    } else {
      Navigator.pop(context);
      print("Error in logining");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error in Logining Plz Try Again"),
          duration: Duration(seconds: 3)));
    }
  }

  void _trySubmitForm() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingDialog(
            message: "Logging....",
          );
        });
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: Email.toString(), password: Password.toString());
      if (user != null) {
        getData();
      } else {
        Navigator.pop(context);
        setState(() {
          ErrorMsg = 'Enter correct username and password';
        });
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      print('Failed with error code: ${e.code}');
      print(e.message);
    }

    /*
      Continute proccessing the provided information with your own logic
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('FAS Connector'),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              CustomeSizedBox(height: 50),
              Image.asset(
                'assets/images/Security.png',
                fit: BoxFit.cover,
                scale: 3.5,
              ),
              CustomeSizedBox(height: 10),
              const Text(
                'Welcome to Login',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              CustomeSizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (enteredEmail) {
                  Email = enteredEmail;
                },
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                onChanged: (enteredPassword) {
                  Password = enteredPassword;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 320,
                child: ElevatedButton(
                    onPressed: _trySubmitForm,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 17),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ),
      ),
    );
  }
}
