import 'package:json_annotation/json_annotation.dart';
import 'widget_config.dart';

part 'flexi_ui_config.g.dart';

/// Main configuration class for FlexiUI
@JsonSerializable()
class FlexiUIConfig {
  final WidgetConfig rootWidget;
  final String? version;
  final Map<String, dynamic>? metadata;

  const FlexiUIConfig({
    required this.rootWidget,
    this.version,
    this.metadata,
  });

  factory FlexiUIConfig.fromJson(Map<String, dynamic> json) =>
      _$FlexiUIConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FlexiUIConfigToJson(this);
}

/// Configuration for data source
@JsonSerializable()
class DataSourceConfig {
  final DataSourceType type;
  final String? url;
  final String? assetPath;
  final Map<String, String>? headers;
  final Duration? timeout;

  const DataSourceConfig({
    required this.type,
    this.url,
    this.assetPath,
    this.headers,
    this.timeout,
  });

  factory DataSourceConfig.fromJson(Map<String, dynamic> json) =>
      _$DataSourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceConfigToJson(this);
}

/// Enum for data source types
enum DataSourceType {
  @JsonValue('local')
  local,
  @JsonValue('http')
  http,
  @JsonValue('asset')
  asset,
}
