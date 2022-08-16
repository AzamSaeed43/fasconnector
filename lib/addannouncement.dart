import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sizebox.dart';
import 'package:flutter/material.dart';
import 'mainhomescreen.dart';
import 'drawer.dart';

class AddAnnoucement extends StatefulWidget {
  const AddAnnoucement({Key? key}) : super(key: key);
  static String id = 'AddNewAnnoucementScreen';

  @override
  _AddAnnoucementState createState() => _AddAnnoucementState();
}

class _AddAnnoucementState extends State<AddAnnoucement> {
  String? name;
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
                'Add Upcoming Event(Annoucement)',
                style: TextStyle(fontSize: 25),
              ),
              CustomeSizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Event Name',
                  labelText: 'Event Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              CustomeSizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Upload Image of Announcemennt',
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  profilepicture = value;
                },
              ),
              CustomeSizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    try {
                      var uniqueKey =
                          _firestore.collection('Announcement').doc();
                      _firestore
                          .collection('Announcement')
                          .doc(uniqueKey.id)
                          .set({
                        'EventName': name,
                        'EventPic': profilepicture,
                        'ID': uniqueKey.id.toString(),
                      });
                      Navigator.pushNamed(context, MainHomeScreen.id);
                    } on FirebaseAuthException catch (e) {
                      Navigator.pop(context);
                      print('Failed with error code: ${e.code}');
                      print(e.message);
                    }
                  },
                  child: Text('Save')),
            ]),
          )),
      drawer: MyDrawer(),
    );
  }
}
