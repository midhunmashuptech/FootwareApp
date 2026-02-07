import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/cart/bloc/cart_bloc.dart';
import 'package:footware_app/features/cart/model/cart_model.dart';
import 'package:footware_app/features/common/app_colors.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final int index;

  const CartItemCard({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // light grey card
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Product Image
          Container(
            height: 90,
            width: 90,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Image.network(
              item.product.image,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                /// Color + Size Row
                Row(
                  children: [
                    const Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.darkGrey,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      "Size",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.size,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// Price Row
                Text(
                  "₹ ${item.product.price}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          /// Quantity Controller (Right side)
          _quantityController(context),
        ],
      ),
    );
  }

  Widget _quantityController(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _button(
            icon: Icons.remove,
            onTap: () => context.read<CartBloc>().add(DecreaseQuantity(item.product.id ?? "0")),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              item.quantity.toString(),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          _button(
            icon: Icons.add,
            onTap: () => context.read<CartBloc>().add(IncreaseQuantity(item.product.id ?? "0")),
          ),
        ],
      ),
    );
  }

  Widget _button({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 28,
        height: 28,
        child: Icon(
          icon,
          size: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
