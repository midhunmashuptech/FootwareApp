import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/profile/cubit/dark_mode_cubit.dart';
import 'package:footware_app/features/profile/cubit/profile_cubit.dart';
import 'package:footware_app/features/profile/cubit/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
  if (state is ProfileLogoutSuccess) {
    /// Navigate first
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.bottomNavigation,
      (route) => false,
    );

    //Snackbar after navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Logged out successfully"),
          backgroundColor: Colors.black,
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  if (state is ProfileLogoutFailure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
        backgroundColor: Colors.red,
      ),
    );
  }
},

      child: BlocBuilder<DarkModeCubit, bool>(
        builder: (context, isDarkMode) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  /// Top Bar
                  Row(
                    children: const [
                      SizedBox(width: 16),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Profile Image
                  Stack(
                    children: const [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/en/8/8b/ST3_Steve_Harrington_portrait.jpg",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Steve Harrington",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 4),

                  const Text("+91 5907654321"),

                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(height: 1),
                  ),

                  /// Menu Items
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      children: [
                        buildTile(
                          Icons.person_outline,
                          "Edit Profile",
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.editProfile);
                          },
                        ),
                        buildTile(
                          Icons.location_on_outlined,
                          "Address",
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.savedAddress);
                          },
                        ),
                        buildTile(
                          Icons.notifications_none,
                          "Notification",
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(Routes.notifications);
                          },
                        ),
                        buildTile(
                          Icons.language,
                          "Language",
                          trailing: const Text(
                            "English (US)",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        buildTile(
                          Icons.dark_mode_outlined,
                          "Dark Mode",
                          isSwitch: true,
                        ),
                        buildTile(
                          Icons.lock_outline,
                          "Privacy Policy",
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.privacyAndPolicy);
                          },
                        ),
                        buildTile(
                            Icons.headphones_outlined, "Help & Support"),

                        const SizedBox(height: 10),

                        /// Logout (UPDATED ONLY HERE)
                        ListTile(
                          leading:
                              const Icon(Icons.logout, color: Colors.red),
                          title: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () {
                            _showLogoutDialog(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTile(
    IconData icon,
    String title, {
    Widget? trailing,
    bool isSwitch = false,
    Function()? onTap,
  }) {
    return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, isDarkMode) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child: ListTile(
            leading: Icon(icon),
            title: Text(title),
            trailing: isSwitch
                ? Switch(
                    value: isDarkMode,
                    onChanged: (val) {
                      context.read<DarkModeCubit>().toggleDarkMode(val);
                    },
                  )
                : trailing ??
                    const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: isSwitch ? null : onTap,
          ),
        );
      },
    );
  }

   void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Are you sure?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Do you really want to logout\nfrom this account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    /// Cancel
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// Confirm
                    Expanded(
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: state is ProfileLogoutLoading
                                ? null
                                : () {
                                    Navigator.pop(context);
                                    context.read<ProfileCubit>().logout();
                                  },
                            child: state is ProfileLogoutLoading
                                ? const SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text("Confirm"),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
