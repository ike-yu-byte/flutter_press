import 'package:flutter/material.dart';

import '../models/demo_models.dart';
import 'demo_case_card.dart';

/// 通用组件详情页：按文档顺序渲染该组件的全部案例。
class ComponentPage extends StatelessWidget {
  final ComponentInfo info;

  const ComponentPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(info.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Chip(
                label: Text(
                  info.kind ?? 'Widget',
                  style: theme.textTheme.labelSmall,
                ),
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        children: [
          if (info.intro != null && info.intro!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(info.intro!, style: theme.textTheme.bodyMedium),
            ),
          Text(
            '共 ${info.cases.length} 个案例',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(),
          for (var i = 0; i < info.cases.length; i++)
            DemoCaseCard(demoCase: info.cases[i], index: i),
        ],
      ),
    );
  }
}
