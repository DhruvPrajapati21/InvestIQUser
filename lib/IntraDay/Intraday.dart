import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:user_invest_iq/IntraDay/IntrdayModel.dart';

class Intraday extends StatefulWidget {
  const Intraday({Key? key}) : super(key: key);

  @override
  State<Intraday> createState() => _IntradayState();
}

class _IntradayState extends State<Intraday> {
  List<String> ipo = ['All', 'Achieved', 'Active', 'SL Hit'];
  String? selectedFilter = 'All';
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  Future<String?> getImageUrlFromFirebase(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('Stocks').doc(documentId).get();
      return documentSnapshot.get('imageUrl');
    } catch (e) {
      print('Error fetching image URL: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5F9EA0),
        title: Text(
          "IntraDay",
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
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: searchController,
                              onChanged: (value) {
                                setState(() {});
                              },
                              style: const TextStyle(fontSize: 16),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search_outlined),
                                labelText: 'Search by Stocks..',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                            child: DropdownButton<String>(
                              value: selectedFilter,
                              items: ipo
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                  ),
                                ),
                              )
                                  .toList(),
                              onChanged: (item) =>
                                  setState(() => selectedFilter = item),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 5),
                      Text(
                        "IntraDay Stocklist",
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No data available'));
                      }
                      final data = snapshot.data!;

                      List<IntradayModel> stocks = snapshot.data!.docs
                          .map((doc) => IntradayModel.fromSnapshot(doc))
                          .toList();
                      if (searchController.text.isNotEmpty) {
                        stocks = stocks.where((stock) {
                          final stockName = stock.stockName.toLowerCase();
                          final searchQuery =
                          searchController.text.toLowerCase();
                          return stockName.contains(searchQuery);
                        }).toList();
                      }
                      if (selectedFilter != 'All') {
                        stocks = stocks
                            .where((stock) => stock.status == selectedFilter)
                            .toList();
                      }
                      if (stocks.isEmpty) {
                        return Center(child: Text('No Data Found!'));
                      }
                      return Column(
                        children: [
                          Text('Available IntraDay: ${stocks.length}'),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: stocks.length,
                            itemBuilder: (BuildContext context, int index) {
                              var IntradayModel = stocks[index];
                              Color slColor = Colors.black;
                              Color remarkColor = Colors.black;
                              Color statusColor = Colors.black;

                              if (IntradayModel.status == 'Active' ||
                                  IntradayModel.status == 'Achieved') {
                                slColor = Colors.green;
                                remarkColor = Colors.green;
                                statusColor = Colors.green;
                              } else if (IntradayModel.status == 'SL Hit') {
                                slColor = Colors.red;
                                remarkColor = Colors.red;
                                statusColor = Colors.red;
                              }
                              return Card(
                                surfaceTintColor:
                                Color(hexColor('#FFFFFF')),
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 16.0,
                                margin: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          elevation: 8.0,
                                          shadowColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(60.0),
                                            side: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          margin: EdgeInsets.all(10.0),
                                          child: FutureBuilder<String?>(
                                            future: getImageUrlFromFirebase(
                                                snapshot.data!.docs[index].id),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator(color: Colors.white,);
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else {
                                                String imageUrl =
                                                    snapshot.data ?? '';
                                                if (imageUrl.isEmpty) {
                                                  return Text(
                                                      'No image URL available');
                                                }
                                                return CircleAvatar(
                                                  radius: 60,
                                                  backgroundColor:
                                                  Colors.transparent,
                                                  backgroundImage:
                                                  NetworkImage(imageUrl),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListTile(
                                      subtitle: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ' ${IntradayModel.stockName}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 26,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Status: ',
                                                style: TextStyle(
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                '${IntradayModel.status}',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: statusColor),
                                              ),
                                              Spacer(
                                                flex: 15,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Target: ₹${IntradayModel.target}',
                                                style: TextStyle(
                                                    fontSize: 17),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'CMP: ₹${IntradayModel.cmp}',
                                                style: TextStyle(
                                                    fontSize: 17),
                                              ),
                                              Spacer(
                                                flex: 15,
                                              ),
                                              Text('SL:',
                                                  style: TextStyle(
                                                      fontSize: 17)),
                                              Icon(Icons.currency_rupee,
                                                  size: 17, color: slColor),
                                              Text('${IntradayModel.sl}',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: slColor)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Date: ${IntradayModel.date}',
                                                style: TextStyle(
                                                    fontSize: 17),
                                              ),
                                              Spacer(
                                                flex: 15,
                                              ),
                                              Text('Remarks: ',
                                                  style: TextStyle(
                                                      fontSize: 17)),
                                              Text(
                                                '${IntradayModel.remark}',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: remarkColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
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
