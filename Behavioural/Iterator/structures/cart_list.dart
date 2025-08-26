import '../interfaces/cart_iterator.dart';
import '../interfaces/iterable.dart';
import '../iterators/list_iterator.dart';
import '../models/cart_item.dart';

class CartList implements IIterable {
  List<CartItem> cartItems = [];

  void addItem(CartItem item) {
    cartItems.add(item);
  }

  void removeItem(CartItem item) {
    cartItems.remove(item);
  }

  @override
  CartIterator createIterator() {
    return ListIterator(cartItems);
  }
}
