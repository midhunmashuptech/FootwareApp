import 'package:footware_app/features/common/model/footware_model.dart';

abstract class MostPopularEvent {}
//Fetch Most Popular Footwears
class LoadMostPopular extends MostPopularEvent{}

//Remove item from wishlist
class RemoveLikedFromPopular extends MostPopularEvent {
  final FootwareModel item;
  RemoveLikedFromPopular(this.item);
}