import 'package:flutter/material.dart';

void main() {
  runApp(ProductListApp());
}

class ProductListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;

  Product({required this.name, required this.imageUrl});
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'iphone11', imageUrl: 'images/iphone11.jpg'),
    Product(name: 'iphone13', imageUrl: 'images/iphone13.jpg'),
    Product(name: 'iphone14promax', imageUrl: 'images/iphone14promax.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách điện thoại'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(products[index].imageUrl, width: 50, height: 50),
            title: Text(products[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(product.imageUrl, width: 200, height: 200),
            SizedBox(height: 20),
            Text('Tên sản phẩm: ${product.name}'),
          ],
        ),
      ),
    );
  }
}
