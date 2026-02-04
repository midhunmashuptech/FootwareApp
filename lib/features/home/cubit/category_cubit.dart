import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/banner_item.dart';

class CategoryCubit extends Cubit<List<BannerItem>> {
  final List<BannerItem> allItems;

  CategoryCubit(this.allItems) : super(allItems);

  void selectCategory(String category) {
    if (category == "All") {
      emit(allItems);
    } else {
      emit(
        allItems.where((item) => item.category == category).toList(),
      );
    }
  }
}
