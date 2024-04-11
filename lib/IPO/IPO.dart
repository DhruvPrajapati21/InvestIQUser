import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:user_invest_iq/IPO/IPOModel.dart';
import 'package:user_invest_iq/IntraDay/IntrdayModel.dart';

class IPO extends StatefulWidget {
  const IPO({super.key});

  @override
  State<IPO> createState() => _IPOState();
}

class _IPOState extends State<IPO> {
  late TextEditingController searchController;
  List<bool> isSelected = [true, false, false];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5F9EA0),
        title: Text(
          "IP",
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
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {}); // Trigger rebuild on text change
                          },
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search_outlined),
                            labelText: 'Search by IPO Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ToggleButtons(
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        isSelected[buttonIndex] = buttonIndex == index;
                      }
                    });
                  },
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text('All'),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text('Current'),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text('Upcoming'),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                  // color: Colors.black, // Color for unselected text
                  selectedColor: Colors.white, // Color for selected text
                  fillColor:
                      Color(hexColor('#5F9EA0')), // Color for selected chip
                  selectedBorderColor: Color(
                      hexColor('#5F9EA0')), // Border color for selected chip
                  borderRadius:
                      BorderRadius.circular(5), // Border radius for chips
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 5),
                  Text(
                    "IPO Stocklist",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('IPO').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No data available'));
                  }
                  final data = snapshot.data!;

                  List<IPOModel> stocks = snapshot.data!.docs
                      .map((doc) => IPOModel.fromSnapshot(doc))
                      .toList();
                  if (searchController.text.isNotEmpty) {
                    stocks = stocks.where((stock) {
                      final stockName = stock.stockName.toLowerCase();
                      final searchQuery = searchController.text.toLowerCase();
                      return stockName.contains(searchQuery);
                    }).toList();
                  }
                  if (isSelected[1]) {
                    // If "Current" is selected
                    stocks = stocks
                        .where((stock) => stock.status == 'Current')
                        .toList();
                  } else if (isSelected[2]) {
                    // If "Upcoming" is selected
                    stocks = stocks
                        .where((stock) => stock.status == 'Upcoming')
                        .toList();
                  }

                  // Apply search filter
                  if (searchController.text.isNotEmpty) {
                    stocks = stocks.where((stock) {
                      final stockName = stock.stockName.toLowerCase();
                      final searchQuery = searchController.text.toLowerCase();
                      return stockName.contains(searchQuery);
                    }).toList();
                  }
                  if (stocks.isEmpty) {
                    return Center(child: Text('No Data Found!'));
                  }
                  return Column(
                    children: [
                      Text('Available IPO: ${stocks.length}'),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index >= 0 && index < stocks.length) {
                            var IPOModel = stocks[index];
                            // Color slColor =
                            //     Colors.black; // Default color for SL
                            // Color remarkColor = Colors.black;
                            // Color statusColor =
                            //     Colors.black; // Default color for Remark

                            // Setting colors based on Status
                            return Card(
                              surfaceTintColor: Color(hexColor('#FFFFFF')),
                              // color: Color(hexColor('#FFFFFF')),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 16.0,
                              margin: EdgeInsets.all(10.0),
                              // shadowColor: Color(hexColor('#FFFFFF')),
                              child: Column(
                                children: [
                                  ListTile(
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' ${IPOModel.stockName}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 26,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.monetization_on,
                                                size: 15, color: Colors.green),
                                            SizedBox(width: 6),
                                            Text(
                                              'Lot: ',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                            Text(
                                              '${IPOModel.lot}',
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            ),
                                            // Spacer(flex: 2),
                                            // Card(
                                            //   surfaceTintColor:
                                            //       Color(hexColor('#FFFFFF')),
                                            //   elevation: 8.0,
                                            //   shadowColor:
                                            //       Color(hexColor('#FFFFFF')),
                                            //   shape: RoundedRectangleBorder(
                                            //     borderRadius:
                                            //         BorderRadius.circular(
                                            //             5.0),
                                            //     side: BorderSide(
                                            //         color: Colors.black,
                                            //         width: 1.0),
                                            //   ),
                                            //   margin: EdgeInsets.all(10.0),
                                            //   child: Image.asset(
                                            //     'assets/images/Logo.png',
                                            //     height: 70,
                                            //     width: 70,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              size: 15,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              'Price:',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                            Text(
                                              ' ${IPOModel.price}',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 15,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Opening Date: ',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                            Text(
                                              ' ${IPOModel.opendate}',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 15,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Closing Date: ',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.green,
                                              ),
                                            ),
                                            Text(
                                              ' ${IPOModel.closedate}',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            SizedBox(width: 10), // Add space between the texts
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 63,
                                                  height: 95,
                                                  color: Colors.blue,
                                                ),
                                                Positioned(
                                                  right: 5,
                                                  top: 5,
                                                  child: Text(
                                                    'New',
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.lightbulb,
                                              size: 15,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              ' Remark: ',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.green),
                                            ),
                                            Text(
                                              ' ${IPOModel.remark}',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Spacer(flex: 2),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ]),
          ),
        );
      }),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalcolor = int.parse(newColor);
  return finalcolor;
}
