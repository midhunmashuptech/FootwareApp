class AddressFormState {
  final String selectedLabel;
  final List<String> labels;

  AddressFormState({
    required this.selectedLabel,
    required this.labels,
  });

  AddressFormState copyWith({
    List<String>? labels,
    String? selectedLabel,
  }) {
    return AddressFormState(
      labels: labels ?? this.labels,
      selectedLabel: selectedLabel ?? this.selectedLabel,
    );
  }
}
