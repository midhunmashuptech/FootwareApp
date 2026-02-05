import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/model/footware_model.dart';

class MostPopularCubit extends Cubit<List<FootwareModel>> {
  final List<FootwareModel> _allItems;

  MostPopularCubit(this._allItems) : super(_allItems);

  void selectCategory(String category) {
    if (category == "All") {
      emit(_allItems);
    } else {
      emit(
        _allItems
            .where((item) => item.category == category)
            .toList(),
      );
    }
  }
}
