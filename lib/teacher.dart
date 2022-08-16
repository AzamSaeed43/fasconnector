import 'package:flutter_admin_web/drawer.dart';
import 'sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class teacher extends StatefulWidget {
  const teacher({Key? key}) : super(key: key);
  static String id = 'teacher';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<teacher> {
  final _firestore = FirebaseFirestore.instance;

  // For Teacher
  final CollectionReference _teacher =
      FirebaseFirestore.instance.collection('User');

  Future<void> _updateTeacher(DocumentSnapshot? documentSnapshot) async {
    // text fields' controllers
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _qualificationController =
        TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _phonenoController = TextEditingController();
    final TextEditingController _officenoController = TextEditingController();
    final TextEditingController _positionController = TextEditingController();
    final TextEditingController _timetableController = TextEditingController();
    final TextEditingController _profilepictureController =
        TextEditingController();

    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['Name'];
      _qualificationController.text = documentSnapshot['Qualification'];
      _emailController.text = documentSnapshot['Email'];
      _addressController.text = documentSnapshot['Address'];
      _phonenoController.text = documentSnapshot['MobileNo'];
      _officenoController.text = documentSnapshot['OfficeNo'];
      _positionController.text = documentSnapshot['Position'];
      _timetableController.text = documentSnapshot['TimeTable'];
      _profilepictureController.text = documentSnapshot['ProfilePicture'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: ListView(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _qualificationController,
                  decoration: const InputDecoration(
                    labelText: 'Qualification',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextField(
                  controller: _phonenoController,
                  decoration: const InputDecoration(labelText: 'Mobile No'),
                ),
                TextField(
                  controller: _officenoController,
                  decoration: const InputDecoration(labelText: 'Office No'),
                ),
                TextField(
                  controller: _positionController,
                  decoration: const InputDecoration(labelText: 'Posiition'),
                ),
                TextField(
                  controller: _profilepictureController,
                  decoration:
                      const InputDecoration(labelText: 'Profile Picture'),
                ),
                TextField(
                  controller: _timetableController,
                  decoration: const InputDecoration(labelText: 'Time Table'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Update'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final String? qualification = _qualificationController.text;
                    final String? email = _emailController.text;
                    final String? address = _addressController.text;
                    final String? phoneno = _phonenoController.text;
                    final String? officeno = _officenoController.text;
                    final String? position = _positionController.text;
                    final String? profilepicture =
                        _profilepictureController.text;
                    final String? timetable = _timetableController.text;

                    if (name != null &&
                        qualification != null &&
                        email != null &&
                        address != null &&
                        phoneno != null &&
                        officeno != null &&
                        profilepicture != null &&
                        position != null &&
                        timetable != null) {
                      // Update the product
                      await _teacher.doc(documentSnapshot!.id).update({
                        'Name': name,
                        'Qualification': qualification,
                        'Email': email,
                        'Address': address,
                        'MobileNo': phoneno,
                        'OfficeNo': officeno,
                        'Position': position,
                        'TimeTable': timetable,
                        'ProfilePicture': profilepicture,
                        'UserType': 'Teacher',
                      });

                      // Clear the text fields
                      _nameController.text = '';
                      _qualificationController.text = '';
                      _emailController.text = '';
                      _addressController.text = '';
                      _phonenoController.text = '';
                      _officenoController.text = '';
                      _positionController.text = '';
                      _timetableController.text = '';
                      _profilepictureController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _deleteTeacher(String teacherId) async {
    await _teacher.doc(teacherId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a Teacher Record')));
  }

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
          children: [
            CustomeSizedBox(height: 20),
            Container(
              width: 500,
              height: 50,
              color: Colors.teal,
              child: Center(child: Text("Display Teachers")),
            ),
            CustomeSizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('User')
                    .where('UserType', isEqualTo: 'Teacher')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> students = snapshot.data!.docs;

                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  snapshot.data!.docs[index];

                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "${documentSnapshot['ProfilePicture']}"),
                                    radius: 16,
                                  ),
                                  title: Text(documentSnapshot['Name'] +
                                      "\n" +
                                      documentSnapshot['Qualification'] +
                                      "\n" +
                                      documentSnapshot['Email'] +
                                      "\n" +
                                      documentSnapshot['Address'] +
                                      "\n" +
                                      documentSnapshot['MobileNo'] +
                                      "\n" +
                                      documentSnapshot['OfficeNo'] +
                                      "\n" +
                                      documentSnapshot['Position']),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        // Press this button to edit a single product
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            _updateTeacher(documentSnapshot);
                                          },
                                        ),
                                        // This icon button is used to delete a single product
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            _deleteTeacher(documentSnapshot.id);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }));
                  } else {
                    return Text('Error');
                  }
                }),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
