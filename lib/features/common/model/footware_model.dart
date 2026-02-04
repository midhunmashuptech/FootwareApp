import 'package:footware_app/features/common/model/rating_model.dart';

class FootwareModel {
  final String title;
  final String description;
  final String image;
  final RatingModel rating;
  final double price;
  final String category;

  FootwareModel({
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
    required this.category,
  });
}
