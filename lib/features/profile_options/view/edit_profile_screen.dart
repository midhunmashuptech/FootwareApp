import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/profile_options/cubit/edit_profile_cubit.dart';
import 'package:footware_app/features/profile_options/cubit/edit_profile_state.dart';
import 'package:footware_app/features/profile_options/widget/dropdown_field.dart';
import 'package:footware_app/features/profile_options/widget/profile_text_field.dart';
import 'package:footware_app/features/profile_options/widget/section_title.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final brandController = TextEditingController();
  final locationController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<EditProfileCubit>().loadProfile();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dobController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listenWhen: (prev, curr) => prev.name != curr.name,
        listener: (context, state) {
          nameController.text = state.name ?? "";
          phoneController.text = state.phone ?? "";
          emailController.text = state.email ?? "";
          locationController.text = state.location ?? "";
          dobController.text = state.dob ?? "";
          brandController.text = state.brand ?? "";
        },
        child: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Profile Image
                    Center(
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/en/8/8b/ST3_Steve_Harrington_portrait.jpg",
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    ///  PERSONAL INFO
                    SectionTitle(text: "Basic Information"),
                    ProfileTextField(
                      controller: nameController,
                      label: "Full Name",
                      hint: "Full Name",
                      icon: Icons.person,
                    ),
                    ProfileTextField(
                      controller: phoneController,
                      label: "Phone Number",
                      hint: "Phone Number",
                      icon: Icons.phone,
                      keyboard: TextInputType.phone,
                    ),
                    ProfileTextField(
                      keyboard: TextInputType.emailAddress,
                      controller: emailController,
                      label: "Eamil",
                      hint: 'Email',
                      icon: Icons.email,
                    ),
                    ProfileTextField(
                      controller: locationController,
                      label: "Location",
                      hint: "City, State",
                      icon: Icons.location_on,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date of Birth",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: dobController,
                            readOnly: true,
                            onTap: () => _selectDate(context),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.cake),
                              hintText: "Select your DOB",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    ///  SHOPPING PREFERENCES
                    SectionTitle(text: "Shopping Preferences"),
                    DropdownField(
                      value: state.gender,
                      label: "Gender",
                      hint: "Select Gender",
                      items: ["Male", "Female", "Other"],
                      icon: Icons.person_outline,
                      onChanged: (val) =>
                          context.read<EditProfileCubit>().changeGender(val),
                    ),
                    DropdownField(
                      label: "Size",
                      value: state.size,
                      hint: "Shoe Size (UK)",
                      items: ["4", "5", "6", "7", "8", "9", "10", "11", "12"],
                      icon: Icons.straighten,
                      onChanged: (val) =>
                          context.read<EditProfileCubit>().changeSize(val),
                    ),
                    ProfileTextField(
                      controller: brandController,
                      label: "preffered Brand",
                      hint: "Preferred Brand (Optional)",
                      icon: Icons.shopping_bag,
                    ),

                    const SizedBox(height: 30),

                    ///  SAVE BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {},
                        child: const Text("Save Changes"),
                      ),
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
