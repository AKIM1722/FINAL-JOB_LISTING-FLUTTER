import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Mika Laruga";
  String email = "jvakimpark14@gmail.com";
  String phone = "+1 234 567 890";
  String address = "Cabulijan, Tubigon, Bohol";

  // Dialog for editing text fields
  void _editField(String field) {
    TextEditingController controller;
    String currentValue;

    switch (field) {
      case 'name':
        controller = TextEditingController(text: name);
        currentValue = name;
        break;
      case 'email':
        controller = TextEditingController(text: email);
        currentValue = email;
        break;
      case 'phone':
        controller = TextEditingController(text: phone);
        currentValue = phone;
        break;
      case 'address':
        controller = TextEditingController(text: address);
        currentValue = address;
        break;
      default:
        return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $field', style: TextStyle(color: Colors.blue)),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter new $field',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (field == 'name') {
                    name = controller.text;
                  } else if (field == 'email') {
                    email = controller.text;
                  } else if (field == 'phone') {
                    phone = controller.text;
                  } else if (field == 'address') {
                    address = controller.text;
                  }
                });
                Navigator.pop(context);
              },
              child: Text('Save', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 183, 226, 255), // Background color of the page
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blue, // App bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture with border color
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/me.jpg'),
                backgroundColor: Colors.blue, // Border color of avatar
              ),
            ),
            SizedBox(height: 20),

            // Name Row with color
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Name: $name', style: TextStyle(fontSize: 18, color: Colors.black)),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _editField('name'),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Email Row with color
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email: $email', style: TextStyle(fontSize: 18, color: Colors.black)),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _editField('email'),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Phone Row with color
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Phone: $phone', style: TextStyle(fontSize: 18, color: Colors.black)),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _editField('phone'),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Address Row with color
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Address: $address', style: TextStyle(fontSize: 18, color: Colors.black)),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _editField('address'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
