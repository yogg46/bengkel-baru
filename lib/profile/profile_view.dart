import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late CollectionReference _usersCollection;
  late Stream<DocumentSnapshot> _userStream;
  late File _imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _usersCollection = FirebaseFirestore.instance.collection('users');
    String userId = FirebaseAuth.instance.currentUser!.uid;
    _userStream = _usersCollection.doc(userId).snapshots();
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }

  Future<void> editProfilePicture() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      await uploadProfilePicture();
    }
  }

  Future<void> uploadProfilePicture() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    String fileName = 'profile_picture_$userId.jpg';
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(fileName);
    await ref.putFile(_imageFile);
    String imageUrl = await ref.getDownloadURL();
    // Update the user's profile picture URL in Firestore
    await _usersCollection.doc(userId).update({'profilePicture': imageUrl});

    // Refresh the user's data to reflect the updated profile picture
    setState(() {
      _userStream = _usersCollection.doc(userId).snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Purnomo Mobil',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 121, 35, 8),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _userStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            var userData = snapshot.data!.data();
            if (userData != null && userData is Map<String, dynamic>) {
              var username = userData['name'] ?? 'N/A';
              var email = userData['email'] ?? 'N/A';
              var profilePicture = userData['profilePicture'] ?? null;

              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 16.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 80.0,
                                backgroundImage: profilePicture != null
                                    ? NetworkImage(profilePicture)
                                    : AssetImage('assets/images/user.png') as ImageProvider,
                              ),
                              SizedBox(height: 16.0),
                              ElevatedButton(
                                child: Text(
                                  "Edit Profile Picture",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 121, 35, 8),
                                  fixedSize: Size(180, 40),
                                ),
                                onPressed: editProfilePicture,
                              ),
                              SizedBox(height: 16.0),
                              Column(
                                children: [
                                  Text(
                                    'Nama: $username',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          const Color.fromARGB(255, 23, 22, 22),
                                    ),
                                  ),
                                  Text(
                                    'Email: $email',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          const Color.fromARGB(255, 23, 22, 22),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text('Invalid user data'));
            }
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
