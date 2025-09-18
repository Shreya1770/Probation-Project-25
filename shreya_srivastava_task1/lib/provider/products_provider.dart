import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Cool Red Shirt',
      description: 'A stylish red shirt made with premium fabric.',
      price: 29.99,
      imageUrl: 'https://i.pinimg.com/736x/c1/06/c4/c106c452302428f69e113f3ad79efe70.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Classic Blue Jeans',
      description: 'Comfortable blue jeans for all-day wear.',
      price: 59.99,
      imageUrl: 'https://i.pinimg.com/1200x/51/88/ca/5188ca9f6b6ad016da6ad6b6c9a4fc3c.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Leather Jacket',
      description: 'A premium black leather jacket.',
      price: 120.00,
      imageUrl: 'https://i.pinimg.com/1200x/84/87/33/84873358af7215c4daf8a12447321202.jpg',
    ),
    Product(
      id: 'p4',
      title: 'White Sneakers',
      description: 'Trendy white sneakers with a sleek design.',
      price: 74.99,
      imageUrl: 'https://i.pinimg.com/1200x/ae/40/5a/ae405aef7fbd5cb41857a40dcb76e8cb.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Formal Shirt',
      description: 'Elegant formal shirt for office and events.',
      price: 34.50,
      imageUrl: 'https://i.pinimg.com/1200x/7f/95/6f/7f956f373a6f8f1f2dc73c61f89baa57.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Denim Jacket',
      description: 'Casual denim jacket, great for layering.',
      price: 89.99,
      imageUrl: 'https://i.pinimg.com/736x/0e/71/60/0e71608ce4dc6e2addd9535a77a27db0.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
