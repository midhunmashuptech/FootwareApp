import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/cart/bloc/cart_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/common/model/rating_model.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';
import 'package:footware_app/features/products_details/bloc/product_details_bloc.dart';
import 'package:footware_app/features/products_details/bloc/product_details_event.dart';
import 'package:footware_app/features/products_details/bloc/product_details_state.dart';
import 'package:footware_app/features/products_details/cubit/detail_accordian_cubit.dart';
import 'package:footware_app/features/products_details/cubit/selected_variant_cubit.dart';
import 'package:footware_app/features/products_details/model/selected_variant_model.dart';
import 'package:footware_app/features/products_details/model/user_review_model.dart';
import 'package:footware_app/features/products_details/widgets/detail_item.dart';
import 'package:footware_app/features/products_details/widgets/product_feature_card.dart';
import 'package:footware_app/features/products_details/widgets/review_feild_widget.dart';
import 'package:footware_app/features/products_details/widgets/user_review_card.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  static final List<UserReviewModel> userReviews = [
    UserReviewModel(
      userName: "Keerthana M.B",
      userImage:
          "https://static.vecteezy.com/system/resources/thumbnails/041/642/167/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
      rating: 4.5,
      reviewTime: "2 days ago",
      reviewTitle: "Excellent Product",
      reviewText:
          "Love these shoes! Very soft inside, light on the feet, and comfortable even after wearing for hours.",
    ),
    UserReviewModel(
      userName: "Anjana R",
      userImage:
          "https://static.vecteezy.com/system/resources/thumbnails/041/642/167/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
      rating: 4.0,
      reviewTime: "5 days ago",
      reviewTitle: "Very Comfortable",
      reviewText: "Good quality and comfortable fit. Worth the price.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductDetailsBloc()..add(LoadProductDetails()),
        ),
        BlocProvider(create: (_) => SelectedVariantCubit()),
        // BlocProvider(create: (_) => CartBloc()),
      ],
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Product Details"),
        //   leading: const BackButton(),
        // ),
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  // padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                  child: BlocBuilder<SelectedVariantCubit, SelectedVariantModel>(
                    builder: (context, varientState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width,
                                child: PageView.builder(
                                  onPageChanged: (index) {
                                    context
                                        .read<SelectedVariantCubit>()
                                        .changeImage(index);
                                  },
                                  itemCount:
                                      state.images[varientState.color].length,
                                  itemBuilder: (context, index) {
                                    return Image.network(
                                      state.images[varientState
                                          .color][index], // replace with your images
                                      fit: BoxFit.contain,
                                    );
                                  },
                                ),
                              ),

                              /// Back button
                              Positioned(
                                top: 20,
                                left: 20,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                              ),

                              /// Wishlist
                              Positioned(
                                top: 20,
                                right: 20,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite_border),
                                    onPressed: () {},
                                  ),
                                ),
                              ),

                              /// Page indicators
                              Positioned(
                                bottom: 12,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    state.images[varientState.color].length,
                                    (index) => Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      width: index == varientState.image
                                          ? 18
                                          : 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: index == varientState.image
                                            ? Colors.red
                                            : Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          height: 1.3,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.share_outlined),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 12),

                                /// Color variants
                                SizedBox(
                                  height: 70,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) => InkWell(
                                      onTap: () {
                                        context
                                            .read<SelectedVariantCubit>()
                                            .changeVariantColor(index);
                                      },
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: index == varientState.color
                                                ? Colors.black
                                                : Colors.grey.shade300,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Image.network(
                                          state.images[index][0],
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    separatorBuilder: (_, _) =>
                                        SizedBox(width: 10),
                                    itemCount: state.images.length,
                                  ),
                                ),

                                SizedBox(height: 20),

                                /// Price row
                                Row(
                                  children: [
                                    const Text(
                                      "₹ 7999",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      "₹ 5999",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Text(
                                        "25% off",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                /// Size title
                                const Text(
                                  "Size",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                /// Size selector
                                Wrap(
                                  spacing: 10,
                                  children: state.sizes.map((size) {
                                    // final isSelected = selectedSize == size;
                                    return GestureDetector(
                                      onTap: () {
                                        context
                                            .read<SelectedVariantCubit>()
                                            .changeSize(
                                              state.sizes.indexOf(size),
                                            );
                                      },
                                      child: Container(
                                        width: 42,
                                        height: 42,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color:
                                              state.sizes.indexOf(size) ==
                                                  varientState.size
                                              ? Colors.black
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            21,
                                          ),
                                          border: Border.all(
                                            color:
                                                state.sizes.indexOf(size) ==
                                                    varientState.size
                                                ? Colors.black
                                                : Colors.grey.shade400,
                                          ),
                                        ),
                                        child: Text(
                                          size.toString(),
                                          style: TextStyle(
                                            color:
                                                state.sizes.indexOf(size) ==
                                                    varientState.size
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),

                                const SizedBox(height: 20),

                                /// 🔹 Product Highlights
                                const Text(
                                  "Product Highlights",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 12),

                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 12,
                                        childAspectRatio: 2.3,
                                      ),
                                  itemCount: state.features.length,
                                  itemBuilder: (_, index) => ProductFeatureCard(
                                    icon: state.features[index]['icon'],
                                    iconColor: state.features[index]['color'],
                                    text: state.features[index]['text'],
                                  ),
                                ),
                                const SizedBox(height: 24),

                                /// 🔹 Description
                                const Text(
                                  "Description",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(state.description),
                                const SizedBox(height: 24),

                                BlocProvider(
                                  create: (_) => DetailAccordianCubit(),
                                  child: BlocBuilder<DetailAccordianCubit, bool>(
                                    builder: (context, accordianState) {
                                      return Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            255,
                                            247,
                                            247,
                                            247,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            /// Header (dropdown row)
                                            InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () {
                                                context
                                                    .read<
                                                      DetailAccordianCubit
                                                    >()
                                                    .toggleAccordian();
                                              },
                                              child: Row(
                                                children: [
                                                  /// Title + subtitle
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text(
                                                          "All Details",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          "Features, Highlights and more",
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  /// Arrow
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                            255,
                                                            230,
                                                            230,
                                                            230,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                    child: AnimatedRotation(
                                                      turns: accordianState
                                                          ? 0.5
                                                          : 0,
                                                      duration: const Duration(
                                                        milliseconds: 200,
                                                      ),
                                                      child: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            /// Expandable content
                                            AnimatedSize(
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeInOutCubic,
                                              child: accordianState
                                                  ? AnimatedOpacity(
                                                      opacity: 1,
                                                      duration: const Duration(
                                                        milliseconds: 200,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              top: 16,
                                                            ),
                                                        child: Wrap(
                                                          spacing: 10,
                                                          runSpacing: 12,
                                                          children: state
                                                              .details
                                                              .map(
                                                                (
                                                                  item,
                                                                ) => SizedBox(
                                                                  width:
                                                                      MediaQuery.of(
                                                                            context,
                                                                          ).size.width /
                                                                          2 -
                                                                      50,
                                                                  child: DetailItem(
                                                                    label:
                                                                        item['label'],
                                                                    value:
                                                                        item['value'],
                                                                  ),
                                                                ),
                                                              )
                                                              .toList(),
                                                        ),
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(height: 24),

                                /// 🔹 Ratings
                                const Text(
                                  "Ratings & Reviews",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),

                                ReviewFeildWidget(
                                  rating: state.averageRating,
                                  reviews: state.totalReviews,
                                ),

                                const SizedBox(height: 16),

                                /// 🔹 User Reviews
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: userReviews.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 12),
                                  itemBuilder: (context, index) {
                                    final review = userReviews[index];
                                    return UserReviewCard(
                                      userName: review.userName,
                                      userImage: review.userImage,
                                      rating: review.rating,
                                      reviewTime: review.reviewTime,
                                      reviewTitle: review.reviewTitle,
                                      reviewText: review.reviewText,
                                    );
                                  },
                                ),

                                const SizedBox(height: 24),

                                /// 🔹 Similar Products
                                const Text(
                                  "Explore more like this",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 14,
                                        mainAxisSpacing: 14,
                                        childAspectRatio: 0.8,
                                      ),
                                  itemCount: state.similarProducts.length,
                                  itemBuilder: (context, index) {
                                    final item = state.similarProducts[index];
                                    return FootwearCard(
                                      imageUrl: item.image,
                                      name: item.title,
                                      rating: item.rating.rating,
                                      reviews: item.rating.reviews,
                                      price: item.price,
                                      onWishlistTap: () {},
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),

        /// 🔹 Bottom Buttons
        bottomNavigationBar:
            BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                if (state is ProductDetailsLoaded) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    color: AppColors.primaryWhite,
                    child: SafeArea(
                      top: false,
                      child: Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<CartBloc, CartState>(
                              builder: (context, cartState) {
                                return cartState.items.indexWhere(
                                          (element) =>
                                              element.product.id ==
                                              state.id.toString(),
                                        ) ==
                                        -1
                                    ? OutlinedButton(
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                            AddToCart(
                                              FootwareModel(
                                                id: state.id.toString(),
                                                title: state.title,
                                                description: state.description,
                                                image: state.images[0][0],
                                                rating: RatingModel(
                                                  rating: 4.5,
                                                  reviews: "Good Product",
                                                ),
                                                price: 3400.00,
                                                category: '',
                                              ),
                                            ),
                                          );
                                        },
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                          side: const BorderSide(
                                            color: AppColors.primaryBlack,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Add to cart",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    : OutlinedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.cart,
                                          );
                                        },
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.amberAccent,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                          side: const BorderSide(
                                            color: AppColors.primaryBlack,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Go to cart",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                backgroundColor: AppColors.primaryBlack,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "Buy @5999",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SizedBox.shrink();
              },
            ),
      ),
    );
  }
}
