import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/profile_options/cubit/add_adrress_cubit.dart';

class AddLabelSheet extends StatefulWidget {
  const AddLabelSheet();

  @override
  State<AddLabelSheet> createState() => AddLabelSheetState();
}

class AddLabelSheetState extends State<AddLabelSheet> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add New Label",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Eg: Office, Hostel, Mom's house",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                final newLabel = controller.text.trim();
                if (newLabel.isEmpty) return;

                context.read<AddressFormCubit>().addCustomLabel(newLabel);
                context.read<AddressFormCubit>().selectLabel(newLabel);

                Navigator.pop(context);
              },
              child: const Text("Save Label"),
            ),
          ),
        ],
      ),
    );
  }
}
