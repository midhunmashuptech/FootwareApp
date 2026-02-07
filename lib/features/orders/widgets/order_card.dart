import 'package:flutter/material.dart';
import 'package:footware_app/features/common/app_colors.dart';
import '../model/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = order.status == OrderStatus.completed;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(18),
            child: order.isAsset
                ? Image.network(
                    order.imagePath,
                    fit: BoxFit.contain,
                    height: 120,
                    width: double.infinity,
                  )
                : Image.network(order.imagePath, fit: BoxFit.contain),
          ),

          const SizedBox(width: 14),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status pill
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.lightGreen
                        : AppColors.lightRed,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    order.deliveryText,
                    style: TextStyle(
                      fontSize: 11,
                      color: isCompleted
                          ? AppColors.darkGreen
                          : AppColors.primaryRed,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  order.title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Text(
                      "Color:",
                      style: TextStyle(fontSize: 12, color: AppColors.darkGrey),
                    ),
                    const SizedBox(width: 6),
                    ...order.colors.take(4).map((c) => _colorDot(c)),
                    const SizedBox(width: 10),
                    Text(
                      "Size:",
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    Text(order.size),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ ${order.price}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlack),
                        child: Text(
                          isCompleted ? "Leave Review" : "Track Order",
                          style: const TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 12.5,
                          ),
                        ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorDot(Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
