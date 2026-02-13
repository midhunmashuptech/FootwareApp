import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';
import 'package:footware_app/features/home/bloc/home_bloc.dart';
import 'package:footware_app/features/home/widget/banner_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchHomeData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    // Profile Image
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/en/8/8b/ST3_Steve_Harrington_portrait.jpg',
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Greeting Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Good Morning',
                            style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Steve Harrington',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Icons
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {
                            Navigator.of(
                              context,
                              rootNavigator: true,
                            ).pushNamed(Routes.wishlist);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications_none_rounded),
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.notifications);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is HomeLoaded) {
                    return state.bannerItems.isEmpty
                        ? SizedBox.shrink()
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Special Offers",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.specialOffers,
                                        );
                                      },
                                      child: Text(
                                        "See All",
                                        style: TextStyle(
                                          color: AppColors.primaryBlack,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                height: 190,
                                child: PageView.builder(
                                  controller: _controller,
                                  itemCount: state.bannerItems.length,
                                  onPageChanged: (index) {
                                    setState(() => _currentIndex = index);
                                  },
                                  itemBuilder: (context, index) {
                                    final banner = state.bannerItems[index];
                                    return BannerCard(banner: banner);
                                  },
                                ),
                              ),

                              const SizedBox(height: 10),

                              // Dots Indicator
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  state.bannerItems.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    height: 6,
                                    width: _currentIndex == index ? 18 : 6,
                                    decoration: BoxDecoration(
                                      color: _currentIndex == index
                                          ? AppColors.primaryRed
                                          : AppColors.darkGrey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Category Cards
                              SizedBox(
                                height: 100,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  itemCount: state.categories.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(width: 20),
                                  itemBuilder: (context, index) {
                                    final item = state.categories[index];

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.categoryBasedApparels,
                                          arguments: item,
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 64,
                                            height: 64,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.grey,
                                            ),
                                            child: Icon(
                                              Icons.sports_soccer_rounded,
                                              size: 28,
                                              color: AppColors.primaryBlack,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                  }

                  return SizedBox.shrink();
                },
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
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.mostPopular);
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(color: AppColors.primaryBlack),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state is HomeLoaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 0.8,
                          ),
                      itemCount: state.popularItems.length,
                      itemBuilder: (context, index) {
                        final footware = state.popularItems[index];
                        return FootwearCard(
                          imageUrl: footware.image,
                          name: footware.title,
                          rating: footware.rating.rating,
                          reviews: footware.rating.reviews,
                          price: footware.price,
                          onWishlistTap: () {
                            debugPrint("Wishlist tapped");
                          },
                        );
                      },
                    );
                  }

                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
