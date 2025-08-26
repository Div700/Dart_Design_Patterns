import 'cart_iterator.dart';

abstract class IIterable {
  CartIterator createIterator();
}