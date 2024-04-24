// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:user_invest_iq/AuthView/Login.dart';
// import 'package:user_invest_iq/AuthView/Enteredscreen.dart';
// User? user = FirebaseAuth.instance.currentUser;
// class Spalashscreen extends StatefulWidget {
//   const Spalashscreen({super.key});
//
//   @override
//   State<Spalashscreen> createState() => _SpalashscreenState();
//
// }
//
// class _SpalashscreenState extends State<Spalashscreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 4 ),checkingTheSavedData
//     );
//   }
//   void checkingTheSavedData() async {
//
//     // print("user.....${user}");
//     if (user == null) {
//       // print("object........$user");
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const Login()),
//       );
//     } else {
//       print("user found");
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => const Enteredscreen()));
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       Center(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 150),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("assets/images/Logo_Tranferent.png",),
//               SizedBox(width: 20,height: 20,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(onPressed: (){
//
//                   }, child: Text("Welcome To Invest-IQ!",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 26,color: Color(hexColor('#5F9EA0')),),)),
//                   SizedBox(width: 10,height: 10,),
//                 ],
//               ),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(onPressed: (){
//
//                   }, child: Text("Let's Navigate the Markets Together for Profitable Trades!!",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 12,color: Color(hexColor('#5F9EA0')),),)),
//                 ],
//               ),
//               CircularProgressIndicator(),
//               SizedBox(width: 50,height: 50,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// int hexColor(String color) {
//   String newColor = '0xff' + color;
//   newColor = newColor.replaceAll('#', '');
//   int finalcolor = int.parse(newColor);
//   return finalcolor;
// }
//
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_invest_iq/AuthView/Login.dart';
import 'package:user_invest_iq/AuthView/Enteredscreen.dart';

User? user = FirebaseAuth.instance.currentUser;

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), checkingTheSavedData);
  }

  void checkingTheSavedData() async {
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } else {
      print("User found");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Enteredscreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.redAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Logo_Tranferent.png"),
                SizedBox(width: 20, height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Welcome To Invest-IQ!",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10, height: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Let's Navigate the Markets Together for Profitable Trades!!",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                CircularProgressIndicator(color: Colors.white,),
                SizedBox(width: 50, height: 50),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
