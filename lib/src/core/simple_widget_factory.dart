import 'package:flutter/material.dart';
import '../models/widget_config.dart';
import 'dart:developer' as developer;

/// Simple widget factory that handles basic widgets without complex parameter parsing
class SimpleWidgetFactory {
  static Function(String, Map<String, dynamic>)? onNavigation;

  static Widget createWidget(WidgetConfig config) {
    developer.log(
        'SimpleWidgetFactory: Creating widget of type: ${config.type}',
        name: 'FlexiUI');
    switch (config.type) {
      case 'Scaffold':
        return _createScaffold(config);
      case 'Column':
        return _createColumn(config);
      case 'Row':
        return _createRow(config);
      case 'Text':
        return _createText(config);
      case 'Container':
        return _createContainer(config);
      case 'Padding':
        return _createPadding(config);
      case 'Center':
        return _createCenter(config);
      case 'Expanded':
        return _createExpanded(config);
      case 'Flexible':
        return _createFlexible(config);
      case 'SizedBox':
        return _createSizedBox(config);
      case 'AppBar':
        return _createAppBar(config);
      case 'ElevatedButton':
        return _createElevatedButton(config);
      case 'TextButton':
        return _createTextButton(config);
      case 'IconButton':
        return _createIconButton(config);
      case 'Card':
        return _createCard(config);
      case 'ListView':
        return _createListView(config);
      case 'GridView':
        return _createGridView(config);
      case 'PageView':
        return _createPageView(config);
      case 'Icon':
        return _createIcon(config);
      case 'Divider':
        return _createDivider(config);
      case 'Spacer':
        return _createSpacer(config);
      case 'GestureDetector':
        return _createGestureDetector(config);
      default:
        return _createFallbackWidget(config);
    }
  }

  static Widget _createScaffold(WidgetConfig config) {
    final params = config.params ?? {};
    return Scaffold(
      appBar: params['appBar'] != null
          ? createWidget(WidgetConfig.fromJson(params['appBar']))
              as PreferredSizeWidget?
          : null,
      backgroundColor: _parseColor(params['backgroundColor']),
      body: config.child != null ? createWidget(config.child!) : null,
      floatingActionButton: params['floatingActionButton'] != null
          ? createWidget(
              WidgetConfig.fromJson(params['floatingActionButton']),
            )
          : null,
    );
  }

  static Widget _createColumn(WidgetConfig config) {
    final params = config.params ?? {};
    return Column(
      mainAxisAlignment: _parseMainAxisAlignment(params['mainAxisAlignment']) ??
          MainAxisAlignment.start,
      crossAxisAlignment:
          _parseCrossAxisAlignment(params['crossAxisAlignment']) ??
              CrossAxisAlignment.center,
      mainAxisSize:
          _parseMainAxisSize(params['mainAxisSize']) ?? MainAxisSize.max,
      children: config.children?.map(createWidget).toList() ?? [],
    );
  }

  static Widget _createRow(WidgetConfig config) {
    final params = config.params ?? {};
    return Row(
      mainAxisAlignment: _parseMainAxisAlignment(params['mainAxisAlignment']) ??
          MainAxisAlignment.start,
      crossAxisAlignment:
          _parseCrossAxisAlignment(params['crossAxisAlignment']) ??
              CrossAxisAlignment.center,
      mainAxisSize:
          _parseMainAxisSize(params['mainAxisSize']) ?? MainAxisSize.max,
      children: config.children?.map(createWidget).toList() ?? [],
    );
  }

  static Widget _createText(WidgetConfig config) {
    final params = config.params ?? {};
    return Text(
      params['text'] ?? '',
      style: _parseTextStyle(params['style']),
      textAlign: _parseTextAlign(params['textAlign']),
      maxLines: params['maxLines'],
      overflow: _parseTextOverflow(params['overflow']),
    );
  }

  static Widget _createContainer(WidgetConfig config) {
    final params = config.params ?? {};
    return Container(
      width: _parseDouble(params['width']),
      height: _parseDouble(params['height']),
      padding: _parseEdgeInsets(params['padding']),
      margin: _parseEdgeInsets(params['margin']),
      decoration: _parseBoxDecoration(params['decoration']),
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createPadding(WidgetConfig config) {
    final params = config.params ?? {};
    return Padding(
      padding: _parseEdgeInsets(params['padding']) ?? EdgeInsets.zero,
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createCenter(WidgetConfig config) {
    return Center(
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createExpanded(WidgetConfig config) {
    final params = config.params ?? {};
    return Expanded(
      flex: params['flex'] ?? 1,
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createFlexible(WidgetConfig config) {
    final params = config.params ?? {};
    return Flexible(
      flex: params['flex'] ?? 1,
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createSizedBox(WidgetConfig config) {
    final params = config.params ?? {};
    return SizedBox(
      width: params['width']?.toDouble(),
      height: params['height']?.toDouble(),
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createAppBar(WidgetConfig config) {
    final params = config.params ?? {};
    return AppBar(
      title: params['title'] != null
          ? createWidget(WidgetConfig.fromJson(params['title']))
          : null,
      backgroundColor: _parseColor(params['backgroundColor']),
      elevation: params['elevation']?.toDouble(),
    );
  }

  static Widget _createElevatedButton(WidgetConfig config) {
    final params = config.params ?? {};
    return ElevatedButton(
      onPressed: params['onPressed'] != null ? () {} : null,
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createTextButton(WidgetConfig config) {
    final params = config.params ?? {};
    return TextButton(
      onPressed: params['onPressed'] != null ? () {} : null,
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createIconButton(WidgetConfig config) {
    final params = config.params ?? {};
    return IconButton(
      onPressed: params['onPressed'] != null ? () {} : null,
      icon: params['icon'] != null
          ? createWidget(WidgetConfig.fromJson(params['icon']))
          : const Icon(Icons.star),
    );
  }

  static Widget _createCard(WidgetConfig config) {
    final params = config.params ?? {};
    return Card(
      elevation: params['elevation']?.toDouble(),
      color: _parseColor(params['color']),
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createListView(WidgetConfig config) {
    final params = config.params ?? {};
    return ListView(
      padding: _parseEdgeInsets(params['padding']),
      children: config.children?.map(createWidget).toList() ?? [],
    );
  }

  static Widget _createIcon(WidgetConfig config) {
    final params = config.params ?? {};
    return Icon(
      _parseIconData(params['icon']),
      size: params['size']?.toDouble(),
      color: _parseColor(params['color']),
    );
  }

  static Widget _createDivider(WidgetConfig config) {
    final params = config.params ?? {};
    return Divider(
      height: params['height']?.toDouble(),
      thickness: params['thickness']?.toDouble(),
      color: _parseColor(params['color']),
    );
  }

  static Widget _createSpacer(WidgetConfig config) {
    final params = config.params ?? {};
    return Spacer(flex: params['flex'] ?? 1);
  }

  static Widget _createFallbackWidget(WidgetConfig config) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Unsupported widget: ${config.type}',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  // Helper methods for parsing parameters
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      if (value == 'double.infinity') return double.infinity;
      return double.tryParse(value);
    }
    return null;
  }

  static Color? _parseColor(dynamic colorValue) {
    if (colorValue == null) return null;
    if (colorValue is String) {
      switch (colorValue.toLowerCase()) {
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
    if (colorValue is int) return Color(colorValue);
    return null;
  }

  static TextStyle? _parseTextStyle(dynamic styleValue) {
    if (styleValue == null) return null;
    if (styleValue is! Map<String, dynamic>) return null;

    return TextStyle(
      fontSize: styleValue['fontSize']?.toDouble(),
      fontFamily: styleValue['fontFamily'],
      fontWeight: _parseFontWeight(styleValue['fontWeight']),
      color: _parseColor(styleValue['color']),
      fontStyle: _parseFontStyle(styleValue['fontStyle']),
      letterSpacing: styleValue['letterSpacing']?.toDouble(),
      wordSpacing: styleValue['wordSpacing']?.toDouble(),
      height: styleValue['height']?.toDouble(),
      decoration: _parseTextDecoration(styleValue['decoration']),
      decorationColor: _parseColor(styleValue['decorationColor']),
      decorationStyle: _parseTextDecorationStyle(styleValue['decorationStyle']),
      decorationThickness: styleValue['decorationThickness']?.toDouble(),
    );
  }

  static FontWeight? _parseFontWeight(dynamic weightValue) {
    if (weightValue is String) {
      switch (weightValue) {
        case 'w100':
          return FontWeight.w100;
        case 'w200':
          return FontWeight.w200;
        case 'w300':
          return FontWeight.w300;
        case 'w400':
          return FontWeight.w400;
        case 'w500':
          return FontWeight.w500;
        case 'w600':
          return FontWeight.w600;
        case 'w700':
          return FontWeight.w700;
        case 'w800':
          return FontWeight.w800;
        case 'w900':
          return FontWeight.w900;
        default:
          return null;
      }
    }
    return null;
  }

  static FontStyle? _parseFontStyle(dynamic styleValue) {
    if (styleValue == 'italic') return FontStyle.italic;
    return FontStyle.normal;
  }

  static TextDecoration? _parseTextDecoration(dynamic decorationValue) {
    if (decorationValue == 'underline') return TextDecoration.underline;
    if (decorationValue == 'lineThrough') return TextDecoration.lineThrough;
    if (decorationValue == 'overline') return TextDecoration.overline;
    return TextDecoration.none;
  }

  static TextDecorationStyle? _parseTextDecorationStyle(dynamic styleValue) {
    if (styleValue == 'solid') return TextDecorationStyle.solid;
    if (styleValue == 'double') return TextDecorationStyle.double;
    if (styleValue == 'dotted') return TextDecorationStyle.dotted;
    if (styleValue == 'dashed') return TextDecorationStyle.dashed;
    if (styleValue == 'wavy') return TextDecorationStyle.wavy;
    return TextDecorationStyle.solid;
  }

  static TextAlign? _parseTextAlign(dynamic alignValue) {
    if (alignValue == 'left') return TextAlign.left;
    if (alignValue == 'right') return TextAlign.right;
    if (alignValue == 'center') return TextAlign.center;
    if (alignValue == 'justify') return TextAlign.justify;
    return null;
  }

  static TextOverflow? _parseTextOverflow(dynamic overflowValue) {
    if (overflowValue == 'ellipsis') return TextOverflow.ellipsis;
    if (overflowValue == 'clip') return TextOverflow.clip;
    if (overflowValue == 'fade') return TextOverflow.fade;
    return null;
  }

  static MainAxisAlignment? _parseMainAxisAlignment(dynamic alignValue) {
    if (alignValue == 'start') return MainAxisAlignment.start;
    if (alignValue == 'end') return MainAxisAlignment.end;
    if (alignValue == 'center') return MainAxisAlignment.center;
    if (alignValue == 'spaceBetween') return MainAxisAlignment.spaceBetween;
    if (alignValue == 'spaceAround') return MainAxisAlignment.spaceAround;
    if (alignValue == 'spaceEvenly') return MainAxisAlignment.spaceEvenly;
    return null;
  }

  static CrossAxisAlignment? _parseCrossAxisAlignment(dynamic alignValue) {
    if (alignValue == 'start') return CrossAxisAlignment.start;
    if (alignValue == 'end') return CrossAxisAlignment.end;
    if (alignValue == 'center') return CrossAxisAlignment.center;
    if (alignValue == 'stretch') return CrossAxisAlignment.stretch;
    if (alignValue == 'baseline') return CrossAxisAlignment.baseline;
    return null;
  }

  static MainAxisSize? _parseMainAxisSize(dynamic sizeValue) {
    if (sizeValue == 'min') return MainAxisSize.min;
    if (sizeValue == 'max') return MainAxisSize.max;
    return null;
  }

  static EdgeInsets? _parseEdgeInsets(dynamic edgeInsetsValue) {
    if (edgeInsetsValue is Map<String, dynamic>) {
      return EdgeInsets.only(
        left: edgeInsetsValue['left']?.toDouble() ?? 0,
        top: edgeInsetsValue['top']?.toDouble() ?? 0,
        right: edgeInsetsValue['right']?.toDouble() ?? 0,
        bottom: edgeInsetsValue['bottom']?.toDouble() ?? 0,
      );
    }
    if (edgeInsetsValue is num) {
      return EdgeInsets.all(edgeInsetsValue.toDouble());
    }
    return null;
  }

  static BorderRadius? _parseBorderRadius(dynamic radiusValue) {
    if (radiusValue is num) {
      return BorderRadius.circular(radiusValue.toDouble());
    }
    if (radiusValue is Map<String, dynamic>) {
      return BorderRadius.only(
        topLeft: Radius.circular(radiusValue['topLeft']?.toDouble() ?? 0),
        topRight: Radius.circular(radiusValue['topRight']?.toDouble() ?? 0),
        bottomLeft: Radius.circular(radiusValue['bottomLeft']?.toDouble() ?? 0),
        bottomRight: Radius.circular(
          radiusValue['bottomRight']?.toDouble() ?? 0,
        ),
      );
    }
    return null;
  }


  static IconData? _parseIconData(dynamic iconValue) {
    if (iconValue is String) {
      // Simple icon mapping
      switch (iconValue.toLowerCase()) {
        case 'star':
          return Icons.star;
        case 'home':
          return Icons.home;
        case 'settings':
          return Icons.settings;
        case 'search':
          return Icons.search;
        case 'menu':
          return Icons.menu;
        case 'close':
          return Icons.close;
        case 'add':
          return Icons.add;
        case 'remove':
          return Icons.remove;
        case 'edit':
          return Icons.edit;
        case 'delete':
          return Icons.delete;
        default:
          return Icons.star;
      }
    }
    return Icons.star;
  }

  static Widget _createGestureDetector(WidgetConfig config) {
    final params = config.params ?? {};
    return GestureDetector(
      onTap: () {
        developer.log('GestureDetector: onTap triggered', name: 'FlexiUI');
        // Handle navigation based on parameters
        final onTap = params['onTap'];
        if (onTap == 'navigate_to_promotion') {
          final promotionId = params['promotionId'];
          developer.log(
              'GestureDetector: Navigating to promotion: $promotionId',
              name: 'FlexiUI');
          onNavigation?.call('promotion', {'id': promotionId});
        } else if (onTap == 'navigate_to_product') {
          final productId = params['productId'];
          developer.log('GestureDetector: Navigating to product: $productId',
              name: 'FlexiUI');
          onNavigation?.call('product', {'id': productId});
        } else if (onTap == 'navigate_to_category') {
          final categoryId = params['categoryId'];
          developer.log('GestureDetector: Navigating to category: $categoryId',
              name: 'FlexiUI');
          onNavigation?.call('category', {'id': categoryId});
        }
      },
      child: config.child != null
          ? createWidget(config.child!)
          : const SizedBox.shrink(),
    );
  }

  static Widget _createGridView(WidgetConfig config) {
    final params = config.params ?? {};
    final children = config.children ?? [];

    return GridView.count(
      crossAxisCount: params['crossAxisCount'] ?? 2,
      childAspectRatio: params['childAspectRatio'] ?? 1.0,
      padding: _parseEdgeInsets(params['padding']),
      crossAxisSpacing: params['crossAxisSpacing']?.toDouble() ?? 0.0,
      mainAxisSpacing: params['mainAxisSpacing']?.toDouble() ?? 0.0,
      children: children.map((child) => createWidget(child)).toList(),
    );
  }

  static Widget _createPageView(WidgetConfig config) {
    final params = config.params ?? {};
    final children = config.children ?? [];

    return PageView(
      scrollDirection: _parseAxis(params['scrollDirection']) ?? Axis.horizontal,
      children: children.map((child) => createWidget(child)).toList(),
    );
  }

  static Axis? _parseAxis(dynamic axisValue) {
    if (axisValue == null) return null;
    if (axisValue is String) {
      switch (axisValue.toLowerCase()) {
        case 'horizontal':
          return Axis.horizontal;
        case 'vertical':
          return Axis.vertical;
        default:
          return null;
      }
    }
    return null;
  }

  static BoxDecoration? _parseBoxDecoration(dynamic decorationValue) {
    if (decorationValue == null) return null;
    if (decorationValue is! Map<String, dynamic>) return null;

    final params = decorationValue;
    return BoxDecoration(
      color: _parseColor(params['color']),
      borderRadius: _parseBorderRadius(params['borderRadius']),
      boxShadow: _parseBoxShadows(params['boxShadow']),
      image: _parseDecorationImage(params['image']),
    );
  }

  static DecorationImage? _parseDecorationImage(dynamic imageValue) {
    if (imageValue == null) return null;
    if (imageValue is! Map<String, dynamic>) return null;

    final params = imageValue;
    final url = params['url'] as String?;
    if (url == null) return null;

    return DecorationImage(
      image: NetworkImage(url),
      fit: _parseBoxFit(params['fit']),
    );
  }

  static BoxFit? _parseBoxFit(dynamic fitValue) {
    if (fitValue == null) return null;
    if (fitValue is String) {
      switch (fitValue.toLowerCase()) {
        case 'cover':
          return BoxFit.cover;
        case 'contain':
          return BoxFit.contain;
        case 'fill':
          return BoxFit.fill;
        case 'fitwidth':
          return BoxFit.fitWidth;
        case 'fitheight':
          return BoxFit.fitHeight;
        case 'none':
          return BoxFit.none;
        case 'scaledown':
          return BoxFit.scaleDown;
        default:
          return null;
      }
    }
    return null;
  }

  static List<BoxShadow>? _parseBoxShadows(dynamic shadowsValue) {
    if (shadowsValue == null) return null;
    if (shadowsValue is! List) return null;

    return shadowsValue
        .map((shadow) {
          if (shadow is! Map<String, dynamic>) return null;
          return BoxShadow(
            color: _parseColor(shadow['color']) ?? Colors.grey,
            blurRadius: shadow['blurRadius']?.toDouble() ?? 0.0,
            offset: Offset(
              shadow['offset']?['dx']?.toDouble() ?? 0.0,
              shadow['offset']?['dy']?.toDouble() ?? 0.0,
            ),
          );
        })
        .where((shadow) => shadow != null)
        .cast<BoxShadow>()
        .toList();
  }
}
