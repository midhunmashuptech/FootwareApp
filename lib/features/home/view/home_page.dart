import 'package:flutter/material.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';
import 'package:footware_app/features/home/model/banner_item.dart';
import 'package:footware_app/features/home/widget/banner_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  final List<BannerItem> banners = [
    BannerItem(
      title: "25%",
      subtitle: "Today's Offer",
      description: "Get discount for every order,\non valid for today",
      image: 'assets/images/shoe1.png',
      color: AppColors.offerRed,
    ),
    BannerItem(
      title: "30%",
      subtitle: "Mega Sale",
      description: "Limited time offer on\nsports footwear",
      image: 'assets/images/shoe2.png',
      color: AppColors.offerBrown,
    ),
    BannerItem(
      title: "30%",
      subtitle: "Mega Sale",
      description: "Limited time offer on\nsports footwear",
      image: 'assets/images/shoe3.png',
      color: AppColors.offerTeal,
    ),
    BannerItem(
      title: "30%",
      subtitle: "Mega Sale",
      description: "Limited time offer on\nsports footwear",
      image: 'assets/images/shoe4.png',
      color: AppColors.offerBlue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special Offers",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(color: AppColors.primaryBlack),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 190,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: banners.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    return BannerCard(banner: banner);
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Dots Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  banners.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: _currentIndex == index ? 18 : 6,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.red
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(color: AppColors.primaryBlack),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                    imageUrl:
                        "https://png.pngtree.com/png-clipart/20240901/original/pngtree-sports-shoes-png-image_15910407.png",
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
            ],
          ),
        ),
      ),
    );
  }
}
