import 'package:flutter_admin_web/drawer.dart';
import 'sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class announcement extends StatefulWidget {
  const announcement({Key? key}) : super(key: key);
  static String id = 'announcement';

  @override
  _announcementScreenState createState() => _announcementScreenState();
}

class _announcementScreenState extends State<announcement> {
  final _firestore = FirebaseFirestore.instance;



  final CollectionReference _announcement =
  FirebaseFirestore.instance.collection('Announcement');


  Future<void> _updateannouncement([DocumentSnapshot? documentSnapshot]) async {

    // text fields' controllers
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _profilepictureController=TextEditingController();

    if (documentSnapshot != null) {

      _nameController.text = documentSnapshot['EventName'];
      _profilepictureController.text=documentSnapshot['EventPic'];

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
                  decoration: const InputDecoration(labelText: 'Event Name'),
                ),
                TextField(
                  controller: _profilepictureController,
                  decoration: const InputDecoration(labelText: 'Picture URL'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Update'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final String? profilepicture=_profilepictureController.text;
                    if (name != null  && profilepicture!=null) {

                      // Update the product
                      await _announcement
                          .doc(documentSnapshot!.id)
                          .update({'EventName': name,
                        'EventPic':profilepicture,
                      });
                      // Clear the text fields
                      _nameController.text = '';
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

  Future<void> _deleteannouncement(String announcementId) async {
    await _announcement.doc(announcementId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a Event Record')));
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
                  child: Text("Display Upcoming Event(Announcement)")
              ),
            ),
            CustomeSizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('Announcement').snapshots(),
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
                                        "${documentSnapshot['EventPic']}"
                                    ),
                                    radius: 16,
                                  ),
                                  title: Text(documentSnapshot['EventName']),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        // Press this button to edit a single product
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            _updateannouncement(documentSnapshot);
                                          },
                                        ),
                                        // This icon button is used to delete a single product
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            _deleteannouncement(documentSnapshot.id);
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
