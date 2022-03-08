import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_web/register.dart';
import 'addstudent.dart';
import 'mainhomescreen.dart';
import 'login.dart';
import 'addpresident.dart';
import 'addteacher.dart';
import 'addalumni.dart';
import 'student.dart';
import 'teacher.dart';
import 'alumni.dart';
import 'president.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children:  [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: Text('Azam'),
                    accountEmail: Text('azamsaeed43@gmail.com'),

                    currentAccountPicture: CircleAvatar(
                     // backgroundImage: AssetImage('assets/images/Usama.png'),
                    ))),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text(
                'Home',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, MainHomeScreen.id);
              },
            ),
            ListTile(
              leading:
                  Icon(CupertinoIcons.person_add_solid, color: Colors.white),
              title: Text(
                'Add New Teacher',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, AddTeacher.id);
              },
            ),
            ListTile(
              leading:
              Icon(CupertinoIcons.person_add_solid, color: Colors.white),
              title: Text(
                'Add Current Student',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, AddStudent.id);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person_add_solid, color: Colors.white),
              title: Text(
                'Add Alumni Student',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, AddAlumni.id);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person_add_solid, color: Colors.white),
              title: Text(
                'Add President of Student Society',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, AddPresident.id);
              },
            ),
            ListTile(
              leading:
              Icon(CupertinoIcons.person_3_fill, color: Colors.white),
              title: Text(
                'Teacher',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, teacher.id);
              },
            ),
            ListTile(
              leading:
              Icon(CupertinoIcons.person_3_fill, color: Colors.white),
              title: Text(
                'Current Student',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, student.id);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person_3_fill, color: Colors.white),
              title: Text(
                'Alumni Student',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, alumni.id);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person_3_fill, color: Colors.white),
              title: Text(
                'President of Student Society',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, president.id);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person_add_solid, color: Colors.white),
              title: Text(
                'Add New Admin',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                'Log out',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
