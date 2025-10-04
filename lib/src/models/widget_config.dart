import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'widget_config.g.dart';

/// Base class for all widget configurations
@JsonSerializable()
class WidgetConfig {
  final String type;
  final Map<String, dynamic>? params;
  final WidgetConfig? child;
  final List<WidgetConfig>? children;

  const WidgetConfig({
    required this.type,
    this.params,
    this.child,
    this.children,
  });

  factory WidgetConfig.fromJson(Map<String, dynamic> json) =>
      _$WidgetConfigFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetConfigToJson(this);
}

/// Configuration for TextStyle
@JsonSerializable()
class TextStyleConfig {
  final double? fontSize;
  final String? fontFamily;
  final FlexiFontWeight? fontWeight;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color? color;
  final FlexiFontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final FlexiTextBaseline? textBaseline;
  final double? height;
  final FlexiTextDecoration? decoration;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color? decorationColor;
  final FlexiTextDecorationStyle? decorationStyle;
  final double? decorationThickness;

  const TextStyleConfig({
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.color,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
  });

  factory TextStyleConfig.fromJson(Map<String, dynamic> json) =>
      _$TextStyleConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TextStyleConfigToJson(this);
}

/// Configuration for Color
@JsonSerializable()
class ColorConfig {
  final int? value;
  final double? opacity;
  final int? red;
  final int? green;
  final int? blue;
  final String? colorName; // For named colors like 'red', 'blue', etc.

  const ColorConfig({
    this.value,
    this.opacity,
    this.red,
    this.green,
    this.blue,
    this.colorName,
  });

  factory ColorConfig.fromJson(Map<String, dynamic> json) =>
      _$ColorConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ColorConfigToJson(this);
}

/// Enum for FontWeight
enum FlexiFontWeight {
  @JsonValue('w100')
  w100,
  @JsonValue('w200')
  w200,
  @JsonValue('w300')
  w300,
  @JsonValue('w400')
  w400,
  @JsonValue('w500')
  w500,
  @JsonValue('w600')
  w600,
  @JsonValue('w700')
  w700,
  @JsonValue('w800')
  w800,
  @JsonValue('w900')
  w900,
}

/// Enum for FontStyle
enum FlexiFontStyle {
  @JsonValue('normal')
  normal,
  @JsonValue('italic')
  italic,
}

/// Enum for TextBaseline
enum FlexiTextBaseline {
  @JsonValue('alphabetic')
  alphabetic,
  @JsonValue('ideographic')
  ideographic,
}

/// Enum for TextDecoration
enum FlexiTextDecoration {
  @JsonValue('none')
  none,
  @JsonValue('underline')
  underline,
  @JsonValue('overline')
  overline,
  @JsonValue('lineThrough')
  lineThrough,
}

/// Enum for TextDecorationStyle
enum FlexiTextDecorationStyle {
  @JsonValue('solid')
  solid,
  @JsonValue('double')
  double,
  @JsonValue('dotted')
  dotted,
  @JsonValue('dashed')
  dashed,
  @JsonValue('wavy')
  wavy,
}

// Helper functions for Color serialization
Color? _colorFromJson(dynamic json) {
  if (json == null) return null;
  if (json is int) return Color(json);
  if (json is String) {
    switch (json.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'pink':
        return Colors.pink;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'grey':
      case 'gray':
        return Colors.grey;
      default:
        return null;
    }
  }
  if (json is Map<String, dynamic>) {
    if (json['value'] != null) {
      return Color(json['value']);
    }
    if (json['red'] != null && json['green'] != null && json['blue'] != null) {
      return Color.fromRGBO(
        json['red'],
        json['green'],
        json['blue'],
        json['opacity'] ?? 1.0,
      );
    }
  }
  return null;
}

dynamic _colorToJson(Color? color) {
  if (color == null) return null;
  return color.value; // ignore: deprecated_member_use
}
