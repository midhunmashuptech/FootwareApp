import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/home/bloc/wishlist_bloc.dart';
import 'package:footware_app/features/home/bloc/wishlist_event.dart';
import 'package:footware_app/features/home/bloc/wishlist_state.dart';
import 'package:footware_app/features/home/cubit/category_cubit.dart';
import 'package:footware_app/features/home/widget/category_card.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WishlistBloc()..add(LoadWishlist()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Wishlist")),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoaded) {
              return BlocProvider(
                create: (_) => CategoryCubit(state.items),
                child: Builder(
                  builder: (categoryContext) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryCard(
                          categories: state.categories,
                          selectedCategory: selectedCategory,
                          onTap: (category) {
                            setState(() => selectedCategory = category);
                            categoryContext
                                .read<CategoryCubit>()
                                .selectCategory(category);
                          },
                        ),

                        const SizedBox(height: 16),

                        Expanded(
                          child: BlocBuilder<CategoryCubit, List<FootwareModel>>(
                            builder: (context, filteredItems) {
                              return GridView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 14,
                                      mainAxisSpacing: 14,
                                      childAspectRatio: 0.78,
                                    ),
                                itemCount: filteredItems.length,
                                itemBuilder: (context, index) {
                                  final item = filteredItems[index];
                                  return FootwearCard(
                                    imageUrl: item.image,
                                    name: item.title,
                                    rating: item.rating.rating,
                                    reviews: item.rating.reviews,
                                    price: item.price,
                                    onWishlistTap: () {},
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
