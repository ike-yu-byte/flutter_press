import 'package:flutter/material.dart';

import '../models/demo_models.dart';

// =====================================================================
// AnimatedContainer 属性动画
// =====================================================================

/// 示例: animatedcontainer-toggle —— 尺寸颜色圆角三属性同变
class AnimatedContainerToggleDemo extends StatefulWidget {
  const AnimatedContainerToggleDemo({super.key});

  @override
  State<AnimatedContainerToggleDemo> createState() => _AnimatedContainerToggleDemoState();
}

class _AnimatedContainerToggleDemoState extends State<AnimatedContainerToggleDemo> {
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: _big ? 180.0 : 80.0,
            height: _big ? 180.0 : 80.0,
            decoration: BoxDecoration(
              color: _big ? Colors.red : Colors.blue,
              borderRadius: BorderRadius.circular(_big ? 90 : 8),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => setState(() => _big = !_big),
            child: Text(_big ? '恢复原样' : '放大变身'),
          ),
        ],
      ),
    );
  }
}

/// 示例: animatedcontainer-expand —— FAQ 手风琴单项
class AnimatedContainerExpandDemo extends StatefulWidget {
  const AnimatedContainerExpandDemo({super.key});

  @override
  State<AnimatedContainerExpandDemo> createState() => _AnimatedContainerExpandDemoState();
}

class _AnimatedContainerExpandDemoState extends State<AnimatedContainerExpandDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _expanded ? Colors.blue.shade50 : Colors.grey.shade100,
            border: Border.all(color: _expanded ? Colors.blue : Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('什么是热重载？', style: TextStyle(fontWeight: FontWeight.bold)),
              if (_expanded) ...[
                const SizedBox(height: 8),
                const Text('修改代码后按 r，无需重启即可看到效果，开发体验极佳。'),
              ],
              TextButton(
                onPressed: () => setState(() => _expanded = !_expanded),
                child: Text(_expanded ? '收起' : '展开'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 示例: animatedcontainer-stagger —— 先变大后变色
class AnimatedContainerStaggerDemo extends StatefulWidget {
  const AnimatedContainerStaggerDemo({super.key});

  @override
  State<AnimatedContainerStaggerDemo> createState() => _AnimatedContainerStaggerDemoState();
}

class _AnimatedContainerStaggerDemoState extends State<AnimatedContainerStaggerDemo> {
  bool _on = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: _on ? 140.0 : 60.0,
            height: _on ? 140.0 : 60.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                color: _on ? Colors.orange : Colors.indigo,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Switch(value: _on, onChanged: (v) => setState(() => _on = v)),
        ],
      ),
    );
  }
}

final List<DemoCase> kAnimatedContainerCases = <DemoCase>[
  DemoCase(
    id: 'animatedcontainer-toggle',
    title: '点击切换尺寸/颜色',
    description: '改属性 + setState，剩下的交给动画。',
    builder: (_) => const AnimatedContainerToggleDemo(),
  ),
  DemoCase(
    id: 'animatedcontainer-expand',
    title: '选中态卡片（展开收起）',
    description: '列表点击项变化高度与背景。',
    previewHeight: 260,
    builder: (_) => const AnimatedContainerExpandDemo(),
  ),
  DemoCase(
    id: 'animatedcontainer-stagger',
    title: '多属性错峰（不同 duration）',
    description: '外套两层各管一段节奏。',
    builder: (_) => const AnimatedContainerStaggerDemo(),
  ),
];

// =====================================================================
// AnimatedOpacity 透明度动画
// =====================================================================

/// 示例: animatedopacity-toggle —— 显隐过渡
class AnimatedOpacityToggleDemo extends StatefulWidget {
  const AnimatedOpacityToggleDemo({super.key});

  @override
  State<AnimatedOpacityToggleDemo> createState() => _AnimatedOpacityToggleDemoState();
}

class _AnimatedOpacityToggleDemoState extends State<AnimatedOpacityToggleDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('我会淡入淡出'),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => setState(() => _visible = !_visible),
            child: const Text('切换显隐'),
          ),
        ],
      ),
    );
  }
}

/// 示例: animatedopacity-placeholder —— 隐身后位置没消失
class AnimatedOpacityPlaceholderDemo extends StatefulWidget {
  const AnimatedOpacityPlaceholderDemo({super.key});

  @override
  State<AnimatedOpacityPlaceholderDemo> createState() => _AnimatedOpacityPlaceholderDemoState();
}

class _AnimatedOpacityPlaceholderDemoState extends State<AnimatedOpacityPlaceholderDemo> {
  bool _hide = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('上方'),
          AnimatedOpacity(
            opacity: _hide ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            child: Container(height: 80, width: 200, color: Colors.amber),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('下方——即使琥珀块"隐身"，两行文字仍然隔着一段空白', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 16),
          Switch(value: _hide, onChanged: (v) => setState(() => _hide = v)),
        ],
      ),
    );
  }
}

/// 示例: animatedopacity-gone —— 淡出后彻底收起
class AnimatedOpacityGoneDemo extends StatefulWidget {
  const AnimatedOpacityGoneDemo({super.key});

  @override
  State<AnimatedOpacityGoneDemo> createState() => _AnimatedOpacityGoneDemoState();
}

class _AnimatedOpacityGoneDemoState extends State<AnimatedOpacityGoneDemo> {
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: _show ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: _show
                  ? Container(height: 80, width: 200, color: Colors.teal)
                  : const SizedBox(width: 200),
            ),
          ),
          const SizedBox(height: 16),
          Switch(value: _show, onChanged: (v) => setState(() => _show = v)),
        ],
      ),
    );
  }
}

final List<DemoCase> kAnimatedOpacityCases = <DemoCase>[
  DemoCase(
    id: 'animatedopacity-toggle',
    title: '淡入淡出',
    description: 'opacity 变化时自动做淡入淡出过渡。',
    builder: (_) => const AnimatedOpacityToggleDemo(),
  ),
  DemoCase(
    id: 'animatedopacity-placeholder',
    title: '透明但仍占位',
    description: 'opacity 0 只是看不见，仍占布局空间。',
    previewHeight: 320,
    builder: (_) => const AnimatedOpacityPlaceholderDemo(),
  ),
  DemoCase(
    id: 'animatedopacity-gone',
    title: '透明 + 不占位组合',
    description: 'AnimatedSize 配合淡出彻底收起。',
    builder: (_) => const AnimatedOpacityGoneDemo(),
  ),
];

// =====================================================================
// TweenAnimationBuilder 补间动画
// =====================================================================

/// 示例: tween-size —— 点击方形在 60~160 间变化
class TweenSizeDemo extends StatefulWidget {
  const TweenSizeDemo({super.key});

  @override
  State<TweenSizeDemo> createState() => _TweenSizeDemoState();
}

class _TweenSizeDemoState extends State<TweenSizeDemo> {
  double _target = 60;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 60, end: _target),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            builder: (context, value, child) => Container(
              width: value,
              height: value,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => setState(() => _target = _target == 60 ? 160 : 60),
            child: const Text('变大变小'),
          ),
        ],
      ),
    );
  }
}

/// 示例: tween-rotate —— 点击旋转 180°
class TweenRotateDemo extends StatefulWidget {
  const TweenRotateDemo({super.key});

  @override
  State<TweenRotateDemo> createState() => _TweenRotateDemoState();
}

class _TweenRotateDemoState extends State<TweenRotateDemo> {
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: _turns),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            builder: (context, value, child) => Transform.rotate(
              angle: value * 3.14159,
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.arrow_upward, color: Colors.white, size: 40),
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => setState(() => _turns = _turns == 0 ? 1 : 0),
            child: const Text('翻转'),
          ),
        ],
      ),
    );
  }
}

/// 示例: tween-counter —— 数字从 0 滚到目标值
class TweenCounterDemo extends StatefulWidget {
  const TweenCounterDemo({super.key});

  @override
  State<TweenCounterDemo> createState() => _TweenCounterDemoState();
}

class _TweenCounterDemoState extends State<TweenCounterDemo> {
  int _target = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: _target),
            duration: const Duration(milliseconds: 800),
            builder: (context, value, child) => Text(
              '$value',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(onPressed: () => setState(() => _target += 100), child: const Text('+100')),
              const SizedBox(width: 12),
              OutlinedButton(onPressed: () => setState(() => _target = 0), child: const Text('清零')),
            ],
          ),
        ],
      ),
    );
  }
}

/// 示例: tween-color —— 点击切换并过渡颜色
class TweenColorDemo extends StatefulWidget {
  const TweenColorDemo({super.key});

  @override
  State<TweenColorDemo> createState() => _TweenColorDemoState();
}

class _TweenColorDemoState extends State<TweenColorDemo> {
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(end: _color),
        duration: const Duration(milliseconds: 600),
        builder: (context, value, child) => Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(color: value, shape: BoxShape.circle),
          child: TextButton(
            onPressed: () => setState(() => _color = _color == Colors.red ? Colors.green : Colors.red),
            child: const Text('点我变色', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

/// 示例: tween-child —— builder 的 child 参数复用静态内容
class TweenChildDemo extends StatefulWidget {
  const TweenChildDemo({super.key});

  @override
  State<TweenChildDemo> createState() => _TweenChildDemoState();
}

class _TweenChildDemoState extends State<TweenChildDemo> {
  double _target = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.0, end: _target),
            duration: const Duration(milliseconds: 300),
            // 静态内容放 child，动画期间不重复构建
            builder: (context, value, child) => Transform.scale(scale: value, child: child),
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.star, color: Colors.white),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => setState(() => _target = _target == 1.0 ? 1.8 : 1.0),
            child: const Text('缩放'),
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kTweenCases = <DemoCase>[
  DemoCase(
    id: 'tween-size',
    title: '尺寸补间',
    description: 'end 值一变，就从当前值平滑滑过去。',
    builder: (_) => const TweenSizeDemo(),
  ),
  DemoCase(
    id: 'tween-rotate',
    title: '旋转过渡',
    description: '角度从 0 补间到 π。',
    builder: (_) => const TweenRotateDemo(),
  ),
  DemoCase(
    id: 'tween-counter',
    title: '数字滚动（计数器效果）',
    description: 'IntTween 让类型不限于 double。',
    builder: (_) => const TweenCounterDemo(),
  ),
  DemoCase(
    id: 'tween-color',
    title: '颜色补间',
    description: 'ColorTween 过渡颜色。',
    builder: (_) => const TweenColorDemo(),
  ),
  DemoCase(
    id: 'tween-child',
    title: 'child 参数：省重建',
    description: '静态内容传 child，避免每帧重建。',
    builder: (_) => const TweenChildDemo(),
  ),
];

// =====================================================================
// Hero 跨页动画
// =====================================================================

Widget _heroNetImage(String url, BoxFit fit) => Image.network(
      url,
      fit: fit,
      errorBuilder: (_, _, _) => Container(color: Colors.blueGrey, child: const Icon(Icons.image, color: Colors.white)),
    );

/// 示例: hero-basic —— 缩略图点开大图页
class HeroListDemo extends StatelessWidget {
  const HeroListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('相册')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          for (final id in const ['a', 'b', 'c', 'd'])
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HeroDetailDemo(imageId: id)),
              ),
              child: Hero(
                tag: 'photo-$id',
                child: _heroNetImage('https://picsum.photos/seed/$id/300/300', BoxFit.cover),
              ),
            ),
        ],
      ),
    );
  }
}

class HeroDetailDemo extends StatelessWidget {
  const HeroDetailDemo({super.key, required this.imageId});

  final String imageId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: 'photo-$imageId',
          child: _heroNetImage('https://picsum.photos/seed/$imageId/900/900', BoxFit.contain),
        ),
      ),
    );
  }
}

const String _bigUrl = 'https://picsum.photos/seed/shuttle/900/900';

/// 示例: hero-flight-shuttle —— 飞行途中带缩放淡入
class HeroShuttleListDemo extends StatelessWidget {
  const HeroShuttleListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'shuttle-demo',
        flightShuttleBuilder: (context, animation, direction, heroContext, flightContext) => FadeTransition(
          opacity: animation,
          child: _heroNetImage(_bigUrl, BoxFit.cover),
        ),
        child: GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HeroShuttleDetailDemo())),
          child: SizedBox(width: 80, height: 80, child: _heroNetImage(_bigUrl, BoxFit.cover)),
        ),
      ),
    );
  }
}

class HeroShuttleDetailDemo extends StatelessWidget {
  const HeroShuttleDetailDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(tag: 'shuttle-demo', child: _heroNetImage(_bigUrl, BoxFit.contain)),
      ),
    );
  }
}

final List<DemoCase> kHeroCases = <DemoCase>[
  DemoCase(
    id: 'hero-basic',
    title: '基本用法：两页同 tag',
    description: '列表页与详情页各放相同 tag 的 Hero，跳转即自动飞。',
    previewHeight: 400,
    previewFill: true,
    builder: (_) => const HeroListDemo(),
  ),
  DemoCase(
    id: 'hero-flight-shuttle',
    title: '自定义飞行途中效果（flightShuttleBuilder）',
    description: '接管 flightShuttleBuilder 做淡入。',
    builder: (_) => const HeroShuttleListDemo(),
  ),
];

// =====================================================================
// AnimatedBuilder / 显式动画
// =====================================================================

/// 示例: animated-spin-repeat —— 无限旋转加载块
class AnimatedSpinDemo extends StatefulWidget {
  const AnimatedSpinDemo({super.key});

  @override
  State<AnimatedSpinDemo> createState() => _AnimatedSpinDemoState();
}

class _AnimatedSpinDemoState extends State<AnimatedSpinDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.rotate(
          angle: _controller.value * 2 * 3.14159,
          child: child,
        ),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.flutter_dash, color: Colors.white),
        ),
      ),
    );
  }
}

/// 示例: animated-control —— 按钮控制出入场
class AnimatedControlDemo extends StatefulWidget {
  const AnimatedControlDemo({super.key});

  @override
  State<AnimatedControlDemo> createState() => _AnimatedControlDemoState();
}

class _AnimatedControlDemoState extends State<AnimatedControlDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<Offset> _slide =
      Tween(begin: const Offset(0, 1), end: Offset.zero).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRect(
            child: SlideTransition(
              position: _slide,
              child: Container(
                width: 200,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(12)),
                child: const Text('我滑进来了', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton(onPressed: () => _controller.forward(), child: const Text('进场')),
              const SizedBox(width: 8),
              FilledButton.tonal(onPressed: () => _controller.reverse(), child: const Text('退场')),
              const SizedBox(width: 8),
              OutlinedButton(onPressed: () => _controller.stop(), child: const Text('暂停')),
            ],
          ),
        ],
      ),
    );
  }
}

/// 示例: animated-sequence —— Interval 分段编排
class AnimatedSequenceDemo extends StatefulWidget {
  const AnimatedSequenceDemo({super.key});

  @override
  State<AnimatedSequenceDemo> createState() => _AnimatedSequenceDemoState();
}

class _AnimatedSequenceDemoState extends State<AnimatedSequenceDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat(reverse: true);

  late final Animation<double> _move =
      CurvedAnimation(parent: _controller, curve: const Interval(0, .5, curve: Curves.easeOut));
  late final Animation<double> _scale =
      CurvedAnimation(parent: _controller, curve: const Interval(.5, 1, curve: Curves.elasticOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.translate(
          offset: Offset(_move.value * 120 - 60, 0),
          child: Transform.scale(scale: 0.5 + _scale.value * 0.8, child: child),
        ),
        child: Container(width: 60, height: 60, color: Colors.purple),
      ),
    );
  }
}

final List<DemoCase> kAnimatedBuilderCases = <DemoCase>[
  DemoCase(
    id: 'animated-spin-repeat',
    title: '循环旋转（repeat）',
    description: 'controller repeat() + AnimatedBuilder 每帧重建。',
    builder: (_) => const AnimatedSpinDemo(),
  ),
  DemoCase(
    id: 'animated-control',
    title: '播放/暂停/反转控制',
    description: 'forward / reverse / pause 随时切换。',
    builder: (_) => const AnimatedControlDemo(),
  ),
  DemoCase(
    id: 'animated-sequence',
    title: '多动画编排（Chain / Interval）',
    description: '一个 controller 驱动多段：先平移再缩放。',
    builder: (_) => const AnimatedSequenceDemo(),
  ),
];

// =====================================================================
// 分组装配
// =====================================================================

final ComponentGroup kAnimationGroup = ComponentGroup(
  title: '动画',
  icon: Icons.animation_outlined,
  items: <ComponentInfo>[
    ComponentInfo(
      name: 'AnimatedContainer 属性动画',
      route: '/components/animatedcontainer',
      kind: 'StatelessWidget',
      intro: 'AnimatedContainer 在属性变化时自动补间过渡，无需自己写 AnimationController。',
      cases: kAnimatedContainerCases,
    ),
    ComponentInfo(
      name: 'AnimatedOpacity 透明度动画',
      route: '/components/animatedopacity',
      kind: 'StatelessWidget',
      intro: 'AnimatedOpacity 在 opacity 变化时自动做淡入淡出过渡。',
      cases: kAnimatedOpacityCases,
    ),
    ComponentInfo(
      name: 'TweenAnimationBuilder 补间动画',
      route: '/components/tweenanimationbuilder',
      kind: 'StatefulWidget',
      intro: '给一个目标值 tween.end，它自动从当前值补间过去，不用手写 AnimationController。',
      cases: kTweenCases,
    ),
    ComponentInfo(
      name: 'Hero 跨页动画',
      route: '/components/hero',
      kind: 'StatefulWidget',
      intro: 'Hero 实现页面跳转时某元素从上一页平滑飞行到下一页的共享元素过渡。',
      cases: kHeroCases,
    ),
    ComponentInfo(
      name: 'AnimatedBuilder / 显式动画',
      route: '/components/animatedbuilder',
      kind: 'StatefulWidget',
      intro: '需要完全掌控动画（播放、暂停、反转、循环、编排）时用 AnimationController + AnimatedBuilder。',
      cases: kAnimatedBuilderCases,
    ),
  ],
);
