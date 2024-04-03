import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:user_invest_iq/Settings/Aboutus.dart';
import 'package:user_invest_iq/Settings/Disclaimer.dart';
import 'package:user_invest_iq/Settings/Helpcenter.dart';
import 'package:user_invest_iq/Settings/Managenotifications.dart';
import 'package:user_invest_iq/Settings/Privacypolicy.dart';
import 'package:user_invest_iq/Settings/Termsofuse.dart';
import '../Provider.dart';

class Settings1 extends StatefulWidget {
  const Settings1({super.key});

  @override
  State<Settings1> createState() => _Settings1State();
}

class _Settings1State extends State<Settings1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5F9EA0),
        title: Text(
          "Settings",
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: double.infinity, // Set width to occupy available space
                      child: Consumer<ThemeProvider>(
                        builder: (context, themeProvider, child) => Container(
                          height: 60, // Set the width of the inner container
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: Theme.of(context).textTheme.bodyText1!.color!,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            color: themeProvider.currentTheme == ThemeData.dark() ? Colors.black : Colors.white,
                            // Set container color based on theme
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          Text(
                            'Change Your Theme Color',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(), // Add Spacer to push the icon to the end
                          Icon(Icons.sunny_snowing),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  Text("Account Settings",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,))
                ],
              ),
              SizedBox(height:15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutus()));
                  },
                  child: Container(
                    width: double.infinity, // Set width to occupy available space
                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) => Container(
                        height: 60, // Set the width of the inner container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: themeProvider.currentTheme == ThemeData.dark() ? Colors.black : Colors.white,
                          // Set container color based on theme
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Icon(Icons.info),
                            SizedBox(width: 10),
                            Text(
                              'About Us',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Spacer(), // Add Spacer to push the icon to the end
                            Icon(Icons.arrow_forward_ios),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1-0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Managenotifications()));
                  },
                  child: Container(
                    width: double.infinity, // Set width to occupy available space
                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) => Container(
                        height: 60, // Set the width of the inner container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: themeProvider.currentTheme == ThemeData.dark() ? Colors.black : Colors.white,
                          // Set container color based on theme
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.notifications),
                        SizedBox(width: 10,),
                        Text(
                          'Manage Notifications',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(), // Add Spacer to push the icon to the end
                        Icon(Icons.arrow_forward_ios),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  Text("Feedback & Information",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,))
                ],
              ),
              SizedBox(height:15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Termsofuse()));
                  },
                  child: Container(
                    width: double.infinity, // Set width to occupy available space
                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) => Container(
                        height: 60, // Set the width of the inner container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: themeProvider.currentTheme == ThemeData.dark() ? Colors.black : Colors.white,
                          // Set container color based on theme
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.insert_drive_file_rounded),
                        SizedBox(width: 10,),
                        Text(
                          'Terms Of Use',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(), // Add Spacer to push the icon to the end
                        Icon(Icons.arrow_forward_ios),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ),
              ),
              ),
              SizedBox(height: 1-0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Privacypolicy()));
                  },
                child: Container(
                  width: double.infinity, // Set width to occupy available space
                  child: Container(
                    width: double.infinity, // Set width to occupy available space
                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) => Container(
                        height: 60, // Set the width of the inner container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: themeProvider.currentTheme == ThemeData.dark() ? Colors.black : Colors.white,
                          // Set container color based on theme
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.policy),
                        SizedBox(width: 10,),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(), // Add Spacer to push the icon to the end
                        Icon(Icons.arrow_forward_ios),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
                ),
              ),
              SizedBox(height: 1-0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Disclaimer()));
                  },
                  child: Container(
                    width: double.infinity, // Set width to occupy available space
                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) => Container(
                        height: 60, // Set the width of the inner container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: themeProvider.currentTheme == ThemeData.dark() ? Colors.black : Colors.white,
                          // Set container color based on theme
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.announcement),
                        SizedBox(width: 10,),
                        Text(
                          'Disclaimer',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(), // Add Spacer to push the icon to the end
                        Icon(Icons.arrow_forward_ios),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
              ),
              SizedBox(height: 1-0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Helpcenter()));
                  },
                child: Container(
                  width: double.infinity, // Set width to occupy available space
                  child: Container(
                    width: double.infinity, // Set width to occupy available space
                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) => Container(
                        height: 60, // Set the width of the inner container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: themeProvider.currentTheme == ThemeData.dark() ? Colors.black : Colors.white,
                          // Set container color based on theme
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.help_outlined),
                        SizedBox(width: 10,),
                        Text(
                          'Help Center',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(), // Add Spacer to push the icon to the end
                        Icon(Icons.arrow_forward_ios),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}