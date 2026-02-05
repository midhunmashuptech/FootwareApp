import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';
import 'package:footware_app/features/home/bloc/most_popular_bloc.dart';
import 'package:footware_app/features/home/bloc/most_popular_event.dart';
import 'package:footware_app/features/home/bloc/most_popular_state.dart';
import 'package:footware_app/features/home/cubit/most_popular_cubit.dart';
import 'package:footware_app/features/home/widget/category_card.dart';

class MostPopularScreen extends StatefulWidget {
  const MostPopularScreen({super.key});

  @override
  State<MostPopularScreen> createState() => _MostPopularScreenState();
}

class _MostPopularScreenState extends State<MostPopularScreen> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MostPopularBloc()..add(LoadMostPopular()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Most Popular",style: TextStyle(fontWeight: FontWeight.bold),)),
        body: BlocBuilder<MostPopularBloc, MostPopularState>(
          builder: (context, state) {
            if (state is MostPopularLoaded) {
              return BlocProvider(
                create: (_) => MostPopularCubit(state.items),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCard(
                      categories: state.categories,
                      selectedCategory: selectedCategory,
                      onTap: (category) {
                        setState(() => selectedCategory = category);
                        context.read<MostPopularCubit>().selectCategory(
                          category,
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    Expanded(
                      child: BlocBuilder<MostPopularCubit, List<FootwareModel>>(
                        builder: (context, filteredItems) {
                          return GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
