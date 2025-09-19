import 'package:shopping_app/models/product.dart';

class Shop {
  // Products for sale
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.99,
      description: "Item description",
    ),
    Product(
      name: "Product 2",
      price: 89.99,
      description: "Another item description",
    ),
    Product(
      name: "Product 3",
      price: 79.99,
      description: "Yet another item description",
    ),
    Product(
      name: "Product 4",
      price: 69.99,
      description: "Last item description",
    ),
  ];

  // User cart
  final List<Product> _cart = [];

  // Get product list
  List<Product> get shop => _shop;

  // Get user cart
  List<Product> get cart => _cart;

  // Add item to cart
  void addToCart(Product item) {
    _cart.add(item);
  }

  // Remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
  }
}
