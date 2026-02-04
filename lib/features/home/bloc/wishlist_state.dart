import 'package:footware_app/features/common/model/footware_model.dart';

abstract class WishlistState {}


// Initial state before data loads
class WishlistInitial extends WishlistState {}


// State when wishlist items are available
class WishlistLoaded extends WishlistState {
  final List<FootwareModel> items;
  final List<String> categories;

  WishlistLoaded(this.items, this.categories);
}
