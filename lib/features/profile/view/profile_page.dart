import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/profile/cubit/dark_mode_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, isDarkMode) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),

                ///  Top Bar
                Row(
                  children: [
                    const SizedBox(width: 16),
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                ///  Profile Image
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/en/8/8b/ST3_Steve_Harrington_portrait.jpg",
                      ), // replace with user image
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  "Steve Harrington",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Text("+91 5907654321"),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(height: 1),
                ),

                ///  Menu Items
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    children: [
                      buildTile(
                        Icons.person_outline,
                        "Edit Profile",
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(Routes.editProfile);
                        },
                      ),
                      buildTile(
                        Icons.location_on_outlined, 
                        "Address",
                        onTap:  () {
                          Navigator.of(
                            context,
                          ).pushNamed(Routes.savedAddress);
                        },),
                      buildTile(
                        Icons.notifications_none,
                        "Notification",
                        onTap: () {
                          Navigator.of(
                            context,
                            rootNavigator: true,
                          ).pushNamed(Routes.notifications);
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
                      buildTile(Icons.lock_outline, "Privacy Policy"),
                      buildTile(Icons.headphones_outlined, "Help & Support"),

                      const SizedBox(height: 10),

                      /// Logout
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
                    thumbColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                    trackColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.grey.shade200;
                      }
                      return Colors.black26;
                    }),
                  )
                : trailing ?? Icon(Icons.arrow_forward_ios, size: 16),
            onTap: isSwitch ? null : onTap,
          ),
        );
      },
    );
  }
}
