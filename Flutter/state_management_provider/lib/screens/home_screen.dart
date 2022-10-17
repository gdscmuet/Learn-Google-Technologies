import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/user_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/AddUserScreen');
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount:
              Provider.of<UserData>(context).userList.length,
          itemBuilder: (context, index) {
            User user = Provider.of<UserData>(context).userList[index];
            return ListTile(
                trailing: IconButton(
                  onPressed: () {
                    Provider.of<UserData>(context, listen: false)
                        .deleteUser(user);
                  },
                  icon: const Icon(Icons.delete),
                ),
                title: Text('${user.name}'),
                subtitle: Text('${user.age}'),
    
            );
          }),
    );
  }
}
