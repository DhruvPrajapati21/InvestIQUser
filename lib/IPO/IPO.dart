import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:user_invest_iq/IPO/IPOModel.dart';

class IPO extends StatefulWidget {
  const IPO({Key? key}) : super(key: key);

  @override
  State<IPO> createState() => _IPOState();
}

class _IPOState extends State<IPO> {
  late TextEditingController searchController;
  List<bool> isSelected = [true, false, false];
  Map<String, String?> imageCache = {}; // Stores image URLs for each stock ID

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  Future<String?> getImageUrlFromFirebase(String documentId) async {
    // Check if image URL is already cached
    if (imageCache.containsKey(documentId)) {
      return imageCache[documentId];
    }

    try {
      DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection('IPO').doc(documentId).get();
      String? imageUrl = documentSnapshot.get('imageUrl');
      // Cache the image URL
      imageCache[documentId] = imageUrl;
      return imageUrl;
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
          "IPO",
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
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
        ],
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: searchController,
                            onChanged: (value) {
                              imageCache.clear();
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
                        for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
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
                    selectedColor: Colors.white,
                    fillColor: Color(hexColor('#5F9EA0')),
                    selectedBorderColor: Color(hexColor('#5F9EA0')),
                    borderRadius: BorderRadius.circular(5),
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
                  stream: FirebaseFirestore.instance.collection('IPO').snapshots(),
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

                    List<IPOModel> stocks = snapshot.data!.docs.map((doc) => IPOModel.fromSnapshot(doc)).toList();
                    if (searchController.text.isNotEmpty) {
                      stocks = stocks.where((stock) {
                        final stockName = stock.stockName.toLowerCase();
                        final searchQuery = searchController.text.toLowerCase();
                        return stockName.contains(searchQuery);
                      }).toList();
                    }
                    if (isSelected[1]) {
                      stocks = stocks.where((stock) => stock.status == 'Current').toList();
                    } else if (isSelected[2]) {
                      stocks = stocks.where((stock) => stock.status == 'Upcoming').toList();
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
                          itemCount: stocks.length,
                          itemBuilder: (BuildContext context, int index) {
                            var IPOModel = stocks[index];
                            return Card(
                              surfaceTintColor: Color(hexColor('#FFFFFF')),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 16.0,
                              margin: const EdgeInsets.all(10.0),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      ListTile(
                                        subtitle: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.monetization_on, size: 15, color: Colors.green),
                                                SizedBox(width: 6),
                                                Text(
                                                  'Lot: ',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Text(
                                                  '${IPOModel.lot}',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                SizedBox(width: 20), // Add space between the texts
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.currency_rupee, size: 15, color: Colors.green),
                                                SizedBox(width: 6),
                                                Text(
                                                  'Price:',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Text(
                                                  ' ${IPOModel.price}',
                                                  style: TextStyle(fontSize: 17),
                                                ),
                                                SizedBox(width: 20), // Add space between the texts
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.calendar_today, size: 15, color: Colors.green),
                                                SizedBox(width: 6),
                                                Text(
                                                  'Opening Date:',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.green,
                                                  ),
                                                ), // Add space between the icon and the text
                                                Text(
                                                  ' ${IPOModel.opendate}',
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.calendar_today, size: 15, color: Colors.green),
                                                SizedBox(width: 6),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Closing Date:',
                                                      textDirection: TextDirection.ltr,
                                                      style: TextStyle(
                                                        decoration: TextDecoration.none,
                                                        fontSize: 15,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    SizedBox(width: 6), // Add space between the text and the date
                                                    Text(
                                                      ' ${IPOModel.closedate}',
                                                      textDirection: TextDirection.ltr,
                                                      style: TextStyle(fontSize: 15, decoration: TextDecoration.none),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10,),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.lightbulb, size: 15, color: Colors.green),
                                                Text(
                                                  ' Remark:',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.green,
                                                  ),
                                                ), // Add space between the icon and the text
                                                Text(
                                                  ' ${IPOModel.remark}',
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.5, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: FutureBuilder<String?>(
                                        future: getImageUrlFromFirebase(
                                            IPOModel.id as String), // Use stock ID here
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return CircularProgressIndicator(
                                                color: Colors.white);
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else {
                                            String imageUrl =
                                                snapshot.data ?? '';
                                            // Check if the image URL is already cached
                                            if (imageUrl.isEmpty &&
                                                imageCache.containsKey(
                                                    IPOModel.id)) {
                                              imageUrl = imageCache[IPOModel.id]!;
                                            }
                                            if (imageUrl.isEmpty) {
                                              // Use a default image URL if no image URL is available
                                              imageUrl =
                                              'https://example.com/default_image.jpg';
                                            }
                                            return ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: imageUrl != null
                                                  ? Image.network(
                                                imageUrl,
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              )
                                                  : Placeholder(
                                                fallbackHeight: 100,
                                                fallbackWidth: 100,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  )
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

Future<String?> getImageUrlFromFirebase(String documentId) async {
  try {
    DocumentSnapshot documentSnapshot =
    await FirebaseFirestore.instance.collection('IPO').doc(documentId).get();
    return documentSnapshot.get('imageUrl');
  } catch (e) {
    print('Error fetching image URL: $e');
    return null;
  }
}
