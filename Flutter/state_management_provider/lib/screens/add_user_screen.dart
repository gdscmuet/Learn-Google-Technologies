import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/models/user.dart';
import 'package:state_management_provider/provider/user_data.dart';

class AddUserScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 0.7 * MediaQuery.of(context).size.width,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(label: Text('Name')),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 0.7 * MediaQuery.of(context).size.width,
              child: TextField(
                controller: ageController,
                decoration: const InputDecoration(label: Text('Age')),
              ),
            ),
            const SizedBox(
              height: 30,
              width: double.infinity,
            ),
            TextButton(
                onPressed: () {
                  UserData userData =
                      Provider.of<UserData>(context, listen: false);
                  User user = User(
                      name: nameController.text,
                      age: ageController.text,
                      id: userData.userList.length + 1);
                  userData.addUser(user);
                  Navigator.pushNamed(context, '/');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Add'))
          ]),
    );
  }
}
