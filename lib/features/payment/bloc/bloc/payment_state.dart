class PaymentMethodState  {
  final String selectedMethod;

  const PaymentMethodState({this.selectedMethod = ""});

  PaymentMethodState copyWith({
    String? selectedMethod,
  }) {
    return PaymentMethodState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
    );
  }

  @override
  List<Object?> get props => [selectedMethod];
}
