import 'package:flutter/foundation.dart';
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
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Bottom navigation index
  int _selectedIndex = 0;
  bool _isExiting = false;
  final bool _debugLocked = true;

  final List<Widget> _pages = [
    HexagonWithCard(),
    Intraday(),
    Shortterm(),
    Longterm(),
    IPO(),
  ];

  // Function to handle bottom navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the corresponding page based on the selected index
    switch (index) {
      case 0:
      // Navigate to Home
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
        break;
      case 1:
      // Navigate to Intraday
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Intraday()));
        break;
      case 2:
      // Navigate to Shortterm
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Shortterm()));
        break;
      case 3:
      // Navigate to Longterm
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Longterm()));
        break;
      case 4:
      // Navigate to IPO
        Navigator.push(context, MaterialPageRoute(builder: (context) => const IPO()));
        break;
      default:
        break;
    }
  }


  Future<bool> _onBackPressed() async {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(context).pop();
      return false; // Do not exit the app
    } else {
      if (!_isExiting) {
        _isExiting = true;
        bool? exitConfirmed = await ExitConfirmationDialog.showExitDialog(context);
        _isExiting = false; // Reset flag after dialog is closed
        if (exitConfirmed ?? false) {
          // If user confirmed exit, pop all existing routes and exit the app
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
        return exitConfirmed ?? false;
      } else {
        return false;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _selectedIndex == 0 ? _buildAppBar() : null,
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
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
                  },
                ),
                const Divider(thickness: 2),
                ListTile(
                  leading: const Icon(Icons.access_time, size: 25),
                  title: const Text('Intraday'),
                  onTap: () {
                    Navigator.pop(context);
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
                    Navigator.pop(context);
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
                    Navigator.pop(context);
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
                  leading: const FaIcon(FontAwesomeIcons.chartLine, size: 25),
                  title: const Text('IPO'),
                  onTap: () {
                    Navigator.pop(context);
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
                    Navigator.pop(context);
                    Navigator.push(
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
                    Navigator.pop(context);
                    showLogoutConfirmationDialog(context);
                  },
                ),
                const Divider(thickness: 2),
              ],
            ),
          ),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:  Color(hexColor('#FFFAFA')),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: const Color(0xFF5F9EA0),
              icon: Icon(Icons.home),
              label: 'Home',
              activeIcon: Icon(Icons.home)),
            BottomNavigationBarItem(
              backgroundColor: const Color(0xFF5F9EA0),
              icon: Icon(Icons.access_time),
              label: 'Intraday',
            ),
            BottomNavigationBarItem(
              backgroundColor: const Color(0xFF5F9EA0),
              icon: Icon(FontAwesomeIcons.hourglass),
              label: 'Short Term',
            ),
            BottomNavigationBarItem(
              backgroundColor: const Color(0xFF5F9EA0),
              icon: Icon(Icons.timeline_sharp),
              label: 'Long Term',
            ),
            BottomNavigationBarItem(
              backgroundColor: const Color(0xFF5F9EA0),
              icon: FaIcon(FontAwesomeIcons.chartLine),
              label: 'IPO',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  PreferredSizeWidget?  _buildAppBar() {
    return AppBar(
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
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
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
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('_debugLocked', _debugLocked));
  }
}

class HexagonWithCard extends StatelessWidget {
  const HexagonWithCard({Key? key});

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
                  color: Color(hexColor('#B0C4DE')),
                  width: 160,
                  height: 160,
                  child: Image.asset("assets/images/zx.png"),
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
                              child: SvgPicture.asset(
                                "assets/images/s9.svg",
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
                          return SizedBox();
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
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward,
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
                              child: SvgPicture.asset(
                                "assets/images/t2.svg",
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
                          return SizedBox();
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
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward,
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
                              child: SvgPicture.asset(
                                "assets/images/z7.svg",
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
                          return SizedBox();
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
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward,
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
                              child: SvgPicture.asset(
                                "assets/images/z4.svg",
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
                          return SizedBox();
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
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const IPO(),
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
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width, size.height * 3 / 4);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height * 3 / 4);
    path.lineTo(0, size.height / 4);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

int hexColor(String colorCode) {
  String colorNew = '0xff' + colorCode;
  colorNew = colorNew.replaceAll('#', '');
  int colorInt = int.parse(colorNew);
  return colorInt;
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