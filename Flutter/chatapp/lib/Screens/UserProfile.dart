import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void imagePicker() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    final photo = await _picker.pickImage(source: ImageSource.camera);
    final images = await _picker.pickMultiImage(); 

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Profile"),
      ),
      body: Center(
        child: Container(
            width: 100,
            height: 100,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      imagePicker();
                    },
                    child: Text("Up image"))
              ],
            )),
      ),
    );
  }
}
