import 'package:flutter/material.dart';

import '../models/demo_models.dart';
import '../widgets/component_page.dart';
import '../demos/basic_demos.dart';
import '../demos/layout_demos.dart';
import '../demos/scroll_list_demos.dart';
import '../demos/form_demos.dart';
import '../demos/navigation_demos.dart';
import '../demos/feedback_demos.dart';
import '../demos/animation_demos.dart';
import '../demos/gesture_demos.dart';

/// 全部分组，顺序与文档侧边栏一致。
final List<ComponentGroup> kAllGroups = <ComponentGroup>[
  kBasicGroup,
  kLayoutGroup,
  kScrollListGroup,
  kFormGroup,
  kNavigationGroup,
  kFeedbackGroup,
  kAnimationGroup,
  kGestureGroup,
];

/// 路由 -> 组件信息，供路由表与页面复用。
final Map<String, ComponentInfo> kRouteIndex = <String, ComponentInfo>{
  for (final group in kAllGroups)
    for (final item in group.items) item.route: item,
};

/// 生成 MaterialApp 的路由表（首页除外）。
Map<String, WidgetBuilder> buildComponentRoutes() {
  return <String, WidgetBuilder>{
    for (final entry in kRouteIndex.entries)
      entry.key: (context) => ComponentPage(info: entry.value),
  };
}
