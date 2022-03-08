import 'mainhomescreen.dart';
import 'sizebox.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String id = 'RegisterPage';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  final _uth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('FAS Connector'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
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
                'Welcome to Register',
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
                          await _uth.createUserWithEmailAndPassword(
                              email: email.toString(),
                              password: password.toString());
                      if (user != null) {
                        Navigator.pushNamed(context, MainHomeScreen.id);
                      }
                    },
                    child: const Text('Register')),
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
