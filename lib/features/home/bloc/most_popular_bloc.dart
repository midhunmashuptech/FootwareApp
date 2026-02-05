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
          "https://png.pngtree.com/png-clipart/20240901/original/pngtree-sports-shoes-png-image_15910407.png",
      rating: RatingModel(rating: 4.0, reviews: "7K+"),
      price: 2500,
      category: "Running",
    ),
    FootwareModel(
      title: "RX - Swiss Training Shoe | Yellow and Black",
      description: "description",
      image:
          "https://png.pngtree.com/png-vector/20250624/ourmid/pngtree-a-high-quality-sports-shoes-png-image_16585846.png",
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
