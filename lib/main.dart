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
import 'addadmin.dart';
import 'admin.dart';
import 'addannouncement.dart';
import 'announcement.dart';
import 'post.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'homepage.dart';

// flutter run -d chrome --web-renderer html

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBDGhmpaM-6AJ9bcAfp2XlQMuKE4qAycFg",
        authDomain: "fasconnector-f0ee1.firebaseapp.com",
        projectId: "fasconnector-f0ee1",
        storageBucket: "fasconnector-f0ee1.appspot.com",
        messagingSenderId: "176527684531",
        appId: "1:176527684531:web:b22d53af5cba4a252e11c6"),
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
        MainHomeScreen.id: (context) => MainHomeScreen(),
        AddStudent.id: (context) => const AddStudent(),
        AddAlumni.id: (context) => const AddAlumni(),
        AddPresident.id: (context) => const AddPresident(),
        AddTeacher.id: (context) => const AddTeacher(),
        student.id: (context) => const student(),
        teacher.id: (context) => const teacher(),
        alumni.id: (context) => const alumni(),
        president.id: (context) => const president(),
        announcement.id: (context) => const announcement(),
        AddAnnoucement.id: (context) => const AddAnnoucement(),
        AddAdmin.id: (context) => const AddAdmin(),
        Admins.id: (context) => const Admins(),
        post.id: (context) => const post(),
      },
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
