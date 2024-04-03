import 'package:flutter/material.dart';
import 'package:user_invest_iq/Home.dart';

class Freeguildlines extends StatefulWidget {
  const Freeguildlines({super.key});

  @override
  State<Freeguildlines> createState() => _FreeguildlinesState();
}

class _FreeguildlinesState extends State<Freeguildlines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5F9EA0),
        title: Text(
          "Guildlines",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
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
    );
  }
}
