import 'package:flutter/material.dart';
import '../models/flexi_ui_config.dart';
import '../services/json_fetcher_service.dart';
import '../core/simple_widget_factory.dart';
import 'dart:developer' as developer;

/// Simple FlexiUI widget that renders UI from JSON configuration
class SimpleFlexiUI extends StatefulWidget {
  final DataSourceConfig dataSource;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final VoidCallback? onError;
  final VoidCallback? onSuccess;

  const SimpleFlexiUI({
    super.key,
    required this.dataSource,
    this.loadingWidget,
    this.errorWidget,
    this.onError,
    this.onSuccess,
  });

  @override
  State<SimpleFlexiUI> createState() => _SimpleFlexiUIState();
}

class _SimpleFlexiUIState extends State<SimpleFlexiUI> {
  FlexiUIConfig? _config;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    developer.log('SimpleFlexiUI: initState called', name: 'FlexiUI');
    _loadConfiguration();
    _setupNavigation();
  }

  void _setupNavigation() {
    SimpleWidgetFactory.onNavigation =
        (String type, Map<String, dynamic> params) {
      developer.log(
          'SimpleFlexiUI: Navigation triggered - type: $type, params: $params',
          name: 'FlexiUI');
      _handleNavigation(type, params);
    };
  }

  void _handleNavigation(String type, Map<String, dynamic> params) {
    final id = params['id'] as String?;
    if (id == null) return;

    switch (type) {
      case 'promotion':
        _navigateToPromotion(id);
        break;
      case 'product':
        _navigateToProduct(id);
        break;
      case 'category':
        _navigateToCategory(id);
        break;
    }
  }

  void _navigateToPromotion(String promotionId) {
    if (!mounted) return;
    developer.log('SimpleFlexiUI: Navigating to promotion: $promotionId',
        name: 'FlexiUI');
    Navigator.pushNamed(
      context,
      '/promotion',
      arguments: {'promotionId': promotionId},
    );
  }

  void _navigateToProduct(String productId) {
    if (!mounted) return;
    developer.log('SimpleFlexiUI: Navigating to product: $productId',
        name: 'FlexiUI');
    // For now, just show a snackbar - in a real app, you'd navigate to a product page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to product: $productId')),
    );
  }

  void _navigateToCategory(String categoryId) {
    if (!mounted) return;
    developer.log('SimpleFlexiUI: Navigating to category: $categoryId',
        name: 'FlexiUI');
    // For now, just show a snackbar - in a real app, you'd navigate to a category page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to category: $categoryId')),
    );
  }

  Future<void> _loadConfiguration() async {
    try {
      developer.log('SimpleFlexiUI: Starting configuration load',
          name: 'FlexiUI');
      setState(() {
        _isLoading = true;
        _error = null;
      });

      developer.log('SimpleFlexiUI: DataSource type: ${widget.dataSource.type}',
          name: 'FlexiUI');
      final fetcher = JsonFetcherServiceFactory.create(widget.dataSource.type);
      developer.log('SimpleFlexiUI: Fetcher created: ${fetcher.runtimeType}',
          name: 'FlexiUI');

      final config = await fetcher.fetchConfig(widget.dataSource);
      developer.log('SimpleFlexiUI: Configuration loaded successfully',
          name: 'FlexiUI');
      developer.log(
          'SimpleFlexiUI: Root widget type: ${config.rootWidget.type}',
          name: 'FlexiUI');

      if (mounted) {
        setState(() {
          _config = config;
          _isLoading = false;
        });
        developer.log('SimpleFlexiUI: State updated with config',
            name: 'FlexiUI');
        widget.onSuccess?.call();
      }
    } catch (e) {
      developer.log('SimpleFlexiUI: Error loading configuration: $e',
          name: 'FlexiUI');
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
        widget.onError?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    developer.log(
        'SimpleFlexiUI: build called - isLoading: $_isLoading, error: $_error, config: ${_config != null}',
        name: 'FlexiUI');

    if (_isLoading) {
      developer.log('SimpleFlexiUI: Showing loading widget', name: 'FlexiUI');
      return widget.loadingWidget ?? const _DefaultLoadingWidget();
    }

    if (_error != null) {
      developer.log('SimpleFlexiUI: Showing error widget: $_error',
          name: 'FlexiUI');
      return widget.errorWidget ??
          _DefaultErrorWidget(error: _error!, onRetry: _loadConfiguration);
    }

    if (_config == null) {
      developer.log('SimpleFlexiUI: No configuration available',
          name: 'FlexiUI');
      return const _DefaultErrorWidget(
        error: 'No configuration loaded',
        onRetry: null,
      );
    }

    developer.log('SimpleFlexiUI: Creating SimpleFlexiUIBuilder with config',
        name: 'FlexiUI');
    return SimpleFlexiUIBuilder(config: _config!);
  }
}

/// Simple builder widget for creating FlexiUI with custom configuration
class SimpleFlexiUIBuilder extends StatelessWidget {
  final FlexiUIConfig config;
  final Widget? fallbackWidget;

  const SimpleFlexiUIBuilder({
    super.key,
    required this.config,
    this.fallbackWidget,
  });

  @override
  Widget build(BuildContext context) {
    developer.log(
        'SimpleFlexiUIBuilder: build called with root widget type: ${config.rootWidget.type}',
        name: 'FlexiUI');
    try {
      final widget = SimpleWidgetFactory.createWidget(config.rootWidget);
      developer.log(
          'SimpleFlexiUIBuilder: Widget created successfully: ${widget.runtimeType}',
          name: 'FlexiUI');
      return widget;
    } catch (e) {
      developer.log('SimpleFlexiUIBuilder: Error creating widget: $e',
          name: 'FlexiUI');
      return fallbackWidget ??
          _DefaultErrorWidget(error: 'Error rendering UI: $e', onRetry: null);
    }
  }
}

/// Default loading widget
class _DefaultLoadingWidget extends StatelessWidget {
  const _DefaultLoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading UI configuration...'),
          ],
        ),
      ),
    );
  }
}

/// Default error widget
class _DefaultErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback? onRetry;

  const _DefaultErrorWidget({required this.error, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Error loading UI configuration',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                error,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              if (onRetry != null) ...[
                const SizedBox(height: 16),
                ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
