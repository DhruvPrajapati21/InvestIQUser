import 'package:flutter/material.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:url_launcher/url_launcher.dart';
class Aboutus extends StatefulWidget {
  const Aboutus({super.key});


  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF5F9EA0),
            title: const Text(
              "About Us",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            // Ensure consistent height of the app bar across orientations
            // You can adjust the height according to your preference
            toolbarHeight: kToolbarHeight,
            actions: [
              IconButton(
                icon: const Icon(Icons.home, size: 25, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/Logo_Tranferent.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: Text(
                      "INVEST-IQ",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Color(hexColor('#5F9EA0')),
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Text("Developer Name:",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 17,fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text("Dhruv Chetanbhai Prajapati",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Text("Flutter Version:",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 17,fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 7,),
                        Text("2.10.0",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        const Text(
                          "Mobile:",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,// Set text color to blue
                          ),
                        ),
                        const SizedBox(width: 7),
                        GestureDetector(
                          onTap: () => _launchPhone("+918849373384"),
                          child: const Text(
                            "+91 8849373384",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              color: Colors.blue, // Set text color to blue// Add underline
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        const Text(
                          "Email-ID:",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,// Set text color to blue
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () => _launchEmail("chetanbhai.dhruv@gmail.com"),
                          child: const Text(
                            "chetanbhai.dhruv@gmail.com",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              color: Colors.blue, // Set text color to blue// Add underline
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Color(hexColor('#5F9EA0')),
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_right_outlined, size: 35),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Our Project Stocks suggestions for Intraday, Short Term, Long Term, IPO are available. This app provides free investment & trading ideas of intraday, long term, short term & IPO. Notification feature are in application when any new suggestion are updated in lists of various categories.",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  int hexColor(String color) {
    String newColor = '0xff$color';
    newColor = newColor.replaceAll('#', '');
    int finalcolor = int.parse(newColor);
    return finalcolor;
  }
_launchPhone(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// Function to launch email
_launchEmail(String emailAddress) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: emailAddress,
  );
  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}