import 'package:flutter/material.dart';

/// 单个案例：对应文档里的一个 `## 案例` 段落。
class DemoCase {
  /// 案例标识，取自文档注释 `/// 示例: text-style`。
  final String id;

  /// 案例标题，对应文档二级标题，如「基本样式」。
  final String title;

  /// 案例说明，对应标题下方的描述文字。
  final String? description;

  /// 构建演示 Widget。
  final WidgetBuilder builder;

  /// 预览区高度；列表/网格/翻页等有界高度需求可自定义，默认 320。
  final double? previewHeight;

  /// 预览区是否用 padding 撑满（关闭居中），默认 false 居中显示。
  final bool previewFill;

  const DemoCase({
    required this.id,
    required this.title,
    this.description,
    required this.builder,
    this.previewHeight,
    this.previewFill = false,
  });
}

/// 单个组件：对应一个目录 / 一个路由页面。
class ComponentInfo {
  /// 组件名，如「Text 文本」。
  final String name;

  /// 路由地址，如「/components/text」。
  final String route;

  /// 组件类型标注：StatelessWidget / StatefulWidget。
  final String? kind;

  /// 组件简介，对应标题下的引导段落。
  final String? intro;

  /// 该组件的全部案例，顺序与文档一致。
  final List<DemoCase> cases;

  const ComponentInfo({
    required this.name,
    required this.route,
    required this.cases,
    this.kind,
    this.intro,
  });
}

/// 组件分组：对应侧边栏的一个折叠分类。
class ComponentGroup {
  final String title;
  final IconData icon;
  final List<ComponentInfo> items;

  const ComponentGroup({
    required this.title,
    required this.items,
    this.icon = Icons.widgets_outlined,
  });
}
