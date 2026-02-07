part of 'cart_bloc.dart';

class CartState {
  final List<CartItem> items;

  const CartState(this.items);

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}
