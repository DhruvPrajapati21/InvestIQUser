import 'package:flutter/material.dart';
import 'package:user_invest_iq/AuthView/Login.dart';
import 'package:user_invest_iq/IntraDay/Intraday.dart';
import 'package:user_invest_iq/Longterm/Longterm.dart';
import 'package:user_invest_iq/Shortterm/Shortterm.dart';
import 'package:user_invest_iq/IPO/IPO.dart';
import 'package:user_invest_iq/Settings/Settings.dart';
import 'package:user_invest_iq/Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<bool> _onBackPressed() async {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      // If drawer is open, close it
      Navigator.of(context).pop();
      return false; // Do not exit the app
    } else {
      // Show exit confirmation dialog
      bool? exitConfirmed = await ExitConfirmationDialog.showExitDialog(context);
      return exitConfirmed ?? false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFF5F9EA0),
          title: const Text(
            "Home",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white), // Menu icon
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: SizedBox(
          width: 220,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(color: Color(0xFF5F9EA0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                        backgroundImage:
                        AssetImage('assets/images/Logo.png'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home_outlined, size: 27),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                  },
                ),
                const Divider(thickness: 2),
                ListTile(
                  leading: const Icon(Icons.access_time, size: 25),
                  title: const Text('Intraday'),
                  onTap: () {
                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Intraday(),
                      ),
                    );
                  },
                ),
                const Divider(thickness: 2),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.hourglass, size: 25),
                  title: const Text('Short Term'),
                  onTap: () {
                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Shortterm(),
                      ),
                    );
                  },
                ),
                const Divider(thickness: 2),
                ListTile(
                  leading: const Icon(Icons.timeline_sharp, size: 25),
                  title: const Text('Long Term'),
                  onTap: () {
                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Longterm(),
                      ),
                    );
                  },
                ),
                const Divider(thickness: 2),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.chartLine, size: 25),
                  title: const Text('IPO'),
                  onTap: () {
                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IPO(),
                      ),
                    );
                  },
                ),
                const Divider(thickness: 2),
                ListTile(
                  leading: const Icon(Icons.settings, size: 25),
                  title: const Text("Settings"),
                  onTap: () {
                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settings1(),
                      ),
                    );
                  },
                ),
                const Divider(thickness: 2),
                ListTile(
                  leading: const Icon(Icons.sunny_snowing, size: 25),
                  title: const Text("Theme"),
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                const Divider(thickness: 2),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, size: 25),
                  title: const Text("Logout"),
                  onTap: () {
                    showLogoutConfirmationDialog(context);
                  },
                ),
                const Divider(thickness: 2),
              ],
            ),
          ),
        ),
        body: HexagonWithCard(),
      ),
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Logout Invest-IQ?",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
          content: const Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                      (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class HexagonWithCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ClipPath(
                clipper: HexagonClipper(),
                child: Container(
                  child: Image.asset("assets/images/zx.png"),
                  color: Color(hexColor('#B0C4DE')),
                  width: 160,
                  height: 160,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Intraday(), // Navigate to IPO Page
                  ),
                );
              },
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 13),
                color: Color(hexColor('#5F9EA0')),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Color(hexColor('#FFFAFA')),
                              child: Image.asset(
                                "assets/images/s3.png",
                                fit: BoxFit.scaleDown,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'IntraDay',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Stocks')
                          .where('category', isEqualTo: 'IntraDay')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        final data = snapshot.data!;
                        List<DocumentSnapshot> documents = data.docs;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Available IntraDay: ${documents.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const Intraday(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Shortterm(), // Navigate to IPO Page
                  ),
                );
              },
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 13),
                color: Color(hexColor('#5F9EA0')),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Color(hexColor('#FFFAFA')),
                              child: Image.asset(
                                "assets/images/s1.png",
                                fit: BoxFit.scaleDown,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'ShortTerm',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Stocks')
                          .where('category', isEqualTo: 'Short Term')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        final data = snapshot.data!;
                        List<DocumentSnapshot> documents = data.docs;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Available ShortTerm: ${documents.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const Shortterm(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Longterm(), // Navigate to IPO Page
                  ),
                );
              },
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 13),
                color: Color(hexColor('#5F9EA0')),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Color(hexColor('#FFFAFA')),
                              child: Image.asset(
                                "assets/images/h1.png",
                                fit: BoxFit.scaleDown,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'LongTerm',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Stocks')
                          .where('category', isEqualTo: 'Long Term')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        final data = snapshot.data!;
                        List<DocumentSnapshot> documents = data.docs;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Available LongTerm: ${documents.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const Longterm(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IPO(), // Navigate to IPO Page
                  ),
                );
              },
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 13),
                color: Color(hexColor('#5F9EA0')),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Color(hexColor('#FFFAFA')),
                              child: Image.asset(
                                "assets/images/a4.png",
                                fit: BoxFit.scaleDown,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'IPO',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('IPO')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        final data = snapshot.data!;
                        List<DocumentSnapshot> documents = data.docs;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Available IPO: ${documents.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const IPO(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.25, 0);
    path.lineTo(size.width * 0.75, 0);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(size.width * 0.25, size.height);
    path.lineTo(0, size.height * 0.75);
    path.lineTo(0, size.height * 0.25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalcolor = int.parse(newColor);
  return finalcolor;
}

class ExitConfirmationDialog {
  static Future<bool?> showExitDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Exit Invest-IQ?',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
        content: const Text(
          'Are you sure you want to exit?',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(false); // Return false to indicate user canceled exit
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(true); // Return true to indicate user confirmed exit
            },
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }
}
