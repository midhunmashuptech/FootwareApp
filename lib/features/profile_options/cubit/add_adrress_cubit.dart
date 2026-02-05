import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/profile_options/cubit/add_address_state.dart';


class AddressFormCubit extends Cubit<AddressFormState> {
  AddressFormCubit() : super(AddressFormState(
          selectedLabel: "Home",
          labels: ["Home", "Work", "Other"],
        ),);

  void selectLabel(String label) {
    emit(state.copyWith(selectedLabel: label));
  }

  void addCustomLabel(String label) {
  if (state.labels.contains(label)) return;

  final updatedLabels = List<String>.from(state.labels)..add(label);

  emit(state.copyWith(
    labels: updatedLabels,
    selectedLabel: label,
  ));
}

}
