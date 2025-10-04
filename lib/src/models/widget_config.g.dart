// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetConfig _$WidgetConfigFromJson(Map<String, dynamic> json) => WidgetConfig(
  type: json['type'] as String,
  params: json['params'] as Map<String, dynamic>?,
  child:
      json['child'] == null
          ? null
          : WidgetConfig.fromJson(json['child'] as Map<String, dynamic>),
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => WidgetConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$WidgetConfigToJson(WidgetConfig instance) =>
    <String, dynamic>{
      'type': instance.type,
      'params': instance.params,
      'child': instance.child,
      'children': instance.children,
    };

TextStyleConfig _$TextStyleConfigFromJson(
  Map<String, dynamic> json,
) => TextStyleConfig(
  fontSize: (json['fontSize'] as num?)?.toDouble(),
  fontFamily: json['fontFamily'] as String?,
  fontWeight: $enumDecodeNullable(_$FlexiFontWeightEnumMap, json['fontWeight']),
  color: _colorFromJson(json['color']),
  fontStyle: $enumDecodeNullable(_$FlexiFontStyleEnumMap, json['fontStyle']),
  letterSpacing: (json['letterSpacing'] as num?)?.toDouble(),
  wordSpacing: (json['wordSpacing'] as num?)?.toDouble(),
  textBaseline: $enumDecodeNullable(
    _$FlexiTextBaselineEnumMap,
    json['textBaseline'],
  ),
  height: (json['height'] as num?)?.toDouble(),
  decoration: $enumDecodeNullable(
    _$FlexiTextDecorationEnumMap,
    json['decoration'],
  ),
  decorationColor: _colorFromJson(json['decorationColor']),
  decorationStyle: $enumDecodeNullable(
    _$FlexiTextDecorationStyleEnumMap,
    json['decorationStyle'],
  ),
  decorationThickness: (json['decorationThickness'] as num?)?.toDouble(),
);

Map<String, dynamic> _$TextStyleConfigToJson(TextStyleConfig instance) =>
    <String, dynamic>{
      'fontSize': instance.fontSize,
      'fontFamily': instance.fontFamily,
      'fontWeight': _$FlexiFontWeightEnumMap[instance.fontWeight],
      'color': _colorToJson(instance.color),
      'fontStyle': _$FlexiFontStyleEnumMap[instance.fontStyle],
      'letterSpacing': instance.letterSpacing,
      'wordSpacing': instance.wordSpacing,
      'textBaseline': _$FlexiTextBaselineEnumMap[instance.textBaseline],
      'height': instance.height,
      'decoration': _$FlexiTextDecorationEnumMap[instance.decoration],
      'decorationColor': _colorToJson(instance.decorationColor),
      'decorationStyle':
          _$FlexiTextDecorationStyleEnumMap[instance.decorationStyle],
      'decorationThickness': instance.decorationThickness,
    };

const _$FlexiFontWeightEnumMap = {
  FlexiFontWeight.w100: 'w100',
  FlexiFontWeight.w200: 'w200',
  FlexiFontWeight.w300: 'w300',
  FlexiFontWeight.w400: 'w400',
  FlexiFontWeight.w500: 'w500',
  FlexiFontWeight.w600: 'w600',
  FlexiFontWeight.w700: 'w700',
  FlexiFontWeight.w800: 'w800',
  FlexiFontWeight.w900: 'w900',
};

const _$FlexiFontStyleEnumMap = {
  FlexiFontStyle.normal: 'normal',
  FlexiFontStyle.italic: 'italic',
};

const _$FlexiTextBaselineEnumMap = {
  FlexiTextBaseline.alphabetic: 'alphabetic',
  FlexiTextBaseline.ideographic: 'ideographic',
};

const _$FlexiTextDecorationEnumMap = {
  FlexiTextDecoration.none: 'none',
  FlexiTextDecoration.underline: 'underline',
  FlexiTextDecoration.overline: 'overline',
  FlexiTextDecoration.lineThrough: 'lineThrough',
};

const _$FlexiTextDecorationStyleEnumMap = {
  FlexiTextDecorationStyle.solid: 'solid',
  FlexiTextDecorationStyle.double: 'double',
  FlexiTextDecorationStyle.dotted: 'dotted',
  FlexiTextDecorationStyle.dashed: 'dashed',
  FlexiTextDecorationStyle.wavy: 'wavy',
};

ColorConfig _$ColorConfigFromJson(Map<String, dynamic> json) => ColorConfig(
  value: (json['value'] as num?)?.toInt(),
  opacity: (json['opacity'] as num?)?.toDouble(),
  red: (json['red'] as num?)?.toInt(),
  green: (json['green'] as num?)?.toInt(),
  blue: (json['blue'] as num?)?.toInt(),
  colorName: json['colorName'] as String?,
);

Map<String, dynamic> _$ColorConfigToJson(ColorConfig instance) =>
    <String, dynamic>{
      'value': instance.value,
      'opacity': instance.opacity,
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
      'colorName': instance.colorName,
    };
