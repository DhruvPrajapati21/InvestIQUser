import 'package:flutter/material.dart';
import 'package:user_invest_iq/AuthView/Login.dart';
import 'package:user_invest_iq/Home.dart';

import 'Splashscreen.dart';

class Enteredscreen extends StatefulWidget {
  const Enteredscreen({super.key});

  @override
  State<Enteredscreen> createState() => _EnteredscreenState();
}

class _EnteredscreenState extends State<Enteredscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "INVEST-IQ",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color(hexColor('#5F9EA0')),
                  fontSize: 25,
                ),
              ),
              Text(
                "Changing the way Invest-IQ is Delivered",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 20),
              Image.asset("assets/images/Logo_Tranferent.png"),
              SizedBox(height: 20),
              Text(
                "Title",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color(hexColor('#5F9EA0')),
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 8),
              Image.asset("assets/images/d1.png"),
              SizedBox(height: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Invest-IQ: diversify portfolio"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text("set stop-loss orders, research before"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text("trading, and prioritize risk management"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text("for success."),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(hexColor('#5F9EA0')),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "GET STARTED",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 9,),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/hj1.png", height: MediaQuery.of(context).size.height * 0.2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalcolor = int.parse(newColor);
  return finalcolor;
}
