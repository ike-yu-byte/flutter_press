import 'package:flutter/material.dart';

import '../models/demo_models.dart';

/// 单个案例的展示卡片：标题 + 说明 + 预览区。
/// 预览区用一个带边框的容器承载演示 Widget，方便将来嵌入文档预览。
class DemoCaseCard extends StatelessWidget {
  final DemoCase demoCase;
  final int index;

  const DemoCaseCard({
    super.key,
    required this.demoCase,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 案例标题
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${index + 1}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  demoCase.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (demoCase.description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              demoCase.description!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        // 预览区（固定有界高度，保证 ListView/GridView 等可正常渲染）
        Container(
          width: double.infinity,
          height: demoCase.previewHeight ?? 320,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: demoCase.previewFill
              ? demoCase.builder(context)
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(child: demoCase.builder(context)),
                ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
