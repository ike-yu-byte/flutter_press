import 'package:flutter/material.dart';

import '../models/demo_models.dart';
import '../registry/registry.dart';

/// 总汇总首页：按分组列出所有组件，点击进入对应案例页。
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = kAllGroups.fold<int>(
      0,
      (sum, g) => sum + g.items.length,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 组件案例集'),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '共 ${kAllGroups.length} 个分组 · $total 个组件',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '每个组件一个路由页，案例顺序与文档一致。',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          for (final group in kAllGroups) ...[
            _GroupHeader(group: group),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  for (final item in group.items)
                    _ComponentTile(item: item),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  final ComponentGroup group;
  const _GroupHeader({required this.group});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Icon(group.icon, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            group.title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${group.items.length} 个',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ComponentTile extends StatelessWidget {
  final ComponentInfo item;
  const _ComponentTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(
          '${item.kind ?? 'Widget'} · ${item.cases.length} 个案例',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.of(context).pushNamed(item.route),
      ),
    );
  }
}
