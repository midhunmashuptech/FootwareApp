import 'package:flutter/material.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/profile_options/cubit/address_cubit.dart';
import 'package:footware_app/features/profile_options/widget/address_card.dart';

class SavedAddressPage extends StatelessWidget {
  const SavedAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Saved Address",
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colors.primary,
              child: IconButton(
                icon: Icon(Icons.add, color: colors.onPrimary, size: 20),
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.addNewAddress);
                },
              ),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: addressList.length,
        itemBuilder: (context, index) {
          final address = addressList[index];
          return AddressCard(title: address.type, address: address.address);
        },
      ),
    );
  }
}
