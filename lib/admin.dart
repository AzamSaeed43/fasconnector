import 'package:flutter_admin_web/drawer.dart';
import 'sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admins extends StatefulWidget {
  const Admins({Key? key}) : super(key: key);
  static String id = 'Admin';

  @override
  _AdminsScreenState createState() => _AdminsScreenState();
}

class _AdminsScreenState extends State<Admins> {
  final _firestore = FirebaseFirestore.instance;


  final CollectionReference _Admin =
  FirebaseFirestore.instance.collection('Admin');


  Future<void> _updateAdmin([DocumentSnapshot? documentSnapshot]) async {

    // text fields' controllers
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _phonenoController=TextEditingController();
    final TextEditingController _profilepictureController=TextEditingController();

    if (documentSnapshot != null) {

      _nameController.text = documentSnapshot['Name'];
      _emailController.text = documentSnapshot['Email'];
      _addressController.text = documentSnapshot['Address'];
      _phonenoController.text=documentSnapshot['MobileNo'];
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
                  controller: _profilepictureController,
                  decoration: const InputDecoration(labelText: 'Profile Picture URL'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Update'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final String? email = _emailController.text;
                    final String? address=_addressController.text;
                    final String? phoneno=_phonenoController.text;
                    final String? profilepicture=_profilepictureController.text;
                    if (name != null  && email != null && address!=null && phoneno!=null
                        && profilepicture!=null) {

                      // Update the product
                      await _Admin
                          .doc(documentSnapshot!.id)
                          .update({'Name': name,
                        'Email':email,
                        'Address':address,
                        'MobileNo':phoneno,
                        'ProfilePicture':profilepicture,

                      });


                      // Clear the text fields
                      _nameController.text = '';
                      _emailController.text = '';
                      _addressController.text='';
                      _phonenoController.text='';
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

  Future<void> _deleteAdmin(String AdminId) async {
    await _Admin.doc(AdminId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a Admin Record')));
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
                  child: Text("Display Admins")
              ),
            ),
            CustomeSizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('Admin').snapshots(),
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
                                      documentSnapshot['MobileNo']),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        // Press this button to edit a single product
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            _updateAdmin(documentSnapshot);
                                          },
                                        ),
                                        // This icon button is used to delete a single product
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            _deleteAdmin(documentSnapshot.id);
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
