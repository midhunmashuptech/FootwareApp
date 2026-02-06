import 'package:footware_app/features/common/model/footware_model.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final List<Map<String, dynamic>> features;
  final String description;
  final List<FootwareModel> similarProducts;

  final double averageRating;
  final int totalReviews;

  ProductDetailsLoaded({
    required this.features,
    required this.description,
    required this.similarProducts,
    required this.averageRating,
    required this.totalReviews,
  });
}
