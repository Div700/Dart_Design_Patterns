import '../interfaces/cart_iterator.dart';
import '../interfaces/iterable.dart';
import '../iterators/map_iterator.dart';
import '../models/cart_item.dart';

class CartMap implements IIterable {
  Map<String,CartItem> cartItems = {};

  void addItem(String name, CartItem item) {
    cartItems[name] = item;
  }

  void removeItem(String name) {
    cartItems.remove(name);
  }

  @override
  CartIterator createIterator() {
    return MapIterator(cartItems);
  }
}