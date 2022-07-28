import 'package:flutter_admin_web/admin.dart';
import 'package:flutter_admin_web/drawer.dart';
import 'sizebox.dart';
import 'student.dart';
import 'teacher.dart';
import 'alumni.dart';
import 'president.dart';
import 'announcement.dart';
import 'admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({Key? key}) : super(key: key);
  static String id = 'MainHomeScreen';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();

}

class _MainHomeScreenState extends State<MainHomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAS Connector'),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomeSizedBox(height: 20),
            Container(
              height: 50,
              color: Colors.teal,
              child: FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, teacher.id);
                },
                child: Center(
                  child: Text("Display Teachers"),
                ),
              ),
            ),
            CustomeSizedBox(height: 20),
            Container(
              height: 50,
              color: Colors.teal,
              child: FlatButton(
                onPressed: (){
                Navigator.pushNamed(context, student.id);
              },
                child: Center(
                  child: Text("Display Current Students"),
                ),
              ),
            ),
            CustomeSizedBox(height: 20),
            Container(
              height: 50,
              color: Colors.teal,
              child: FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, president.id);
                },
                child: Center(
                  child: Text("Display President of Student Societies"),
                ),
              ),
            ),
            CustomeSizedBox(height: 20),
            Container(
              height: 50,
              color: Colors.teal,
              child: FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, alumni.id);
                },
                child: Center(
                  child: Text("Display Alumni Students"),
                ),
              ),
            ),
            CustomeSizedBox(height: 20),
            Container(
              height: 50,
              color: Colors.teal,
              child: FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, Admins.id);
                },
                child: Center(
                  child: Text("Admins"),
                ),
              ),
            ),
            CustomeSizedBox(height: 20),
            Container(
              height: 50,
              color: Colors.teal,
              child: FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, announcement.id);
                },
                child: Center(
                  child: Text("Announcements"),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
