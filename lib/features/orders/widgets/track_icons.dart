import 'package:flutter/material.dart';
import 'package:footware_app/features/orders/model/order_model.dart';
import 'package:iconsax/iconsax.dart';

class track_icons extends StatelessWidget {
  const track_icons({
    super.key,
    required this.trackingStage,
  });

  final TrackingStage trackingStage;

  @override
  Widget build(BuildContext context) {
  int currentStep;

  switch (trackingStage) {
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

  final icons = [
    Iconsax.box,
    Icons.local_shipping_outlined,
    Icons.delivery_dining_outlined,
    Iconsax.box_tick,
  ];

  return Row(
    children: List.generate(icons.length * 2 - 1, (index) {
      /// Even index = Icon
      if (index.isEven) {
        final iconIndex = index ~/ 2;
        final isCompleted = iconIndex <= currentStep;

        return Expanded(
          child: Column(
            children: [
              Icon(
                icons[iconIndex],
                size: 35,
                color: isCompleted ? const Color.fromARGB(255, 108, 108, 108) : const Color.fromARGB(255, 201, 201, 201),
              ),
              const SizedBox(height: 6),
              Icon(
                isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                size: 16,
                color: isCompleted ? Colors.green : Colors.grey,
              ),
            ],
          ),
        );
      }

      /// Odd index = Dotted Line
      else {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildDashedLine(),
          ),
        );
      }
    }),
  );
}

Widget _buildDashedLine() {
  return LayoutBuilder(
    builder: (context, constraints) {
      final boxWidth = constraints.constrainWidth();
      const dashWidth = 6.0;
      const dashSpace = 4.0;
      final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(dashCount, (_) {
          return const SizedBox(
            width: dashWidth,
            height: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          );
        }),
      );
    },
  );
}

}

