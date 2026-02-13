import 'package:flutter/material.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Privacy and Policy",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  "Last Updated on 27 Jan 2026",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "This Privacy Policy explains how The Souled Store collects, uses, stores, and protects your information when you use The Souled Store mobile application and related services (the App). By accessing or using the App, you agree to the practices described in this Privacy Policy.",
                ),
                SizedBox(height: 15),
                Text(
                  "We collect information to provide you with a smooth, personalized, and secure shopping experience. Personal Information may include your name, mobile number, email address, shipping and billing address, and account login details. Payment information such as card or UPI details is processed securely through authorized third‑party payment gateways. We do not store your complete payment details on our servers.Order and Usage Information includes details of products viewed or purchased, order history, returns, refunds, wishlist items, cart details, size preferences, and interactions within the App.Device and Technical Information may include device type, operating system, app version, IP address, and basic log information used for analytics, security, and performance improvements.",
                ),
                SizedBox(height: 15),
                Text(
                  "Data We Collect",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Order and Usage Information includes details of products viewed or purchased, order history, returns, refunds, wishlist items, cart details, size preferences, and interactions within the App.Device and Technical Information may include device type, operating system, app version, IP address, and basic log information used for analytics, security, and performance improvements.Device and Technical Information may include device type, operating system, app version, IP address, and basic log information used for analytics, security, and performance improvements.",
                ),
                SizedBox(height: 15),
                Text(
                  "How We Use Your Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "We use your information to process orders, deliver products, manage returns and refunds, and provide customer support.Your information helps us personalize product recommendations, improve app functionality, and communicate important updates such as order confirmations, delivery status, and service notifications.With your consent, we may also send promotional messages, offers, and updates about new launches. You can opt out of marketing communications at any time through the App settings.",
                ),
                SizedBox(height: 15),
                Text(
                  "Contact us",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "If you have any questions, concerns, or grievances regarding this Privacy Policy or our data practices, you may contact us at:",
                ),
                Text("The Souled Store"),
                Text(
                  "Email: support@thesouledstore.com",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
