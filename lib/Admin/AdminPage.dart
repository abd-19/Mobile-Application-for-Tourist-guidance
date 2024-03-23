// ignore_for_file: prefer_const_constructors, camel_case_types, unused_local_variable, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key});

  // Add a new method
  void addUser(BuildContext context) {
    // Logic to add a user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = '';
        String email = '';
        String password = '';

        return AlertDialog(
          title: Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Logic to add the user with the entered details
                // You can access the name, email, and password variables here
              },
              child: Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void deleteUser(BuildContext context, String email, String password) {
    // Logic to delete a user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Are you sure?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            // Logic to delete the user with the entered email and password
                            // You can access the email and password variables here
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Text('Yes'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Delete'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void searchUser(BuildContext context) {
    String email = '';
    String name = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (email.isNotEmpty) {
                  // Search by email
                  print('Searching user by email: $email');
                } else if (name.isNotEmpty) {
                  // Search by name
                  print('Searching user by name: $name');
                } else {
                  print('Please provide email or name to search for a user.');
                }
                Navigator.of(context).pop();
              },
              child: Text('Search'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => addUser(context),
              child: Text('Add User'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => deleteUser(context, '', ''),
              child: Text('Delete User'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => searchUser(context),
              child: Text('Search User'),
            ),
          ],
        ),
      ),
    );
  }
}
