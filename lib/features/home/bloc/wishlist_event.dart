// import 'package:footware_app/features/home/model/banner_item.dart';

// abstract class WishlistEvent {}

// //Fetch Wishlist
// class LoadWishlist extends WishlistEvent {}

// //Remove from Wishlist
// class RemoveFromWishlist extends WishlistEvent {
//   final BannerItem item;
//   RemoveFromWishlist(this.item);
// }

// //Change Category
// class ChangeWishlistCategory extends WishlistEvent {
//   final String category;
//   ChangeWishlistCategory(this.category);
// }


import 'package:footware_app/features/home/model/banner_item.dart';

abstract class WishlistEvent {}

// Fetch wishlist
class LoadWishlist extends WishlistEvent {}

// Remove from wishlist
class RemoveFromWishlist extends WishlistEvent {
  final BannerItem item;
  RemoveFromWishlist(this.item);
}
