import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/home/cubit/category_cubit.dart';
import 'package:footware_app/features/home/model/banner_item.dart';
import 'package:footware_app/features/home/widget/category_card.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  static const categories = [
    "All",
    "Running",
    "Sports",
    "Casual",
    "Outdoor",
  ];

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  String selectedCategory = "All";

  final List<BannerItem> dummyShoes = [
    BannerItem(
      title: "RX – Swiss Training Shoes",
      subtitle: "⭐ 4.8 | 7k+",
      description: "₹ 3500",
      image: "assets/images/shoe1.png",
      color: Colors.white,
      category: "Running",
    ),
    BannerItem(
      title: "RX – Sports Shoes",
      subtitle: "⭐ 4.6 | 5k+",
      description: "₹ 3200",
      image: "assets/images/shoe2.png",
      color: Colors.white,
      category: "Sports",
    ),
    BannerItem(
      title: "RX – Casual Shoes",
      subtitle: "⭐ 4.5 | 3k+",
      description: "₹ 2800",
      image: "assets/images/shoe3.png",
      color: Colors.white,
      category: "Casual",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit(dummyShoes),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wishlist"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 CUSTOM CATEGORY LIST
            ShoeCategoryList(
              categories: WishlistScreen.categories,
              selectedCategory: selectedCategory,
              onTap: (category) {
                setState(() => selectedCategory = category);
                context.read<CategoryCubit>().selectCategory(category);
              },
            ),

            const SizedBox(height: 16),

            // 🔹 SHOES GRID
            Expanded(
              child: BlocBuilder<CategoryCubit, List<BannerItem>>(
                builder: (context, items) {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.78,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return FootwearCard(
                        imageUrl: item.image,
                        name: item.title,
                        rating: 4.8,
                        reviews: "7K+",
                        price: 3500,
                        onWishlistTap: () {},
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
