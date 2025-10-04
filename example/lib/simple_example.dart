import 'package:flutter/material.dart';
import 'package:json_ui_builder/json_ui_builder.dart';

void main() {
  runApp(const SimpleExampleApp());
}

class SimpleExampleApp extends StatelessWidget {
  const SimpleExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple FlexiUI Example',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const SimpleExamplePage(),
    );
  }
}

class SimpleExamplePage extends StatelessWidget {
  const SimpleExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple FlexiUI Examples'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExampleCard(
              context,
              'Simple Asset Example',
              'Load configuration from local assets',
              Icons.folder,
              () => _showExample(context, 'Simple Asset Example'),
            ),
            const SizedBox(height: 16),
            _buildExampleCard(
              context,
              'Simple HTTP Example',
              'Fetch configuration from HTTP',
              Icons.cloud_download,
              () => _showExample(context, 'Simple HTTP Example'),
            ),
            const SizedBox(height: 16),
            _buildExampleCard(
              context,
              'Simple Builder Example',
              'Use SimpleFlexiUIBuilder with direct configuration',
              Icons.build,
              () => _showBuilderExample(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 32, color: Colors.blue[600]),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  void _showExample(BuildContext context, String title) {
    DataSourceConfig dataSource;

    switch (title) {
      case 'Simple Asset Example':
        dataSource = const DataSourceConfig(
          type: DataSourceType.asset,
          assetPath: 'assets/simple_config.json',
        );
        break;
      case 'Simple HTTP Example':
        dataSource = const DataSourceConfig(
          type: DataSourceType.http,
          url: 'https://jsonplaceholder.typicode.com/posts/1',
          headers: {'Content-Type': 'application/json'},
          timeout: Duration(seconds: 30),
        );
        break;
      default:
        dataSource = const DataSourceConfig(
          type: DataSourceType.asset,
          assetPath: 'assets/simple_config.json',
        );
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: Text(title)),
              body: SimpleFlexiUI(
                dataSource: dataSource,
                onError: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error loading configuration'),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                onSuccess: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Configuration loaded successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              ),
            ),
      ),
    );
  }

  void _showBuilderExample(BuildContext context) {
    // Example of using SimpleFlexiUIBuilder with direct configuration
    final config = FlexiUIConfig(
      rootWidget: WidgetConfig(
        type: 'Scaffold',
        params: {'backgroundColor': 'blue'},
        child: WidgetConfig(
          type: 'Center',
          child: WidgetConfig(
            type: 'Column',
            params: {'mainAxisAlignment': 'center'},
            children: [
              WidgetConfig(
                type: 'Text',
                params: {
                  'text': 'Hello from SimpleFlexiUIBuilder!',
                  'style': {
                    'fontSize': 24,
                    'color': 'white',
                    'fontWeight': 'w700',
                  },
                },
              ),
              WidgetConfig(type: 'SizedBox', params: {'height': 16}),
              WidgetConfig(
                type: 'ElevatedButton',
                child: WidgetConfig(
                  type: 'Text',
                  params: {
                    'text': 'Click Me!',
                    'style': {'fontWeight': 'w600'},
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: const Text('Simple Builder Example')),
              body: SimpleFlexiUIBuilder(config: config),
            ),
      ),
    );
  }
}
