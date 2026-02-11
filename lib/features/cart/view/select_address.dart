import 'package:flutter/material.dart';

class AddressSelectionPage extends StatefulWidget {
  const AddressSelectionPage({super.key});

  @override
  State<AddressSelectionPage> createState() =>
      _AddressSelectionPageState();
}

class _AddressSelectionPageState
    extends State<AddressSelectionPage> {

  int selectedIndex = 0;

  final List<Map<String, String>> addresses = [
    {
      "title": "Home",
      "address":
          "Gandhi Nagar, 2nd Street, Panampilly Nagar, Ernakulam District, Kerala - 682017\nNear Panampilly Nagar Park",
    },
    {
      "title": "Work",
      "address":
          "Gandhi Nagar, 2nd Street, Panampilly Nagar, Ernakulam District, Kerala - 682017\nNear Panampilly Nagar Park",
    },
    {
      "title": "Office",
      "address":
          "Gandhi Nagar, 2nd Street, Panampilly Nagar, Ernakulam District, Kerala - 682017\nNear Panampilly Nagar Park",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Shipping Address",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          /// Address List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];

                final isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEDED),
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        /// Location Icon
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),

                        const SizedBox(width: 12),

                        /// Address Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    address["title"]!,
                                    style:
                                        const TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Icon(
                                    Icons.edit,
                                    size: 16,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                address["address"]!,
                                style:
                                    const TextStyle(
                                  fontSize: 12,
                                  color:
                                      Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Radio Indicator
                        Icon(
                          isSelected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// Bottom Select Button
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,
                        addresses[selectedIndex]);
                  },
                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.black,
                    padding:
                        const EdgeInsets
                            .symmetric(
                                vertical:
                                    18),
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius
                              .circular(30),
                    ),
                  ),
                  child: const Text(
                    "Select",
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
