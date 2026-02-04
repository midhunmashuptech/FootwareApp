import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'footware_state.dart';
import '../../common/model/rating_model.dart';

class FootwareCubit extends Cubit<FootwareState> {
  FootwareCubit() : super(FootwareInitial());

  void loadFootware() async {
    emit(FootwareLoading());

    await Future.delayed(const Duration(seconds: 1));

    emit(
      FootwareLoaded([
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
          category: "Running",
        ),
      ]),
    );
  }
}
