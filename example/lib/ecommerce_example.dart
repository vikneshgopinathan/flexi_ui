import 'package:flutter/material.dart';
import 'package:json_ui_builder/json_ui_builder.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Shop - FlexiUI Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const EcommerceHomePage(),
      routes: {
        '/homepage': (context) => const EcommerceHomePage(),
        '/promotion': (context) => const PromotionPage(),
        '/product': (context) => const ProductDetailPage(),
        '/category': (context) => const CategoryPage(),
      },
    );
  }
}

class EcommerceHomePage extends StatelessWidget {
  const EcommerceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleFlexiUI(
        dataSource: const DataSourceConfig(
          type: DataSourceType.asset,
          assetPath: 'assets/homepage.json',
        ),
        onError: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error loading homepage'),
              backgroundColor: Colors.red,
            ),
          );
        },
        onSuccess: () {
          print('Homepage loaded successfully');
        },
      ),
    );
  }
}

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleFlexiUI(
        dataSource: const DataSourceConfig(
          type: DataSourceType.asset,
          assetPath: 'assets/promotion.json',
        ),
        onError: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error loading promotion page'),
              backgroundColor: Colors.red,
            ),
          );
        },
        onSuccess: () {
          print('Promotion page loaded successfully');
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleFlexiUI(
        dataSource: const DataSourceConfig(
          type: DataSourceType.asset,
          assetPath: 'assets/product_detail.json',
        ),
        onError: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error loading product details'),
              backgroundColor: Colors.red,
            ),
          );
        },
        onSuccess: () {
          print('Product detail page loaded successfully');
        },
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 64, color: Colors.blue),
            SizedBox(height: 16),
            Text(
              'Category Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'This page would show products for the selected category',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
