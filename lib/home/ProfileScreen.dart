// ignore_for_file: prefer_const_constructors, unnecessary_cast, use_build_context_synchronously, avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api, file_names, prefer_const_literals_to_create_immutables

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:panara_dialogs/panara_dialogs.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User _user;
  late String _userName = 'Loading...';
  late String _userEmail = 'Loading...';
  late String _imagePath = "images/duf_img/profile_image.jpg";

  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot userSnapshot =
          await _usersCollection.doc(_user.uid).get();
      Map<String, dynamic>? userData =
          userSnapshot.data() as Map<String, dynamic>?;

      if (userData != null &&
          userData.containsKey('First name') &&
          userData.containsKey('Email')) {
        setState(() {
          _userName = userData['First name'] ?? 'Default Name';
          _userEmail = userData['Email'] ?? 'example@example.com';
          _imagePath = userData['Photo'] ?? 'images/duf_img/profile_image.jpg';
        });
      } else {
        print('User data is null or missing required fields.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> _updateProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        String imageUrl =
            await _uploadImageToFirestore(pickedFile as PickedFile);

        await _usersCollection.doc(_user.uid).update({'Photo': imageUrl});

        setState(() {
          _imagePath = imageUrl;
        });
      } catch (e) {
        print('Error updating profile picture: $e');
      }
    }
  }

  Future<String> _uploadImageToFirestore(PickedFile pickedFile) async {
    String fileName =
        _user.uid + DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference =
        FirebaseStorage.instance.ref().child('profile_pictures/$fileName');
    UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
    TaskSnapshot storageTaskSnapshot =
        await uploadTask.whenComplete(() => null);

    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> _confirmAction(String action, Function() onPressed) async {
    PanaraConfirmDialog.show(
      context,
      title: 'Confirm $action',
      message: 'Are you sure you want to $action?',
      confirmButtonText: action,
      cancelButtonText: 'Cancel',
      onTapCancel: () {
        Navigator.pop(context);
      },
      onTapConfirm: () {
        onPressed();
        Navigator.pop(context);
      },
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: true,
    );
  }

  void _deleteAccount() async {
    try {
      await _usersCollection.doc(_user.uid).delete();
      await _user.delete();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print('Error deleting account: $e');
    }
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _editInformation() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController =
            TextEditingController(text: _userName);
        TextEditingController emailController =
            TextEditingController(text: _userEmail);

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Edit Information', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _userName = nameController.text;
                    _userEmail = emailController.text;
                  });
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<Map<String, dynamic>> getBookingDetails() async {
    CollectionReference hotelCollection =
        FirebaseFirestore.instance.collection('hotels');

    DocumentSnapshot bookingDoc =
        await hotelCollection.doc('reservations').get();

    if (bookingDoc.exists) {
      Map<String, dynamic> bookingData =
          bookingDoc.data() as Map<String, dynamic>;

      String startDate = bookingData['startDay'];
      String endDate = bookingData['endDay'];
      double totalPrice = bookingData['totalPrice'];

      return {
        'startDay': startDate,
        'endDay': endDate,
        'totalPrice': totalPrice,
      };
    } else {
      return {};
    }
  }

  Future<void> showBookingDetailsDialog(
      BuildContext context, Map<String, dynamic> bookingDetails) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Start Day: ${bookingDetails['startDay']}'),
              Text('End Day: ${bookingDetails['endDay']}'),
              Text('Total Price: ${bookingDetails['totalPrice']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> getAndShowBookingDetails(BuildContext context) async {
    Map<String, dynamic> bookingDetails = await getBookingDetails();

    if (bookingDetails.isNotEmpty) {
      // Show dialog with booking details
      await showBookingDetailsDialog(context, bookingDetails);
    } else {
      PanaraInfoDialog.show(
        context,
        title: 'Oops!',
        message: 'there are no booking for you',
        buttonText: "Okay",
        onTapDismiss: () {
          Navigator.pop(context);
        },
        panaraDialogType: PanaraDialogType.error,
        barrierDismissible: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 241, 240, 240),
              fontWeight: FontWeight.bold,
              fontFamily: 'PT Sans',
            ),
          ),
        ),
        backgroundColor: Color(0xff008fa0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _confirmAction(
                  'change the profile picture', _updateProfilePicture),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xff008fa0),
                backgroundImage: _imagePath.startsWith('assets/')
                    ? AssetImage(_imagePath) as ImageProvider<Object>?
                    : NetworkImage(_imagePath) as ImageProvider<Object>?,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Name: $_userName",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3b3b3b),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Email: $_userEmail",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3b3b3b),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: _editInformation,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xffd9d9d9),
                        width: 2.0,
                      ),
                      bottom: BorderSide(
                        color: Color(0xffd9d9d9),
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                          color: Color(0xff008fa0),
                          size: 25,
                        ),
                      ),
                      Text(
                        "Edit Information",
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          color: Color(0xff3b3b3b),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () async {
                  await getAndShowBookingDetails(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffd9d9d9),
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.book_online,
                          color: Color(0xff008fa0),
                          size: 25,
                        ),
                      ),
                      Text(
                        "my reservations",
                        style: TextStyle(
                          color: Color(0xff3b3b3b),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () => _confirmAction('delete', _deleteAccount),
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete,
                          color: Color(0xff008fa0),
                          size: 25,
                        ),
                      ),
                      Text(
                        "Delete my account",
                        style: TextStyle(
                          color: Color(0xff3b3b3b),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () => _confirmAction('logout', _logout),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffd9d9d9),
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons
                              .exit_to_app, // You can use a different icon if needed
                          color: Color(0xff008fa0),
                          size: 25,
                        ),
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Color(0xff3b3b3b),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
