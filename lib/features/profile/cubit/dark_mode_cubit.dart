import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeCubit extends Cubit<bool> {
  DarkModeCubit() : super(false);

  void toggleDarkMode(bool value) => emit(value);
}
