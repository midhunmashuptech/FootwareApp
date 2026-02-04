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
          "https://png.pngtree.com/png-clipart/20240901/original/pngtree-sports-shoes-png-image_15910407.png",
      rating: RatingModel(rating: 4.0, reviews: "7K+"),
      price: 2500,
      category: "Running"
    ),
    FootwareModel(
      title: "RX - Swiss Training Shoe | Yellow and Black",
      description: "description",
      image:
          "https://png.pngtree.com/png-vector/20250624/ourmid/pngtree-a-high-quality-sports-shoes-png-image_16585846.png",
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

    emit(HomeLoaded(bannerItems, popularItems));
  }
}
