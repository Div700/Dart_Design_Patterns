import '../interfaces/cart_iterator.dart';
import '../models/cart_item.dart';

class MapIterator implements CartIterator{
  final Map<String, CartItem> cartItems;
  MapIterator(this.cartItems);
  int currentIndex = 0;
  
  @override
  bool hasNext() {
    List<String> keys = cartItems.keys.toList();
    return currentIndex < keys.length;
  }

  @override
  CartItem next() {
    if (hasNext()) {
      List<String> keys = cartItems.keys.toList();
      CartItem item = cartItems[keys[currentIndex]]!;
      currentIndex++;
      return item;
    }
    throw RangeError('No more items in the map');
  }

}