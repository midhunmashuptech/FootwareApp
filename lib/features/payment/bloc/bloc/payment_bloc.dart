import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/payment/bloc/bloc/payment_event.dart';
import 'package:footware_app/features/payment/bloc/bloc/payment_state.dart';

class PaymentMethodBloc
    extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(const PaymentMethodState()) {
    on<SelectPaymentMethod>((event, emit) {
      emit(state.copyWith(selectedMethod: event.method));
    });
  }
}
