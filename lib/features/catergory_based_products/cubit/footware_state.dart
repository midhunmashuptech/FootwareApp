import 'package:footware_app/features/common/model/footware_model.dart';

abstract class FootwareState {}

class FootwareInitial extends FootwareState {}

class FootwareLoading extends FootwareState {}

class FootwareLoaded extends FootwareState {
  final List<FootwareModel> items;

  FootwareLoaded(this.items);
}

// class FootwareError extends FootwareState {
//   final String message;

//   FootwareError(this.message);
// }
