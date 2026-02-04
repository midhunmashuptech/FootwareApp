import 'package:flutter_bloc/flutter_bloc.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';
import '../model/banner_item.dart';
import 'package:flutter/material.dart';

/// BLoC handles business logic
/// It listens to events and emits states
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<LoadWishlist>(_loadWishList);
    on<RemoveFromWishlist>(_removeFromWishlist);
  }

  List<BannerItem> dummyItems = [
    BannerItem(
      title: "RX - Swiss Training Shoes",
      subtitle: "⭐ 4.8 | 7k+",
      description: "₹ 3500.00",
      image: "assets/images/shoe1.png",
      color: Colors.white,
    ),
    BannerItem(
      title: "RX - Swiss Training Shoes",
      subtitle: "⭐ 4.8 | 7k+",
      description: "₹ 3500.00",
      image: "assets/images/shoe2.png",
      color: Colors.white,
    ),
  ];
  
  // Fetch Wishlist
  void _loadWishList(LoadWishlist event, Emitter<WishlistState> emit) {
    emit(WishlistLoaded(dummyItems));
  }

  //Remove from Wishlist
  void _removeFromWishlist(RemoveFromWishlist event, Emitter<WishlistState> emit){
    if (state is WishlistLoaded) {
        // Create a new list without mutating old state
        final updatedList = List<BannerItem>.from(
          (state as WishlistLoaded).items,
        )..remove(event.item);

        emit(WishlistLoaded(updatedList));
      }
  }
}
