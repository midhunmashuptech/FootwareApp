import 'package:footware_app/features/home/model/banner_item.dart';

abstract class WishlistState {}


// Initial state before data loads
class WishlistInitial extends WishlistState {}


// State when wishlist items are available
class WishlistLoaded extends WishlistState {
  final List<BannerItem> items;
  

  WishlistLoaded(this.items);
}
