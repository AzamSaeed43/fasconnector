import 'package:cloud_firestore/cloud_firestore.dart';
import 'sizebox.dart';
import 'package:flutter/material.dart';
import 'mainhomescreen.dart';
import 'drawer.dart';


class AddTeacher extends StatefulWidget {
  const AddTeacher({Key? key}) : super(key: key);
  static String id = 'AddNewTeacherScreen';

  @override
  _AddTeacherState createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  String? name;
  String? qualification;
  String? cnic;
  String? password;
  String? email;
  String? address;
  String? phoneno;
  String? officeno;
  String? faxno;
  String? grade;
  String? position;
  String? biography;
  String? profilepicture;
  String? timetable;
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
                  'Add New Teacher',
                  style: TextStyle(fontSize: 25),
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Name of Teacher',
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
                    hintText: 'Enter Qualification of Teacher',
                    labelText: 'Qualification',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    qualification = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter CNIC of Teacher',
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
                    hintText: 'Enter Password of Teacher',
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
                    hintText: 'Enter Email of Teacher',
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
                    hintText: 'Enter Address of Teacher',
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
                    hintText: 'Enter Phone Number of Teacher',
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    phoneno = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Office Number of Teacher',
                    labelText: 'Office Number',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    officeno = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Fax Number of Teacher',
                    labelText: 'Fax Number',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    faxno = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Grade of Teacher',
                    labelText: 'Grade',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    grade = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Position of Teacher',
                    labelText: 'Position',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    position = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Biography of Teacher',
                    labelText: 'Biography',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    biography = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Upload Profile Picture of Teacher',
                    labelText: 'Profile Picture',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    profilepicture = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Upload Timetable of Teacher',
                    labelText: 'Timetable',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    timetable = value;
                  },
                ),
                CustomeSizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      _firestore.collection('Teacher').add({
                        'Name': name,
                        'Qualification': qualification,
                        'CNIC': cnic,
                        'Password':password,
                        'Email':email,
                        'Address':address,
                        'PhoneNo':phoneno,
                        'OfficeNo':officeno,
                        'Fax':faxno,
                        'Grade':grade,
                        'Position':position,
                      'ProfilePicture':profilepicture,
                      'TimeTable':timetable,
                        'Biography':biography
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
