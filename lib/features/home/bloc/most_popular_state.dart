import 'package:footware_app/features/common/model/footware_model.dart';

abstract class MostPopularState {}


// Initial state before data loads
class MostPopularInitial extends MostPopularState {}


// State when items are available
class MostPopularLoaded extends MostPopularState {
  final List<FootwareModel> items;
  final List<String> categories;

  MostPopularLoaded(this.items, this.categories);
}
