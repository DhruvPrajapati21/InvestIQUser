import 'package:flutter/material.dart';
import 'package:user_invest_iq/Home.dart';

class Managenotifications extends StatefulWidget {
  @override
  State<Managenotifications> createState() => _ManagenotificationsState();
}

class _ManagenotificationsState extends State<Managenotifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5F9EA0),
          title: Text(
            "Manage Notifications",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: Icon(Icons.home, size: 25, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
