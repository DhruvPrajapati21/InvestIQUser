import 'package:flutter/material.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpcenter extends StatefulWidget {
  @override
  State<Helpcenter> createState() => _HelpcenterState();
}

class _HelpcenterState extends State<Helpcenter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5F9EA0),
          title: Text(
            "HelpCenter",
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Logo_Tranferent.png",height: 130,width: 130,),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Welcome to Invest-IQ App Help Center We are Creating a comprehensive help center for Invest-IQ covering various aspects such as intraday, IPOs (Initial Public Offerings), short-term, and long-term investments requires a structured approach. Here's a professional outline to guide your content creation.",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Frequently Asked Questions",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "1. Introduction",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 22,fontWeight: FontWeight.bold
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Brief overview of trading and investment.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Importance of having a well-thought-out strategy.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "2. Intraday Trading",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 22,fontWeight: FontWeight.bold
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Explanation of intraday trading and its characteristics.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Strategies for intraday trading:",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Scalping",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Momentum tradings",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Breakout trading",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Range-bound trading",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Risk management techniques for intraday trading.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Tools and resources for intraday traders.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Common mistakes to avoid.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "3. Short-term Trading",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 22,fontWeight: FontWeight.bold
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Definition and characteristics of short-term trading.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Short-term trading strategies:",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Swing trading",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Position trading",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Event-driven trading",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Technical analysis tools for short-term traders.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Managing risks in short-term trading.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Identifying short-term trading opportunities.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "4. Long-term Investing",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 22,fontWeight: FontWeight.bold
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Importance of long-term investing for wealth creation.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Principles of successful long-term investing:",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Diversification",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Asset allocation",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Fundamental analysis",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Patience",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Selecting quality stocks for long-term investment.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Building a robust long-term investment portfolio.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Monitoring and reviewing long-term investments.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "5. IPO Investing",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 22,fontWeight: FontWeight.bold
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ What are IPOs and how do they work?",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Factors to consider before investing in an IPO.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Evaluating IPO opportunities:",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Company fundamentals",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Industry analysis",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "‣ Market conditions",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Risks associated with IPO investing.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ Long-term potential of IPO investments.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Center(
                              child: Text(
                                " Help Center",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 22,fontWeight: FontWeight.bold
                                ),
                              ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "For personalized assistance or further inquiries, please don't hesitate to contact us:",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Mobile:",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,// Set text color to blue
                          ),
                        ),
                        SizedBox(width: 7),
                        GestureDetector(
                          onTap: () => _launchPhone("+918849373384"),
                          child: Text(
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
                        SizedBox(width: 10),
                        Text(
                          "Email-ID:",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,// Set text color to blue
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () => _launchEmail("chetanbhai.dhruv@gmail.com"),
                          child: Text(
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
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Our team of experts is ready to assist you with any questions or concerns you may have regarding trading strategies, market analysis, or investment advice.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14
                              ),
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
      ),
    );
  }
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
