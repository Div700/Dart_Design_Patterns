class CartItem {
  final String name;
  final double price;
  
  CartItem(this.name, this.price);
  
  @override
  String toString() => '$name - \$${price.toStringAsFixed(2)}';
}