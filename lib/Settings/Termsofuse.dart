import 'package:flutter/material.dart';
import 'package:user_invest_iq/Home.dart';

class Termsofuse extends StatefulWidget {
  @override
  State<Termsofuse> createState() => _TermsofuseState();
}

class _TermsofuseState extends State<Termsofuse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5F9EA0),
          title: Text(
            "TermsOfUse",
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Welcome to our Invest-IQ project! Before using our services, please carefully read these Terms of Use. By accessing or using our website or any of our services, you agree to comply with and be bound by these terms. If you do not agree with any part of these terms, you may not use our services.",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
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
                              "1. Acceptance of Terms",
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
                              "‣ By accessing or using our services, you agree to be bound by these Terms of Use, including any additional terms and conditions and policies referenced herein.",
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
                              "‣ These terms apply to all users of our App and services, including users who are contributors of content, information, and other materials.",
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
                              "2. Description of Services",
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
                              "‣ Our Invest-IQ project provides information and recommendations for intraday trading, short term investments, long term investments, and IPO (Initial Public Offering) opportunities.",
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
                              "‣ This information is provided for educational and informational purposes only and should not be considered as financial advice.",
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
                              "‣ Users are solely responsible for their investment decisions.",
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
                              "3. User Conduct",
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
                              "‣ You agree to use our services only for lawful purposes and in accordance with these Terms of Use.",
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
                              "‣ You may not engage in any activity that interferes with or disrupts the functioning of our App or services, or that infringes upon the rights of others.",
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
                              "‣ You also agree not to use our services to distribute spam, viruses, or other harmful or disruptive content.",
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
                              "4. Intellectual Property",
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
                              "‣ All content, information, and materials provided through our services, including but not limited to text, graphics, logos, images, and software, are the property of our Invest-IQ project or its licensors and are protected by copyright, trademark, and other intellectual property laws.",
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
                              "5. Disclaimer of Warranties",
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
                              "‣ Our Invest-IQ project provides information and recommendations on an as is and as available basis, without any warranties or representations of any kind, express or implied.",
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
                              "‣ We do not guarantee the accuracy, completeness, or reliability of any information provided through our services.",
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
                              "6. Limitation of Liability",
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
                              "‣ To the fullest extent permitted by law, our Invest-IQ project shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use of our services, including but not limited to damages for loss of profits, goodwill, use, or data.",
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
                              "7. Changes to Terms of Use",
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
                              "‣ We reserve the right to modify or update these Terms of Use at any time without prior notice.",
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
                              "‣ Any changes will be effective immediately upon posting to our website. It is your responsibility to review these terms periodically for changes. ",
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
                              "‣ Your continued use of our services after any modifications indicates your acceptance of the updated terms.",
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
                              "8. Governing Law",
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
                              "‣ These Terms of Use shall be governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflicts of law provisions. ",
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
                              "‣ Any dispute arising out of or relating to these terms shall be exclusively resolved by the courts of [Your Jurisdiction]. ",
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
