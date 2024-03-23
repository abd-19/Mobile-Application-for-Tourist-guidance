// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, unused_field, camel_case_types, unused_import, deprecated_member_use, sort_child_properties_last, unused_element

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class PostPage extends StatelessWidget {
  final CollectionReference shareCollection =
      FirebaseFirestore.instance.collection('share');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Share Space',
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
      body: StreamBuilder<QuerySnapshot>(
        stream: shareCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var post = snapshot.data!.docs[index];
              return PostCard(post: post);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddImagePage()),
            );
          },
          tooltip: 'Add Image',
          child: Icon(
            Icons.add_photo_alternate_rounded,
            color: Colors.white,
            size: 30,
          ),
          backgroundColor: Color(0xff008fa0)),
    );
  }
}

class PostCard extends StatefulWidget {
  final DocumentSnapshot post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool hasLiked = false;
  int likes = 0;

  @override
  void initState() {
    super.initState();
    likes = widget.post['likes'] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                widget.post['imageUrl'],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post['description'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Posted by: ${widget.post['username']}',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              hasLiked ? Icons.favorite : Icons.favorite_border,
                              color: hasLiked ? Colors.red : null,
                            ),
                            onPressed: _toggleLike,
                          ),
                          Text('$likes Likes')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleLike() async {
    try {
      final postId = widget.post.id;

      if (hasLiked) {
        await FirebaseFirestore.instance
            .collection('share')
            .doc(postId)
            .update({'likes': FieldValue.increment(-1)});
        setState(() {
          likes--;
          hasLiked = false;
        });
      } else {
        await FirebaseFirestore.instance
            .collection('share')
            .doc(postId)
            .update({'likes': FieldValue.increment(1)});
        setState(() {
          likes++;
          hasLiked = true;
        });
      }
    } catch (e) {
      print('Error toggling like: $e');
    }
  }
}

class AddImagePage extends StatefulWidget {
  @override
  _AddImagePageState createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  final CollectionReference shareCollection =
      FirebaseFirestore.instance.collection('share');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Post your moment ',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _image == null
                  ? Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : Image.file(_image!),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  _pickImage();
                },
                icon: Icon(Icons.image, color: Colors.white),
                label: Text('Select Image',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff008fa0),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  _showCancelDialog(context);
                },
                icon: Icon(Icons.cancel, color: Colors.white),
                label: Text('Cancel',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  await _uploadImageAndAddData();
                },
                icon: Icon(Icons.add, color: Colors.white),
                label: Text('Post Image',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff008fa0),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'images/post-it-with-a-heart-svgrepo-com.png',
                  height: 270,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showCancelDialog(BuildContext context) async {
    PanaraConfirmDialog.show(
      context,
      title: 'Confirm Cancel',
      message: 'Are you sure you want to Cancel?',
      confirmButtonText: 'yes',
      cancelButtonText: 'no',
      onTapCancel: () {
        Navigator.pop(context);
      },
      onTapConfirm: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: true,
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImageAndAddData() async {
    try {
      showLoading();

      String imageUrl = await _uploadImageToStorage();
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        String userName = userSnapshot['First name'];

        await shareCollection.add({
          'imageUrl': imageUrl,
          'description': _descriptionController.text,
          'userId': user.uid,
          'username': userName,
          'likes': 0,
        });
      }

      hideLoading();

      Navigator.pop(context);
    } catch (e) {
      print('Error uploading image: $e');
      hideLoading();
    }
  }

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void hideLoading() {
    Navigator.pop(context);
  }

  Future<String> _uploadImageToStorage() async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = _storage.ref().child('images').child(fileName);
      UploadTask uploadTask = reference.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading image to storage: $e');
      rethrow;
    }
  }
}
