import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/flexi_ui_config.dart';
import 'dart:developer' as developer;

/// Abstract class for JSON fetching
abstract class JsonFetcherService {
  Future<FlexiUIConfig> fetchConfig(DataSourceConfig config);
}

/// Service for fetching JSON from HTTP
class HttpJsonFetcherService implements JsonFetcherService {
  @override
  Future<FlexiUIConfig> fetchConfig(DataSourceConfig config) async {
    if (config.type != DataSourceType.http || config.url == null) {
      throw ArgumentError('Invalid HTTP configuration');
    }

    try {
      final uri = Uri.parse(config.url!);
      final response = await http
          .get(
            uri,
            headers: config.headers,
          )
          .timeout(config.timeout ?? const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return FlexiUIConfig.fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch JSON: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching JSON from HTTP: $e');
    }
  }
}

/// Service for fetching JSON from local assets
class AssetJsonFetcherService implements JsonFetcherService {
  @override
  Future<FlexiUIConfig> fetchConfig(DataSourceConfig config) async {
    developer.log(
        'AssetJsonFetcher: Starting asset fetch for path: ${config.assetPath}',
        name: 'FlexiUI');
    if (config.type != DataSourceType.asset || config.assetPath == null) {
      throw ArgumentError('Invalid asset configuration');
    }

    try {
      developer.log('AssetJsonFetcher: Loading asset string', name: 'FlexiUI');
      final jsonString = await rootBundle.loadString(config.assetPath!);
      developer.log(
          'AssetJsonFetcher: Asset loaded, length: ${jsonString.length}',
          name: 'FlexiUI');
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      developer.log('AssetJsonFetcher: JSON decoded successfully',
          name: 'FlexiUI');
      return FlexiUIConfig.fromJson(jsonData);
    } catch (e) {
      developer.log('AssetJsonFetcher: Error: $e', name: 'FlexiUI');
      throw Exception('Error loading JSON from asset: $e');
    }
  }
}

/// Service for fetching JSON from local file system
class LocalJsonFetcherService implements JsonFetcherService {
  @override
  Future<FlexiUIConfig> fetchConfig(DataSourceConfig config) async {
    if (config.type != DataSourceType.local || config.assetPath == null) {
      throw ArgumentError('Invalid local file configuration');
    }

    try {
      final file = File(config.assetPath!);
      if (!await file.exists()) {
        throw Exception('File does not exist: ${config.assetPath}');
      }

      final jsonString = await file.readAsString();
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      return FlexiUIConfig.fromJson(jsonData);
    } catch (e) {
      throw Exception('Error reading JSON from local file: $e');
    }
  }
}

/// Factory for creating appropriate JSON fetcher service
class JsonFetcherServiceFactory {
  static JsonFetcherService create(DataSourceType type) {
    switch (type) {
      case DataSourceType.http:
        return HttpJsonFetcherService();
      case DataSourceType.asset:
        return AssetJsonFetcherService();
      case DataSourceType.local:
        return LocalJsonFetcherService();
    }
  }
}
