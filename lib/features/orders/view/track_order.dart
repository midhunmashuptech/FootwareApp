import 'package:flutter/material.dart';
import 'package:footware_app/features/orders/model/order_model.dart';
import 'package:footware_app/features/orders/widgets/track_icons.dart';
import 'package:footware_app/features/orders/widgets/track_stage.dart';
import 'package:iconsax/iconsax.dart';

class TrackOrderPage extends StatelessWidget {
  final OrderModel order;

  const TrackOrderPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text(
          "Track Order",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// Order ID
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Order ID : ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: order.id,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            
              const SizedBox(height: 15),
            
              /// Product Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          order.imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
            
                          /// Color + Size + Qty
                          Row(
                            children: [
                              const Text(
                                "Color : ",
                                style: TextStyle(fontSize: 12),
                              ),
                              ...order.colors
                                  .take(1)
                                  .map(
                                    (c) => Container(
                                      margin: const EdgeInsets.only(right: 6),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: c,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                              const SizedBox(width: 10),
                              Text(
                                "Size : ${order.size}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Qty : 1",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
            
                          const SizedBox(height: 8),
            
                          Text(
                            "₹ ${order.price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            
              const SizedBox(height: 25),
            
              track_icons(trackingStage: order.trackingStage),
            
              const SizedBox(height: 25),
            
              /// Delivery Status
              const Text(
                "Order in Delivery",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            
              const SizedBox(height: 8),
            
              const Text(
                "Your order is expected to be delivered on",
                 style: TextStyle(fontSize: 14),
                 textAlign: TextAlign.center,
              ),
               const Text(
                "24 January, 2026",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 30),
            
              /// Timeline
              Expanded(child: track_statge(stage: order.trackingStage)),
            
              /// Cancel Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    // context.read<OrderCubit>().cancelOrder(order.id);
                    // Navigator.pop(context);
                  },
                  child: const Text("Cancel Order"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

