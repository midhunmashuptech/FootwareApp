import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/common/model/rating_model.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<LoadWishlist>(_loadWishList);
    on<RemoveFromWishlist>(_removeFromWishlist);
  }

  List<String> categories = ["All", "Running", "Sports", "Casual", "Outdoor"];

  List<FootwareModel> dummyItems = [
    FootwareModel(
      title: "RX - Swiss Training Shoe | Orange and White",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/369/small_2x/pair-of-stylish-green-and-gray-running-shoes-for-athletics-png.png",
      rating: RatingModel(rating: 4.0, reviews: "7K+"),
      price: 2500,
      category: "Running",
    ),
    FootwareModel(
      title: "RX - Swiss Training Shoe | Yellow and Black",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/previews/046/407/753/non_2x/unique-and-aesthetically-colorful-details-of-the-upper-mesh-yellow-premium-running-sports-shoes-sneakers-isolated-on-a-transparent-background-png.png",
      rating: RatingModel(rating: 3.5, reviews: "12K+"),
      price: 3000,
      category: "Sports",
    ),
  ];

  // Fetch Wishlist
  void _loadWishList(LoadWishlist event, Emitter<WishlistState> emit) {
    emit(WishlistLoaded(dummyItems, categories));
  }

  //Remove from Wishlist
  void _removeFromWishlist(
    RemoveFromWishlist event,
    Emitter<WishlistState> emit,
  ) {
    if (state is WishlistLoaded) {
      // Create a new list without mutating old state
      final updatedList = List<FootwareModel>.from(
        (state as WishlistLoaded).items,
      )..remove(event.item);

      emit(WishlistLoaded(updatedList, categories));
    }
  }
}
