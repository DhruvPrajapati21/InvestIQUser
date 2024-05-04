import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:user_invest_iq/Shortterm/ShorttermModel.dart';

class Shortterm extends StatefulWidget {
  const Shortterm({Key? key}) : super(key: key);

  @override
  State<Shortterm> createState() => _ShorttermState();
}

class _ShorttermState extends State<Shortterm> {
  List<String> ipo = ['All', 'Achieved', 'Active', 'SL Hit'];
  String? selectedFilter = 'All';
  late TextEditingController searchController;
  Map<String, String?> imageCache = {};

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
      await FirebaseFirestore.instance.collection('Stocks').doc(documentId).get();
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
        backgroundColor: const Color(0xFF5F9EA0),
        title: const Text(
          "ShortTerm",
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
    body: Container(
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://example.com/background_image.jpg'), // Replace with your image URL
    fit: BoxFit.fill,
    ),
    ),
    child: OrientationBuilder(
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
                                imageCache.clear();
                                setState(() {}); // Trigger rebuild on text change
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
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
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
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 5),
                      Text(
                        "ShortTerm Stocklist",
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
                        .where('category', isEqualTo: 'Short Term')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('No data available'));
                      }

                      List<ShortTermModel> stocks = snapshot.data!.docs
                          .map((doc) => ShortTermModel.fromSnapshot(doc))
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
                        return const Center(child: Text('No Data Found!'));
                      }
                      return Column(
                        children: [
                          Text('Available ShortTerm: ${stocks.length}'),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: stocks.length,
                            itemBuilder: (BuildContext context, int index) {
                              var shortTermModel = stocks[index];
                              Color slColor =
                                  Colors.black; // Default color for SL
                              Color remarkColor = Colors.black;
                              Color statusColor =
                                  Colors.black; // Default color for Remark

                              // Setting colors based on Status
                              if (shortTermModel.status == 'Active' ||
                                  shortTermModel.status == 'Achieved') {
                                slColor = Colors.green;
                                remarkColor = Colors.green;
                                statusColor = Colors.green;
                              } else if (shortTermModel.status == 'SL Hit') {
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
                                margin: const EdgeInsets.all(10.0),
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
                                            side: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          margin: const EdgeInsets.all(10.0),
                                          child: FutureBuilder<String?>(
                                            future: getImageUrlFromFirebase(
                                                shortTermModel.id), // Use stock ID here
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const CircularProgressIndicator(
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
                                                        shortTermModel.id)) {
                                                  imageUrl = imageCache[
                                                  shortTermModel.id]!;
                                                }
                                                if (imageUrl.isEmpty) {
                                                  // Use a default image URL if no image URL is available
                                                  imageUrl =
                                                  'https://example.com/default_image.jpg';
                                                }
                                                return ClipOval(
                                                  child: Image.network(
                                                    imageUrl,
                                                    width: 110, // Adjust the size as needed
                                                    height: 110, // Adjust the size as needed
                                                    fit: BoxFit.fill, // Set BoxFit.fill
                                                  ),
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
                                            ' ${shortTermModel.stockName}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 26,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                'Status: ',
                                                style: TextStyle(
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                shortTermModel.status,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: statusColor),
                                              ),
                                              const Spacer(
                                                flex: 15,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Target: ₹${shortTermModel.target}',
                                                style: const TextStyle(
                                                    fontSize: 17),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'CMP: ₹${shortTermModel.cmp}',
                                                style: const TextStyle(
                                                    fontSize: 17),
                                              ),
                                              const Spacer(
                                                flex: 15,
                                              ),
                                              const Text('SL:',
                                                  style: TextStyle(
                                                      fontSize: 17)),
                                              Icon(Icons.currency_rupee,
                                                  size: 17, color: slColor),
                                              // SL icon
                                              Text(shortTermModel.sl,
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
                                                'Date: ${shortTermModel.date}',
                                                style: const TextStyle(
                                                    fontSize: 17),
                                              ),
                                              const Spacer(
                                                flex: 15,
                                              ),
                                              const Text(
                                                'Remarks: ',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                              Expanded(
                                                flex: 30, // Adjust flex value as needed
                                                child: Text(
                                                  shortTermModel.remark,
                                                  style: TextStyle(fontSize: 17, color: remarkColor),
                                                  softWrap: true, // Enable text wrapping
                                                ),
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
