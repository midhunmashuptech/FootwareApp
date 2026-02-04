import 'package:flutter/material.dart';
import 'package:footware_app/features/profile_options/widget/add_adress_textfield.dart';
import 'package:footware_app/features/profile_options/widget/address_label_selector_chip.dart';

class AddNewAddressPage extends StatefulWidget {
  const AddNewAddressPage({super.key});

  @override
  State<AddNewAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  //String selectedLabel = "Office";

  final labels = ["Home", "Office", "Work"];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text("Add New Address"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🗺️ Map Preview
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  "https://developers.google.com/static/maps/images/landing/hero_maps_static_api.png",
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300,
                      child: const Center(child: Icon(Icons.map, size: 50)),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ✏️ Input Fields
            AddressTextField(hint: "Fullname"),
            AddressTextField(hint: "House Name/ Apartment"),
            AddressTextField(hint: "Road Name"),
            AddressTextField(hint: "Pincode", keyboard: TextInputType.number),
            AddressTextField(hint: "District"),
            AddressTextField(hint: "State"),

            const SizedBox(height: 14),

            /// 🏷 Label Section
            const SizedBox(height: 10),
            AddressLabelSelector(labels: labels),


            const SizedBox(height: 30),

            /// 💾 Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}   
