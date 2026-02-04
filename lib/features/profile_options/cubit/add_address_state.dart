class AddressFormState {
  final String selectedLabel;

  AddressFormState({required this.selectedLabel});

  AddressFormState copyWith({String? selectedLabel}) {
    return AddressFormState(
      selectedLabel: selectedLabel ?? this.selectedLabel,
    );
  }
}
