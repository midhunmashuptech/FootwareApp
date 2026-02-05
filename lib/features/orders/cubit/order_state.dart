import '../model/order_model.dart';

class OrderState {
  final List<OrderModel> activeOrders;
  final List<OrderModel> completedOrders;

  OrderState({
    required this.activeOrders,
    required this.completedOrders,
  });
}
