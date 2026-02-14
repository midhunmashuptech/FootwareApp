import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footware_app/features/payment/bloc/bloc/payment_bloc.dart';
import 'package:footware_app/features/payment/bloc/bloc/payment_event.dart';
import 'package:footware_app/features/payment/bloc/bloc/payment_state.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentMethodBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          title: const Text(
            "Payment Methods",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              const Text(
                "Select the payment method you want to use",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              _paymentTile(
                context: context,
                value: "paypal",
                icon: SvgPicture.asset("assets/icons/paypal.svg", height: 20),
                title: "PayPal",
              ),
              _paymentTile(
                context: context,
                value: "gpay",
                icon: SvgPicture.asset(
                  "assets/icons/googlepay.svg",
                  height: 28,
                ),
                title: "Google Pay",
              ),
              _paymentTile(
                context: context,
                value: "apple",
                icon: SvgPicture.asset("assets/icons/applepay.svg", height: 28),
                title: "Apple Pay",
              ),

              _paymentTile(
                context: context,
                value: "card",
                icon: const Icon(
                  Icons.credit_card,
                  size: 28,
                  color: Colors.black,
                ),
                title: "Credit / Debit Card",
              ),

              const Spacer(),

              BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.selectedMethod.isEmpty
                            ? Colors.grey
                            : Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: state.selectedMethod.isEmpty
                          ? null
                          : () {
                              // Handle confirm
                              print("Selected: ${state.selectedMethod}");
                            },
                      child: const Text(
                        "Confirm Payment",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentTile({
    required BuildContext context,
    required String value,
    required Widget icon,
    required String title,
  }) {
    return BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
      builder: (context, state) {
        final isSelected = state.selectedMethod == value;

        return GestureDetector(
          onTap: () {
            context.read<PaymentMethodBloc>().add(SelectPaymentMethod(value));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isSelected ? Colors.black : Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                icon,
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_circle, color: Colors.black)
                else
                  const Icon(Icons.circle_outlined, color: Colors.grey),
              ],
            ),
          ),
        );
      },
    );
  }
}
