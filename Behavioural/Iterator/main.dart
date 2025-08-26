import 'models/cart_item.dart';
import 'structures/cart_list.dart';
import 'structures/cart_map.dart';

void main() {
  // List-based cart
  var listCart = CartList();
  listCart.addItem(CartItem('Phone', 999.99));
  listCart.addItem(CartItem('Case', 29.99));
  listCart.addItem(CartItem('Headphones', 199.99));
  listCart.addItem(CartItem('Mouse', 19.99));

  print('List Cart:');
  var listIter = listCart.createIterator();
  while (listIter.hasNext()) {
    print('  ${listIter.next()}');
  }

  // Map-based cart
  var mapCart = CartMap();
  mapCart.addItem('phone', CartItem('Phone', 999.99));
  mapCart.addItem('case', CartItem('Case', 29.99));
  mapCart.addItem('headphones', CartItem('Headphones', 199.99));
  mapCart.addItem('mouse', CartItem('Mouse', 19.99));

  print('\nMap Cart:');
  var mapIter = mapCart.createIterator();
  while (mapIter.hasNext()) {
    print('  ${mapIter.next()}');
  }
}
