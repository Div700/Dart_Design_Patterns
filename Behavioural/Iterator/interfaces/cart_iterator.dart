
import '../models/cart_item.dart';

abstract class CartIterator {
  bool hasNext();
  CartItem next();
}