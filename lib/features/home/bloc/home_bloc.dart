import 'package:bloc/bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/common/model/rating_model.dart';
import 'package:footware_app/features/home/model/banner_item.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchHomeData>(_fetchHomeData);
  }

  List<String> categories = ["Running", "Sports", "Casual", "Outdoor", "Boots", "Dance"];

  final List<BannerItem> bannerItems = [
    BannerItem(
      title: "25%",
      subtitle: "Today's Offer",
      description: "Get discount for every order,\non valid for today",
      image: 'assets/images/shoe1.png',
      color: AppColors.offerRed,
    ),
    BannerItem(
      title: "30%",
      subtitle: "Mega Sale",
      description: "Limited time offer on\nsports footwear",
      image: 'assets/images/shoe2.png',
      color: AppColors.offerBrown,
    ),
    BannerItem(
      title: "30%",
      subtitle: "Mega Sale",
      description: "Limited time offer on\nsports footwear",
      image: 'assets/images/shoe3.png',
      color: AppColors.offerTeal,
    ),
    BannerItem(
      title: "30%",
      subtitle: "Mega Sale",
      description: "Limited time offer on\nsports footwear",
      image: 'assets/images/shoe4.png',
      color: AppColors.offerBlue,
    ),
  ];

  final List<FootwareModel> popularItems = [
    FootwareModel(
      title: "RX - Swiss Training Shoe | Orange and White",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/369/small_2x/pair-of-stylish-green-and-gray-running-shoes-for-athletics-png.png",
      rating: RatingModel(rating: 4.0, reviews: "7K+"),
      price: 2500,
      category: "Running"
    ),
    FootwareModel(
      title: "RX - Swiss Training Shoe | Yellow and Black",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/598/small/pair-of-colorful-sports-shoes-for-active-lifestyle-png.png",
      rating: RatingModel(rating: 3.5, reviews: "12K+"),
      price: 3000,
      category: "Running"
    ),
    FootwareModel(
      title: "RX - Swiss Training Shoe | Yellow and Black",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/previews/046/407/753/non_2x/unique-and-aesthetically-colorful-details-of-the-upper-mesh-yellow-premium-running-sports-shoes-sneakers-isolated-on-a-transparent-background-png.png",
      rating: RatingModel(rating: 3.5, reviews: "12K+"),
      price: 3000,
      category: "Running"
    ),
  ];

  Future<void> _fetchHomeData(
    FetchHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    await Future.delayed(Duration(seconds: 3));

    emit(HomeLoaded(bannerItems, categories, popularItems));
  }
}
