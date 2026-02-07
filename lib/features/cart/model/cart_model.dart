import 'package:footware_app/features/common/model/footware_model.dart';

class CartItem {
  final FootwareModel product;
  String size;
  int quantity;

  

  CartItem({required this.product, this.size = "M", this.quantity = 1});

  double get totalPrice => (product.price) * quantity;
}