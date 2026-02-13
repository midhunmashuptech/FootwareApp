import 'package:bloc/bloc.dart';

class DetailAccordianCubit extends Cubit<bool> {
  DetailAccordianCubit() : super(false);

  void toggleAccordian() => emit(!state);
}
