part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCart extends CartEvent {
  final FootwareModel product;
  AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final String productId;
  RemoveFromCart(this.productId);
}

class IncreaseQuantity extends CartEvent {
  final String productId;
  IncreaseQuantity(this.productId);
}

class DecreaseQuantity extends CartEvent {
  final String productId;
  DecreaseQuantity(this.productId);
}

class ClearCart extends CartEvent {}