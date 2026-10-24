import 'package:flutter/material.dart';

import '../models/demo_models.dart';

// =====================================================================
// GestureDetector 手势检测
// =====================================================================

/// 示例: gesture-tap —— 三种基础点击手势回显
class GestureTapDemo extends StatefulWidget {
  const GestureTapDemo({super.key});

  @override
  State<GestureTapDemo> createState() => _GestureTapDemoState();
}

class _GestureTapDemoState extends State<GestureTapDemo> {
  String _last = '点我试试';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => _last = '单击'),
            onDoubleTap: () => setState(() => _last = '双击'),
            onLongPress: () => setState(() => _last = '长按'),
            child: Container(
              width: 140,
              height: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text('手势区域', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 16),
          Text('识别结果：$_last'),
        ],
      ),
    );
  }
}

/// 示例: gesture-drag —— 拖动方块随处移动
class GestureDragDemo extends StatefulWidget {
  const GestureDragDemo({super.key});

  @override
  State<GestureDragDemo> createState() => _GestureDragDemoState();
}

class _GestureDragDemoState extends State<GestureDragDemo> {
  Offset _pos = const Offset(20, 20);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _pos.dx,
          top: _pos.dy,
          child: GestureDetector(
            onPanUpdate: (d) => setState(() => _pos += d.delta),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.drag_handle, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

/// 示例: gesture-scale —— 双指缩放图片
class GestureScaleDemo extends StatefulWidget {
  const GestureScaleDemo({super.key});

  @override
  State<GestureScaleDemo> createState() => _GestureScaleDemoState();
}

class _GestureScaleDemoState extends State<GestureScaleDemo> {
  double _scale = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onScaleUpdate: (d) => setState(() => _scale = (_scale * d.scale).clamp(0.5, 3.0)),
        onScaleEnd: (_) {},
        child: Transform.scale(
          scale: _scale,
          child: Image.network(
            'https://picsum.photos/seed/scale/200/200',
            width: 200,
            height: 200,
            errorBuilder: (_, _, _) => Container(
              width: 200,
              height: 200,
              color: Colors.blueGrey,
              child: const Icon(Icons.image, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

/// 示例: gesture-behavior —— opaque 让空白区也能点
class GestureBehaviorDemo extends StatelessWidget {
  const GestureBehaviorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(32),
          child: Text('四周 padding 原本是点不中的'),
        ),
      ),
    );
  }
}

final List<DemoCase> kGestureDetectorCases = <DemoCase>[
  DemoCase(
    id: 'gesture-tap',
    title: '点击/双击/长按',
    description: '三种基础点击手势回显。',
    builder: (_) => const GestureTapDemo(),
  ),
  DemoCase(
    id: 'gesture-drag',
    title: '拖动（自由移动）',
    description: 'onPanUpdate 每帧给增量 delta，累加进偏移。',
    previewHeight: 260,
    previewFill: true,
    builder: (_) => const GestureDragDemo(),
  ),
  DemoCase(
    id: 'gesture-scale',
    title: '缩放（双指捏合）',
    description: 'onScaleUpdate 的 details.scale 是缩放倍数。',
    builder: (_) => const GestureScaleDemo(),
  ),
  DemoCase(
    id: 'gesture-behavior',
    title: '点击区域与行为细节',
    description: 'opaque 让透明空白区也参与命中。',
    builder: (_) => const GestureBehaviorDemo(),
  ),
];

// =====================================================================
// InkWell 水波纹
// =====================================================================

/// 示例: inkwell-basic —— 点整块出波纹
class InkWellBasicDemo extends StatelessWidget {
  const InkWellBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue.shade50,
      child: InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(32),
          child: Text('点我有水波纹', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

/// 示例: inkwell-rounded —— 圆角卡片可点
class InkWellRoundedDemo extends StatelessWidget {
  const InkWellRoundedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(24),
          child: Row(children: [Icon(Icons.photo), SizedBox(width: 12), Text('图文可点卡')]),
        ),
      ),
    );
  }
}

/// 示例: inkwell-states —— hover/selected 态颜色
class InkWellStatesDemo extends StatefulWidget {
  const InkWellStatesDemo({super.key});

  @override
  State<InkWellStatesDemo> createState() => _InkWellStatesDemoState();
}

class _InkWellStatesDemoState extends State<InkWellStatesDemo> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.grey.shade200,
        child: InkWell(
          onTap: () => setState(() => _selected = !_selected),
          hoverColor: Colors.amber.shade100,
          splashColor: Colors.amber.shade300,
          highlightColor: Colors.amber.withAlpha(60),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Text(_selected ? '已选中（金底）' : '点选中'),
          ),
        ),
      ),
    );
  }
}

/// 示例: ink-image-reveal —— 图片上盖波纹
class InkImageDemo extends StatelessWidget {
  const InkImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Ink(
          width: 160,
          height: 100,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/seed/ink/320/200'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}

final List<DemoCase> kInkWellCases = <DemoCase>[
  DemoCase(
    id: 'inkwell-basic',
    title: '基础水波纹',
    description: '波纹画在最近的 Material 上。',
    builder: (_) => const InkWellBasicDemo(),
  ),
  DemoCase(
    id: 'inkwell-rounded',
    title: '圆角裁剪',
    description: '外层 clipBehavior 让波纹按圆角裁剪。',
    builder: (_) => const InkWellRoundedDemo(),
  ),
  DemoCase(
    id: 'inkwell-states',
    title: '状态反馈（选中/悬停）',
    description: 'hover 色、选中高亮都能定制。',
    builder: (_) => const InkWellStatesDemo(),
  ),
  DemoCase(
    id: 'ink-image-reveal',
    title: 'Ink 装饰同族',
    description: '用 Ink 作背景让图片也沾染波纹。',
    builder: (_) => const InkImageDemo(),
  ),
];

// =====================================================================
// Draggable 拖拽
// =====================================================================

/// 示例: drag-target-basic —— 拖入投递完整流程
class DragTargetBasicDemo extends StatefulWidget {
  const DragTargetBasicDemo({super.key});

  @override
  State<DragTargetBasicDemo> createState() => _DragTargetBasicDemoState();
}

class _DragTargetBasicDemoState extends State<DragTargetBasicDemo> {
  int _received = 0;
  bool _holding = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Draggable<String>(
            data: 'box',
            feedback: Material(
              color: Colors.transparent,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.drag_indicator, color: Colors.white),
              ),
            ),
            childWhenDragging: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(8)),
            ),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.drag_handle, color: Colors.white),
            ),
          ),
          const SizedBox(width: 48),
          DragTarget<String>(
            onWillAcceptWithDetails: (d) {
              setState(() => _holding = true);
              return d.data == 'box';
            },
            onLeave: (_) => setState(() => _holding = false),
            onMove: (d) {},
            onAcceptWithDetails: (_) {
              setState(() {
                _received++;
                _holding = false;
              });
            },
            builder: (context, candidateData, rejectedData) => Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: _holding ? Colors.green.shade100 : Colors.grey.shade200,
                border: Border.all(color: _holding ? Colors.green : Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text('已接收 $_received 次')),
            ),
          ),
        ],
      ),
    );
  }
}

/// 示例: drag-end-anywhere —— 松手即处理，不依赖 DragTarget
class DragEndDemo extends StatefulWidget {
  const DragEndDemo({super.key});

  @override
  State<DragEndDemo> createState() => _DragEndDemoState();
}

class _DragEndDemoState extends State<DragEndDemo> {
  String _log = '拖方块到任意位置松手';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Draggable<String>(
            data: 'trash',
            feedback: const Material(
              color: Colors.transparent,
              child: Icon(Icons.delete_forever, size: 48, color: Colors.red),
            ),
            onDragEnd: (details) {
              setState(() => _log = '松手于 (${details.offset.dx.round()}, ${details.offset.dy.round()})');
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: Colors.red.shade200, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.delete_outline),
            ),
          ),
          const SizedBox(height: 24),
          Text(_log),
        ],
      ),
    );
  }
}

/// 示例: drag-multi-source —— 颜色分类游戏
class DragMultiSourceDemo extends StatefulWidget {
  const DragMultiSourceDemo({super.key});

  @override
  State<DragMultiSourceDemo> createState() => _DragMultiSourceDemoState();
}

class _DragMultiSourceDemoState extends State<DragMultiSourceDemo> {
  final _colors = [Colors.red, Colors.blue, Colors.green];
  Color? _lastDrop;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final c in _colors)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Draggable<Color>(
                    data: c,
                    feedback: Material(color: Colors.transparent, child: CircleAvatar(backgroundColor: c, radius: 20)),
                    child: CircleAvatar(backgroundColor: c, radius: 24),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 28),
          DragTarget<Color>(
            onAcceptWithDetails: (d) => setState(() => _lastDrop = d.data),
            builder: (context, candidates, rejected) => Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: (candidates.isNotEmpty ? candidates.first : Colors.grey) ?? Colors.grey, width: 3),
                borderRadius: BorderRadius.circular(8),
                color: (_lastDrop ?? Colors.transparent).withAlpha(30),
              ),
              child: Text(_lastDrop == null ? '接住颜色' : '收到 $_lastDrop'),
            ),
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kDraggableCases = <DemoCase>[
  DemoCase(
    id: 'drag-target-basic',
    title: '一对组合：Draggable + DragTarget',
    description: '拖起方块放进接收区，完成一次投递。',
    previewHeight: 200,
    builder: (_) => const DragTargetBasicDemo(),
  ),
  DemoCase(
    id: 'drag-end-anywhere',
    title: '拖到任意处（无目标判定）',
    description: 'onDragEnd 拿松手位置，不依赖 DragTarget。',
    builder: (_) => const DragEndDemo(),
  ),
  DemoCase(
    id: 'drag-multi-source',
    title: '多个源拖一个目标（按数据区分）',
    description: '颜色分类游戏，泛型对上才命中。',
    previewHeight: 240,
    builder: (_) => const DragMultiSourceDemo(),
  ),
];

// =====================================================================
// 分组装配
// =====================================================================

final ComponentGroup kGestureGroup = ComponentGroup(
  title: '手势交互',
  icon: Icons.touch_app_outlined,
  items: <ComponentInfo>[
    ComponentInfo(
      name: 'GestureDetector 手势检测',
      route: '/components/gesturedetector',
      kind: 'StatelessWidget',
      intro: 'GestureDetector 给任意 widget 添加手势识别，只处理逻辑、不提供视觉反馈。',
      cases: kGestureDetectorCases,
    ),
    ComponentInfo(
      name: 'InkWell 水波纹',
      route: '/components/inkwell',
      kind: 'StatefulWidget',
      intro: 'InkWell 给子组件加上 Material 的点击水波纹效果，自带手势。',
      cases: kInkWellCases,
    ),
    ComponentInfo(
      name: 'Draggable 拖拽',
      route: '/components/draggable',
      kind: 'StatefulWidget',
      intro: 'Draggable 让 widget 可被拖起，拖到 DragTarget 上松手即完成投递。',
      cases: kDraggableCases,
    ),
  ],
);
