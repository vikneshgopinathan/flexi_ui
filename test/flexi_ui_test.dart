import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_ui_builder/json_ui_builder.dart';

void main() {
  group('WidgetConfig', () {
    test('should create WidgetConfig from JSON', () {
      final json = {
        'type': 'Text',
        'params': {
          'text': 'Hello World',
          'style': {
            'fontSize': 16,
            'color': 'blue',
          }
        }
      };

      final config = WidgetConfig.fromJson(json);
      expect(config.type, 'Text');
      expect(config.params?['text'], 'Hello World');
      expect(config.params?['style']?['fontSize'], 16);
    });

    test('should convert WidgetConfig to JSON', () {
      final config = WidgetConfig(
        type: 'Container',
        params: {
          'width': 100,
          'height': 50,
        },
        child: WidgetConfig(
          type: 'Text',
          params: {'text': 'Test'},
        ),
      );

      final json = config.toJson();
      expect(json['type'], 'Container');
      expect(json['params']?['width'], 100);
      expect(json['child']?['type'], 'Text');
    });
  });

  group('DataSourceConfig', () {
    test('should create HTTP data source', () {
      final config = DataSourceConfig(
        type: DataSourceType.http,
        url: 'https://example.com/config.json',
        headers: {'Authorization': 'Bearer token'},
        timeout: const Duration(seconds: 30),
      );

      expect(config.type, DataSourceType.http);
      expect(config.url, 'https://example.com/config.json');
      expect(config.headers?['Authorization'], 'Bearer token');
      expect(config.timeout, const Duration(seconds: 30));
    });

    test('should create asset data source', () {
      final config = DataSourceConfig(
        type: DataSourceType.asset,
        assetPath: 'assets/config.json',
      );

      expect(config.type, DataSourceType.asset);
      expect(config.assetPath, 'assets/config.json');
    });
  });

  group('SimpleWidgetFactory', () {
    testWidgets('should create Text widget', (WidgetTester tester) async {
      final config = WidgetConfig(
        type: 'Text',
        params: {
          'text': 'Hello World',
          'style': {
            'fontSize': 16,
            'color': 'blue',
          }
        },
      );

      final widget = SimpleWidgetFactory.createWidget(config);
      expect(widget, isA<Text>());

      await tester.pumpWidget(MaterialApp(home: widget));
      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('should create Container widget', (WidgetTester tester) async {
      final config = WidgetConfig(
        type: 'Container',
        params: {
          'width': 100,
          'height': 50,
          'color': 'red',
        },
        child: WidgetConfig(
          type: 'Text',
          params: {'text': 'Container Text'},
        ),
      );

      final widget = SimpleWidgetFactory.createWidget(config);
      expect(widget, isA<Container>());

      await tester.pumpWidget(MaterialApp(home: widget));
      expect(find.text('Container Text'), findsOneWidget);
    });

    testWidgets('should create Column widget', (WidgetTester tester) async {
      final config = WidgetConfig(
        type: 'Column',
        params: {
          'mainAxisAlignment': 'center',
        },
        children: [
          WidgetConfig(
            type: 'Text',
            params: {'text': 'First'},
          ),
          WidgetConfig(
            type: 'Text',
            params: {'text': 'Second'},
          ),
        ],
      );

      final widget = SimpleWidgetFactory.createWidget(config);
      expect(widget, isA<Column>());

      await tester.pumpWidget(MaterialApp(home: widget));
      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('should create Scaffold widget', (WidgetTester tester) async {
      final config = WidgetConfig(
        type: 'Scaffold',
        params: {
          'backgroundColor': 'blue',
        },
        child: WidgetConfig(
          type: 'Center',
          child: WidgetConfig(
            type: 'Text',
            params: {'text': 'Scaffold Content'},
          ),
        ),
      );

      final widget = SimpleWidgetFactory.createWidget(config);
      expect(widget, isA<Scaffold>());

      await tester.pumpWidget(MaterialApp(home: widget));
      expect(find.text('Scaffold Content'), findsOneWidget);
    });
  });

  group('FlexiUI Widget', () {
    testWidgets('should show loading widget initially',
        (WidgetTester tester) async {
      const dataSource = DataSourceConfig(
        type: DataSourceType.asset,
        assetPath: 'non_existent.json',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: SimpleFlexiUI(dataSource: dataSource),
        ),
      );

      expect(find.text('Loading UI configuration...'), findsOneWidget);
    });

    testWidgets('should show error widget on failure',
        (WidgetTester tester) async {
      const dataSource = DataSourceConfig(
        type: DataSourceType.asset,
        assetPath: 'non_existent.json',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: SimpleFlexiUI(dataSource: dataSource),
        ),
      );

      // Wait for async operation
      await tester.pumpAndSettle();

      expect(find.text('Error loading UI configuration'), findsOneWidget);
    });
  });

  group('Color parsing', () {
    test('should parse named colors', () {
      expect(
          SimpleWidgetFactory.createWidget(WidgetConfig(
            type: 'Container',
            params: {'color': 'red'},
          )),
          isA<Container>());

      expect(
          SimpleWidgetFactory.createWidget(WidgetConfig(
            type: 'Container',
            params: {'color': 'blue'},
          )),
          isA<Container>());
    });

    test('should parse color values', () {
      expect(
          SimpleWidgetFactory.createWidget(WidgetConfig(
            type: 'Container',
            params: {
              'color': {'value': 0xFF0000FF}
            },
          )),
          isA<Container>());
    });
  });

  group('TextStyle parsing', () {
    testWidgets('should parse TextStyle parameters',
        (WidgetTester tester) async {
      final config = WidgetConfig(
        type: 'Text',
        params: {
          'text': 'Styled Text',
          'style': {
            'fontSize': 20,
            'fontWeight': 'w700',
            'color': 'red',
            'fontStyle': 'italic',
          }
        },
      );

      await tester.pumpWidget(
          MaterialApp(home: SimpleWidgetFactory.createWidget(config)));
      expect(find.text('Styled Text'), findsOneWidget);
    });
  });
}
