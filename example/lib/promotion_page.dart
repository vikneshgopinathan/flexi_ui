import 'package:flutter/material.dart';
import 'package:flexi_ui/flexi_ui.dart';

class PromotionPage extends StatelessWidget {
  final String promotionId;

  const PromotionPage({super.key, required this.promotionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotion: $promotionId'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SimpleFlexiUI(
        dataSource: DataSourceConfig(
          type: DataSourceType.asset,
          assetPath: 'assets/promotion.json',
        ),
        loadingWidget: const Center(child: CircularProgressIndicator()),
        errorWidget: const Center(child: Text('Error loading promotion')),
      ),
    );
  }
}
