// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flexi_ui_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlexiUIConfig _$FlexiUIConfigFromJson(Map<String, dynamic> json) =>
    FlexiUIConfig(
      rootWidget: WidgetConfig.fromJson(
        json['rootWidget'] as Map<String, dynamic>,
      ),
      version: json['version'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FlexiUIConfigToJson(FlexiUIConfig instance) =>
    <String, dynamic>{
      'rootWidget': instance.rootWidget,
      'version': instance.version,
      'metadata': instance.metadata,
    };

DataSourceConfig _$DataSourceConfigFromJson(Map<String, dynamic> json) =>
    DataSourceConfig(
      type: $enumDecode(_$DataSourceTypeEnumMap, json['type']),
      url: json['url'] as String?,
      assetPath: json['assetPath'] as String?,
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      timeout:
          json['timeout'] == null
              ? null
              : Duration(microseconds: (json['timeout'] as num).toInt()),
    );

Map<String, dynamic> _$DataSourceConfigToJson(DataSourceConfig instance) =>
    <String, dynamic>{
      'type': _$DataSourceTypeEnumMap[instance.type]!,
      'url': instance.url,
      'assetPath': instance.assetPath,
      'headers': instance.headers,
      'timeout': instance.timeout?.inMicroseconds,
    };

const _$DataSourceTypeEnumMap = {
  DataSourceType.local: 'local',
  DataSourceType.http: 'http',
  DataSourceType.asset: 'asset',
};
