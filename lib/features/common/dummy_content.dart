import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/common/model/rating_model.dart';

class DummyContent {
  static List<FootwareModel> dummyList = [
    FootwareModel(
      id: "1",
      title: "RX - Swiss Training Shoe | Orange and White",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/369/small_2x/pair-of-stylish-green-and-gray-running-shoes-for-athletics-png.png",
      rating: RatingModel(rating: 4.0, reviews: "7K+"),
      price: 2500,
      category: "Running",
    ),
    FootwareModel(
      id: "2",
      title: "RX - Swiss Training Shoe | Yellow and Black",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/598/small/pair-of-colorful-sports-shoes-for-active-lifestyle-png.png",
      rating: RatingModel(rating: 3.5, reviews: "12K+"),
      price: 3000,
      category: "Running",
    ),
    FootwareModel(
      id: "3",
      title: "RX - Swiss Training Shoe | Yellow and Black",
      description: "description",
      image:
          "https://static.vecteezy.com/system/resources/previews/046/407/753/non_2x/unique-and-aesthetically-colorful-details-of-the-upper-mesh-yellow-premium-running-sports-shoes-sneakers-isolated-on-a-transparent-background-png.png",
      rating: RatingModel(rating: 3.5, reviews: "12K+"),
      price: 3000,
      category: "Running",
    ),
  ];
}
