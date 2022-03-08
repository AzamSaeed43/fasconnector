import 'package:flutter_admin_web/addteacher.dart';
import 'package:flutter_admin_web/student.dart';

import 'addstudent.dart';
import 'login.dart';
import 'mainhomescreen.dart';
import 'register.dart';
import 'addalumni.dart';
import 'addpresident.dart';
import 'student.dart';
import 'teacher.dart';
import 'alumni.dart';
import 'president.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyColwl5dME_ZSCQCoyq8_s2xL9v2IU4iKw",
        projectId: "fasconnector-2e1c4",
        messagingSenderId: "254207299018",
        appId: "1:254207299018:web:ef1c2d274047ae067e1333",
        storageBucket: "fasconnector-2e1c4.appspot.com/"
  ),
  );
  runApp(const Admin());
}

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        MainHomeScreen.id: (context) => const MainHomeScreen(),
        AddStudent.id: (context) => const AddStudent(),
        AddAlumni.id:(context) => const AddAlumni(),
        AddPresident.id:(context) => const AddPresident(),
        AddTeacher.id:(context) => const AddTeacher(),
        student.id:(context)=>const student(),
        teacher.id:(context)=>const teacher(),
        alumni.id:(context)=>const alumni(),
        president.id:(context)=>const president()

      },
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
