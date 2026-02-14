import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/profile_options/bloc/edit_profile_bloc.dart';
import 'package:footware_app/features/profile_options/bloc/edit_profile_event.dart';
import 'package:footware_app/features/profile_options/bloc/edit_profile_state.dart';
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
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    brandController.dispose();
    locationController.dispose();
    dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formatted =
          "${picked.day}/${picked.month}/${picked.year}";
      dobController.text = formatted;
      context.read<EditProfileBloc>().add(UpdateDob(formatted));
    }
  }

  void _showImageSourceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take Photo"),
              onTap: () {
                context.read<EditProfileBloc>().add(PickImageFromCamera());
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Choose from Gallery"),
              onTap: () {
                context.read<EditProfileBloc>().add(PickImageFromGallery());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: BlocListener<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          nameController.text = state.name ?? "";
          phoneController.text = state.phone ?? "";
          emailController.text = state.email ?? "";
          locationController.text = state.location ?? "";
          dobController.text = state.dob ?? "";
          brandController.text = state.brand ?? "";

          // if (!state.isSaving && state.successMessage != null) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text(state.successMessage!)),
          //   );
          // }
        },
        child: BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// PROFILE IMAGE
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: state.profileImage != null
                                  ? FileImage(state.profileImage!)
                                  : const NetworkImage(
                                          "https://upload.wikimedia.org/wikipedia/en/8/8b/ST3_Steve_Harrington_portrait.jpg",
                                        )
                                      as ImageProvider,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () => _showImageSourceSheet(context),
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
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      const SectionTitle(text: "Basic Information"),

                      ProfileTextField(
                        controller: nameController,
                        label: "Full Name",
                        hint: "Full Name",
                        icon: Icons.person,
                        onChanged: (val) => context
                            .read<EditProfileBloc>()
                            .add(UpdateName(val)),
                      ),

                      ProfileTextField(
                        controller: phoneController,
                        label: "Phone Number",
                        hint: "Phone Number",
                        icon: Icons.phone,
                        keyboard: TextInputType.phone,
                        onChanged: (val) => context
                            .read<EditProfileBloc>()
                            .add(UpdatePhone(val)),
                      ),

                      ProfileTextField(
                        controller: emailController,
                        label: "Email",
                        hint: "Email",
                        icon: Icons.email,
                        keyboard: TextInputType.emailAddress,
                        onChanged: (val) => context
                            .read<EditProfileBloc>()
                            .add(UpdateEmail(val)),
                      ),

                      ProfileTextField(
                        controller: locationController,
                        label: "Location",
                        hint: "City, State",
                        icon: Icons.location_on,
                        onChanged: (val) => context
                            .read<EditProfileBloc>()
                            .add(UpdateLocation(val)),
                      ),

                      const SizedBox(height: 12),
                      const Text("Date of Birth",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),

                      TextFormField(
                        controller: dobController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.cake),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const SectionTitle(text: "Shopping Preferences"),

                      DropdownField(
                        value: state.gender,
                        label: "Gender",
                        hint: "Select Gender",
                        items: const ["Male", "Female", "Other"],
                        icon: Icons.person_outline,
                        onChanged: (val) => context
                            .read<EditProfileBloc>()
                            .add(UpdateGender(val!)),
                      ),

                      DropdownField(
                        value: state.size,
                        label: "Size",
                        hint: "Shoe Size (UK)",
                        items: const [
                          "4","5","6","7","8","9","10","11","12"
                        ],
                        icon: Icons.straighten,
                        onChanged: (val) => context
                            .read<EditProfileBloc>()
                            .add(UpdateSize(val!)),
                      ),

                      ProfileTextField(
                        controller: brandController,
                        label: "Preferred Brand",
                        hint: "Preferred Brand",
                        icon: Icons.shopping_bag,
                        onChanged: (val) => context
                            .read<EditProfileBloc>()
                            .add(UpdateBrand(val)),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: state.isSaving
                              ? null
                              : () {
                                  context
                                      .read<EditProfileBloc>()
                                      .add(SaveProfile());
                                },
                          child: state.isSaving
                              ? const SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text("Save Changes"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
