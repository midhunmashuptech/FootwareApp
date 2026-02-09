import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/common/model/rating_model.dart';
import 'package:footware_app/features/home/bloc/most_popular_event.dart';
import 'package:footware_app/features/home/bloc/most_popular_state.dart';

class MostPopularBloc extends Bloc<MostPopularEvent, MostPopularState> {
  MostPopularBloc() : super(MostPopularInitial()) {
    // on<LoadWishlist>(_loadWishList);
    // on<RemoveFromWishlist>(_removeFromWishlist);
    on<RemoveLikedFromPopular>(_removeLikedFromPopular);
    on<LoadMostPopular>(_loadMostPopularItems);
  }

  List<String> categories = ["All", "Running", "Sports", "Casual", "Outdoor"];

  List<FootwareModel> dummyItems = [
    FootwareModel(
      title: "RX - Swiss Training Shoe | Orange and White",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/598/small/pair-of-colorful-sports-shoes-for-active-lifestyle-png.png",
      rating: RatingModel(rating: 4.0, reviews: "7K+"),
      price: 2500,
      category: "Running",
    ),
    FootwareModel(
      title: "RX - Swiss Training Shoe | Yellow and Black",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/598/small/pair-of-colorful-sports-shoes-for-active-lifestyle-png.png",
      rating: RatingModel(rating: 3.5, reviews: "12K+"),
      price: 3000,
      category: "Sports",
    ),
  ];

  // Fetch Most Popular items
  void _loadMostPopularItems(
    LoadMostPopular event,
    Emitter<MostPopularState> emit,
  ) {
    emit(MostPopularLoaded(dummyItems, categories));
  }
  //Remove like from Most Popular
  void _removeLikedFromPopular(RemoveLikedFromPopular event,Emitter<MostPopularState> emit){
    if(state is MostPopularLoaded){
      // Create a new list without mutating old state
      final updatedList = List<FootwareModel>.from(
        (state as MostPopularLoaded).items,
      )..remove(event.item);
      emit(MostPopularLoaded(updatedList, categories));
    }
  }
}
