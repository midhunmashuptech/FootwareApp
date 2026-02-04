import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/profile_options/cubit/add_address_state.dart';


class AddressFormCubit extends Cubit<AddressFormState> {
  AddressFormCubit() : super(AddressFormState(selectedLabel: "Office"));

  void selectLabel(String label) {
    emit(state.copyWith(selectedLabel: label));
  }
}
