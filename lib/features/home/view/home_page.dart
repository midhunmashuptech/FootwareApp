import 'package:flutter/material.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Most Popular", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  TextButton(onPressed: () {}, child: Text("See All"))
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.8,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FootwearCard(
                    imageUrl: "https://png.pngtree.com/png-clipart/20240901/original/pngtree-sports-shoes-png-image_15910407.png",
                    name: "RX – Swiss Training Shoes",
                    rating: 4.8,
                    reviews: "7K+",
                    price: 3500,
                    onWishlistTap: () {
                      debugPrint("Wishlist tapped");
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
