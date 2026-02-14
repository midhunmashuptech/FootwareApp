import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/home/bloc/home_bloc.dart';
import 'package:footware_app/features/home/widget/banner_card.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Special Offers",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            /// Loading state
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            /// Loaded state
            if (state is HomeLoaded) {
              return Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Banner card
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.bannerItems.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          return BannerCard(banner: state.bannerItems[index]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            /// Fallback state
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
