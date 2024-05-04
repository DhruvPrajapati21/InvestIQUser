import 'package:flutter/material.dart';
import 'package:user_invest_iq/Home.dart';

class Privacypolicy extends StatefulWidget {
  @override
  State<Privacypolicy> createState() => _PrivacypolicyState();
}

class _PrivacypolicyState extends State<Privacypolicy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF5F9EA0),
          title: const Text(
            "PrivacyPolicy",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: const Icon(Icons.home, size: 25, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
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
                  const SizedBox(height: 25,),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "Effective Date: 06/01/2024",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Invest-IQ respects the privacy of its users and is committed to protecting their personal information. This Privacy Policy outlines how we collect, use, and safeguard your personal data when you use our Invest-IQ project for intraday, short-term, long-term, and IPO services.",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ),
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
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "1. Information We Collect",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "1.1 Personal Information",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ We may collect personal information such as your name, email address, phone number, and any other information you provide when you sign up for our services or interact with our platform.",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "1.2 Trading Data",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ We may collect information about your trading activities, including transaction history, preferences, and trading patterns.",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "2. How We Use Your Information",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "2.1 Providing Services",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ We use your personal information to provide you with the Invest-IQ services you request, including delivering relevant content and recommendations.",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "2.2 Communication",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ We may use your contact information to communicate with you about our services, updates, promotions, and other relevant information.",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "2.3 Improving Services",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ We analyze user data to improve our services, enhance user experience, and develop new features.",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "2.4 Legal Compliance",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ We may use your information to comply with legal obligations, enforce our terms of service, and protect our rights and interests.",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "3. Third-Party Services",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ We may use third-party service providers to facilitate our services or perform service-related functions. These providers have access to your personal information only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "4. Your Rights",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ You have the right to access, update, or delete your personal information. You may also object to the processing of your personal data or request that we restrict certain processing activities.",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "5. Changes to this Privacy Policy",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "‣ We reserve the right to update or modify this Privacy Policy at any time. Any changes will be effective immediately upon posting the updated Privacy Policy on our website. We encourage you to review this Privacy Policy periodically for any changes.",
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
