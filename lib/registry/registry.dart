import 'package:flutter/material.dart';

import '../models/demo_models.dart' show ComponentGroup, ComponentInfo;
import '../widgets/component_page.dart' show ComponentPage;
import '../demos/basic_demos.dart' show kBasicGroup;
import '../demos/layout_demos.dart' show kLayoutGroup;
import '../demos/scroll_list_demos.dart' show kScrollListGroup;
import '../demos/form_demos.dart' show kFormGroup;
import '../demos/navigation_demos.dart' show kNavigationGroup;
import '../demos/feedback_demos.dart' show kFeedbackGroup;
import '../demos/animation_demos.dart' show kAnimationGroup;
import '../demos/gesture_demos.dart' show kGestureGroup;

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
