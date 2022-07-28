import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sizebox.dart';
import 'package:flutter/material.dart';
import 'mainhomescreen.dart';
import 'drawer.dart';


class AddPresident extends StatefulWidget {
  const AddPresident({Key? key}) : super(key: key);
  static String id = 'AddNewPresidentScreen';

  @override
  _AddPresidentState createState() => _AddPresidentState();
}

class _AddPresidentState extends State<AddPresident> {
  String? name;
  String? password;
  String? email;
  String? address;
  String? mobileno;
  String? position;
  String? profilepicture;


  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('FAS Connector'),
          elevation: 0,
        ),
        body: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(children: [
                Image.asset(
                  'assets/images/Security.png',
                  fit: BoxFit.cover,
                  scale: 3.5,
                ),
                Text(
                  'Add President of Society',
                  style: TextStyle(fontSize: 25),
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Name of Student',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email of Student',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Password of Student',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Address of Student',
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    address = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Mobile Number of Student',
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    mobileno = value;
                  },
                ),
                CustomeSizedBox(height: 20),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Society Name',
                    labelText: 'Society Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    position = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Upload Profile Picture of Student',
                    labelText: 'Profile Picture',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    profilepicture = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
    try{
    final user =  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.toString(), password: password.toString());
    if(user!=null){
      var uniqueKey =
      _firestore.collection('User').doc();
      _firestore.collection('User').doc(uniqueKey.id).set({
    'Name': name,
    'Email':email,
    'Address':address,
    'MobileNo':mobileno,
    'Position':position,
    'ProfilePicture':profilepicture,
        'ID':uniqueKey.id.toString(),
    'UserType':'President',
    });
    Navigator.pushNamed(context, MainHomeScreen.id);
    }else{
      print('Failed to add data');
    }

    } on FirebaseAuthException catch  (e) {
      Navigator.pop(context);
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
                    },
                    child: Text('Save')),
              ]),
            )
        ),
      drawer: MyDrawer(),
    );
  }
}
