import 'package:cloud_firestore/cloud_firestore.dart';
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
  String? regno;
  String? cnic;
  String? password;
  String? email;
  String? address;
  String? mobileno;
  String? discipline;
  String? degreeyear;
  String? society;
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
                    hintText: 'Enter Registration No of Student',
                    labelText: 'Registration No',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    regno = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter CNIC of Student',
                    labelText: 'CNIC',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    cnic = value;
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
                    hintText: 'Enter Discipline of Student',
                    labelText: 'Discipline',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    discipline = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Degree Year of Student',
                    labelText: 'Degree Year',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    degreeyear = value;
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
                    society = value;
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
                      _firestore.collection('President').add({
                        'Name': name,
                        'RegNo': regno,
                        'CNIC': cnic,
                        'Password':password,
                        'Email':email,
                        'Address':address,
                        'MobileNo':mobileno,
                        'Society':society,
                        'Discipline':discipline,
                        'DegreeYear':degreeyear,
                        'ProfilePicture':profilepicture
                      });
                      Navigator.pushNamed(context, MainHomeScreen.id);
                    },
                    child: Text('Save')),
              ]),
            )
        ),
      drawer: MyDrawer(),
    );
  }
}
