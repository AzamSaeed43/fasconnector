
import 'package:flutter_admin_web/drawer.dart';
import 'sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class president extends StatefulWidget {
  const president({Key? key}) : super(key: key);
  static String id = 'president';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<president> {
  final _firestore = FirebaseFirestore.instance;

  // For President

  final CollectionReference _president =
  FirebaseFirestore.instance.collection('President');

  Future<void> _updatePresident([DocumentSnapshot? documentSnapshot]) async {

    // text fields' controllers
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _regController = TextEditingController();
    final TextEditingController _cnicController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _phonenoController=TextEditingController();
    final TextEditingController _disciplineController = TextEditingController();
    final TextEditingController _degreeyearController = TextEditingController();
    final TextEditingController _societyController=TextEditingController();
    final TextEditingController _profilepictureController=TextEditingController();


    if (documentSnapshot != null) {

      _nameController.text = documentSnapshot['Name'];
      _regController.text = documentSnapshot['RegNo'];
      _cnicController.text = documentSnapshot['CNIC'];
      _passwordController.text = documentSnapshot['Password'];
      _emailController.text = documentSnapshot['Email'];
      _addressController.text = documentSnapshot['Address'];
      _phonenoController.text=documentSnapshot['MobileNo'];
      _disciplineController.text=documentSnapshot['Discipline'];
      _degreeyearController.text=documentSnapshot['DegreeYear'];
      _societyController.text=documentSnapshot['Society'];
      _profilepictureController.text=documentSnapshot['ProfilePicture'];

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
                  controller: _regController,
                  decoration: const InputDecoration(
                    labelText: 'RegNo',
                  ),
                ),
                TextField(
                  controller: _cnicController,
                  decoration: const InputDecoration(labelText: 'CNIC'),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
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
                  decoration: const InputDecoration(labelText: 'MobileNo'),
                ),
                TextField(
                  controller: _disciplineController,
                  decoration: const InputDecoration(labelText: 'Discipline'),
                ),
                TextField(
                  controller: _degreeyearController,
                  decoration: const InputDecoration(labelText: 'Degree Year'),
                ),
                TextField(
                  controller: _societyController,
                  decoration: const InputDecoration(labelText: 'Society'),
                ),
                TextField(
                  controller: _profilepictureController,
                  decoration: const InputDecoration(labelText: 'Profile Picture'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Update'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final String? reg = _regController.text;
                    final String? cnic=_cnicController.text;
                    final String? password = _passwordController.text;
                    final String? email = _emailController.text;
                    final String? address=_addressController.text;
                    final String? phoneno=_phonenoController.text;
                    final String? discipline = _disciplineController.text;
                    final String? degreeyear=_degreeyearController.text;
                    final String? society=_societyController.text;
                    final String? profilepicture=_profilepictureController.text;
                    if (name != null && reg != null && cnic!=null &&
                        password != null && email != null && address!=null && phoneno!=null
                        && discipline!=null && degreeyear!=null && society!=null  && profilepicture!=null) {

                      // Update the product
                      await _president
                          .doc(documentSnapshot!.id)
                          .update({'Name': name,
                        'RegNo': reg,
                        'CNIC': cnic,
                        'Password':password,
                        'Email':email,
                        'Address':address,
                        'MobileNo':phoneno,
                        'Discipline':discipline,
                        'DegreeYear':degreeyear,
                        'Society':society,
                        'ProfilePicture':profilepicture
                      });


                      // Clear the text fields
                      _nameController.text = '';
                      _regController.text = '';
                      _cnicController.text='';
                      _passwordController.text = '';
                      _emailController.text = '';
                      _addressController.text='';
                      _phonenoController.text='';
                      _disciplineController.text='';
                      _degreeyearController.text='';
                      _societyController.text='';
                      _profilepictureController.text='';


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

  Future<void> _deletePresident(String presidentId) async {
    await _president.doc(presidentId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a President Record')));
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
              child: Center(
                  child: Text("Display President of Student Societies")
              ),
            ),
            CustomeSizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('User').where('UserType',isEqualTo: 'President').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> students =
                        snapshot.data!.docs;

                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];

                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "${documentSnapshot['ProfilePicture']}"
                                    ),
                                    radius: 16,
                                  ),
                                  title: Text(documentSnapshot['Name'] +
                                      "\n" +
                                      documentSnapshot['Email'] +
                                      "\n" +
                                      documentSnapshot['Address'] +
                                      "\n" +
                                      documentSnapshot['MobileNo']+
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
                                            _updatePresident(documentSnapshot);
                                          },
                                        ),
                                        // This icon button is used to delete a single product
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            _deletePresident(documentSnapshot.id);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        )
                    );
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
