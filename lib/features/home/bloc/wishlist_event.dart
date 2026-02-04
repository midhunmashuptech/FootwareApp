import 'package:footware_app/features/common/model/footware_model.dart';

abstract class WishlistEvent {}

// Fetch wishlist
class LoadWishlist extends WishlistEvent {}

// Remove from wishlist
class RemoveFromWishlist extends WishlistEvent {
  final FootwareModel item;
  RemoveFromWishlist(this.item);
}
