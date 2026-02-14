abstract class PaymentMethodEvent{
  @override
  List<Object?> get props => [];
}

class SelectPaymentMethod extends PaymentMethodEvent {
  final String method;

  SelectPaymentMethod(this.method);

  @override
  List<Object?> get props => [method];
}
