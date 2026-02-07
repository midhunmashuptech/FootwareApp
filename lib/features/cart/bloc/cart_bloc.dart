
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/cart/model/cart_model.dart';
import 'package:footware_app/features/common/dummy_content.dart';
import 'package:footware_app/features/common/model/footware_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(
          CartState(
            [
              CartItem(
                product:  DummyContent.dummyList[0],
                quantity: 1,
              ),
              CartItem(
                product:  DummyContent.dummyList[1],
                quantity: 2,
              ),
               CartItem(
                product:  DummyContent.dummyList[2],
                quantity: 3,
              ),
            ],
          ),
        ) {
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>(_removeFromCart);
    on<IncreaseQuantity>(_increaseQty);
    on<DecreaseQuantity>(_decreaseQty);
    on<ClearCart>(_clearCart);
  }


  void _addToCart(AddToCart event, Emitter<CartState> emit) {
    final items = List<CartItem>.from(state.items);

    final index = items.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (index >= 0) {
      items[index].quantity++;
    } else {
      items.add(CartItem(product: event.product));
    }

    emit(CartState(items));
  }

  void _removeFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    emit(
      CartState(
        state.items
            .where((item) => item.product.id != event.productId)
            .toList(),
      ),
    );
  }

  void _increaseQty(IncreaseQuantity event, Emitter<CartState> emit) {
    final items = state.items.map((item) {
      if (item.product.id == event.productId) {
        item.quantity++;
      }
      return item;
    }).toList();

    emit(CartState(items));
  }

  void _decreaseQty(DecreaseQuantity event, Emitter<CartState> emit) {
    final items = state.items
        .map((item) {
          if (item.product.id == event.productId) {
            item.quantity--;
          }
          return item;
        })
        .where((item) => item.quantity > 0)
        .toList();

    emit(CartState(items));
  }

  void _clearCart(ClearCart event, Emitter<CartState> emit) {
    emit(const CartState([]));
  }

}
