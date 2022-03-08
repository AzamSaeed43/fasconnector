import 'mainhomescreen.dart';
import 'sizebox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'LoginPage';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  final _uth = FirebaseAuth.instance;

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
                  email = enteredEmail;
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
                  password = enteredPassword;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 320,
                child: ElevatedButton(
                    onPressed: () async {
                      UserCredential user =
                          await _uth.signInWithEmailAndPassword(
                              email: email.toString(),
                              password: password.toString());
                      if (user != null) {
                        Navigator.pushNamed(context, MainHomeScreen.id);
                      }
                    },
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
