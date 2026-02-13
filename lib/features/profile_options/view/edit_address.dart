import 'package:flutter/material.dart';
import 'package:footware_app/features/profile_options/widget/add_adress_textfield.dart';
import 'package:footware_app/features/profile_options/widget/address_label_selector_chip.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({super.key});

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  final houseController = TextEditingController();
  final roadController = TextEditingController();
  final landMarkController = TextEditingController();
  final districtController = TextEditingController();
  final stateController = TextEditingController();
  final pincodeController = TextEditingController();

@override
  void initState() {
     houseController.text = "steve House";
      roadController.text = "1421 Maplecrest Drive";
      landMarkController.text = "opp to dustin's house";
      districtController.text = "Hawkins";
      stateController.text = "Indiana";
      pincodeController.text = "46001";
    super.initState();
  }
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

      body: SafeArea(
        child: SingleChildScrollView(
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
        
              ///  Input Fields
              AddressTextField(hint: "House Name/ Apartment", controller: houseController,),
              AddressTextField(hint: "Road Name", controller: roadController,),
               AddressTextField(hint: "Land Mark (optional)", controller: landMarkController,),
              AddressTextField(hint: "Pincode", keyboard: TextInputType.number, controller: pincodeController,),
              AddressTextField(hint: "District", controller: districtController,),
              AddressTextField(hint: "State", controller: stateController,),
        
              const SizedBox(height: 14),
        
              /// 🏷 Label Section
              const SizedBox(height: 10),
              AddressLabelSelector(),
        
        
              const SizedBox(height: 30),
        
              ///  Save Button
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
      ),
    );
  }
}   
