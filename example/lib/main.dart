import 'package:flutter/material.dart';
import 'ecommerce_example.dart' as ecommerce;
import 'simple_example.dart';
import 'promotion_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexiUI Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      home: const ExamplePage(),
      routes: {
        '/promotion': (context) => const PromotionPage(promotionId: 'default'),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/promotion') {
          final args = settings.arguments as Map<String, dynamic>?;
          final promotionId = args?['promotionId'] as String? ?? 'default';
          return MaterialPageRoute(
            builder: (context) => PromotionPage(promotionId: promotionId),
          );
        }
        return null;
      },
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const Icon(Icons.dynamic_feed, size: 80, color: Colors.white),
                const SizedBox(height: 24),
                const Text(
                  'FlexiUI Examples',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Server-driven UI library for Flutter',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                const Text(
                  'Choose an example to explore:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                _buildExampleCard(
                  context,
                  title: '🛍️ E-Commerce App',
                  description:
                      'Complete e-commerce app with homepage, promotions, and product details',
                  icon: Icons.shopping_cart,
                  color: Colors.green,
                  onTap: () => _navigateToEcommerce(context),
                ),
                const SizedBox(height: 16),
                _buildExampleCard(
                  context,
                  title: '📱 Simple Example',
                  description: 'Basic FlexiUI usage with asset data source',
                  icon: Icons.lightbulb,
                  color: Colors.orange,
                  onTap: () => _navigateToSimple(context),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Documentation & Resources',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                _buildDocumentationCard(
                  context,
                  title: '📚 Complete Documentation',
                  description: 'Comprehensive widget reference with examples',
                  icon: Icons.book,
                  color: Colors.blue,
                  onTap: () => _openDocumentation(context),
                ),
                const SizedBox(height: 16),
                _buildDocumentationCard(
                  context,
                  title: '🔗 GitHub Repository',
                  description: 'View source code and contribute',
                  icon: Icons.code,
                  color: Colors.grey,
                  onTap: () => _openGitHub(context),
                ),
                const SizedBox(height: 16),
                _buildDocumentationCard(
                  context,
                  title: '📦 Pub.dev Package',
                  description: 'Install and use FlexiUI in your project',
                  icon: Icons.public,
                  color: Colors.purple,
                  onTap: () => _openPubDev(context),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: const Text(
                    'FlexiUI enables dynamic UI creation from JSON configurations with support for HTTP, asset, and local data sources.',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: color, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentationCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.15), color.withOpacity(0.08)],
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 24, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.open_in_new, color: color, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToEcommerce(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ecommerce.EcommerceApp()),
    );
  }

  void _navigateToSimple(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SimpleExamplePage()),
    );
  }

  void _openDocumentation(BuildContext context) {
    // Open documentation in browser
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening documentation...'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _openGitHub(BuildContext context) {
    // Open GitHub repository
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening GitHub repository...'),
        backgroundColor: Colors.grey,
      ),
    );
  }

  void _openPubDev(BuildContext context) {
    // Open pub.dev package page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening pub.dev package page...'),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
