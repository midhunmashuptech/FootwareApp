import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/catergory_based_products/cubit/footware_cubit.dart';
import 'package:footware_app/features/catergory_based_products/cubit/footware_state.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';

class CategoryBasedApparel extends StatelessWidget {
  final String category;
  const CategoryBasedApparel({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FootwareCubit()..loadFootware(),
      child: Scaffold(
        appBar: AppBar(title: Text(category)),
        body: BlocBuilder<FootwareCubit, FootwareState>(
          builder: (context, state) {
            if (state is FootwareLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FootwareLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];

                  return FootwearCard(
                    imageUrl: item.image,
                    name: item.title,
                    rating: item.rating.rating,
                    reviews: item.rating.reviews,
                    price: item.price,
                  );
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
