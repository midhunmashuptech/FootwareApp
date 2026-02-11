import 'package:flutter/material.dart';
import 'package:footware_app/features/orders/model/order_model.dart';

class track_statge extends StatelessWidget {
  const track_statge({
    super.key,
    required this.stage,
  });

  final TrackingStage stage;

  @override
  Widget build(BuildContext context) {
  int currentStep;

  switch (stage) {
    case TrackingStage.placed:
      currentStep = 0;
      break;
    case TrackingStage.shipped:
      currentStep = 1;
      break;
    case TrackingStage.outForDelivery:
      currentStep = 2;
      break;
    case TrackingStage.delivered:
      currentStep = 3;
      break;
  }

  final steps = [
    {
      "title": "Order Placed",
      "date": "7.48 pm 12 January, 2026",
      "details": "Your order has been successfully placed."
    },
    {
      "title": "Shipment",
      "date": "10.00 am 13 January, 2026",
      "details": "Shipment to Facility Centre Gurgaon, Haryana"
    },
    {
      "title": "Out of Delivery",
      "date": "11.30 am 13 January, 2026",
      "details": "Expected delivery soon."
    },
    {
      "title": "Delivered",
      "date": "3.00 pm 15 January, 2026",
      "details": "Delivered"
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Order Status Details",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 20),
      ...List.generate(steps.length, (index) {
        final isCompleted = index <= currentStep;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  isCompleted
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color:
                      isCompleted ? Colors.green : Colors.grey,
                ),
                if (index != steps.length - 1)
                  Container(
                    height: 60,
                    width: 2,
                    color: Colors.grey.shade300,
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 25),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      steps[index]["title"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isCompleted
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      steps[index]["date"]!,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      steps[index]["details"]!,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    ],
  );
}
}
