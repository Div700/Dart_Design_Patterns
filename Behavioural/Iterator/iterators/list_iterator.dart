import '../interfaces/cart_iterator.dart';
import '../models/cart_item.dart';

class ListIterator implements CartIterator {
  final List<CartItem> cartItems;
  int currentIndex = 0;

  ListIterator(this.cartItems);

  @override
  bool hasNext() {
    return currentIndex < cartItems.length;
  }

  @override
  CartItem next() {
    if (hasNext()) {
      CartItem item = cartItems[currentIndex];
      currentIndex++;
      return item;
    }
    throw RangeError('No more items in the list');
  }
}
