import 'package:flutter/material.dart';

import '../models/demo_models.dart';

// =====================================================================
// Row 横向布局
// =====================================================================

/// 示例: row-basic —— 三个子横排
class RowBasicDemo extends StatelessWidget {
  const RowBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 60, height: 60, color: Colors.red),
          Container(width: 60, height: 60, color: Colors.green),
          Container(width: 60, height: 60, color: Colors.blue),
        ],
      ),
    );
  }
}

/// 示例: row-main-axis —— spaceBetween 分布
class RowMainAxisDemo extends StatelessWidget {
  const RowMainAxisDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width: 50, height: 50, color: Colors.orange),
            Container(width: 50, height: 50, color: Colors.orange),
            Container(width: 50, height: 50, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}

/// 示例: row-cross-axis —— center 垂直居中
class RowCrossAxisDemo extends StatelessWidget {
  const RowCrossAxisDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 50, height: 40, color: Colors.teal),
          Container(width: 50, height: 90, color: Colors.teal),
          Container(width: 50, height: 60, color: Colors.teal),
        ],
      ),
    );
  }
}

/// 示例: row-expanded —— 1:2 权重分宽
class RowExpandedDemo extends StatelessWidget {
  const RowExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: const Row(
          children: [
            Expanded(
              flex: 1,
              child: ColoredBox(color: Colors.red, child: SizedBox(height: 50)),
            ),
            Expanded(
              flex: 2,
              child: ColoredBox(color: Colors.blue, child: SizedBox(height: 50)),
            ),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kRowCases = <DemoCase>[
  DemoCase(
    id: 'row-basic',
    title: '基本横排',
    description: '三个子沿水平方向排成一行。',
    builder: (_) => const RowBasicDemo(),
  ),
  DemoCase(
    id: 'row-main-axis',
    title: '主轴对齐',
    description: 'mainAxisAlignment 控制水平排布。',
    builder: (_) => const RowMainAxisDemo(),
  ),
  DemoCase(
    id: 'row-cross-axis',
    title: '交叉轴对齐',
    description: '不同高度子项按 crossAxisAlignment 垂直对齐。',
    builder: (_) => const RowCrossAxisDemo(),
  ),
  DemoCase(
    id: 'row-expanded',
    title: '用 Expanded 分配宽度',
    description: 'Expanded 吃掉剩余宽度，flex 按比例分配。',
    builder: (_) => const RowExpandedDemo(),
  ),
];

// =====================================================================
// Column 纵向布局
// =====================================================================

/// 示例: column-basic —— 竖排三块
class ColumnBasicDemo extends StatelessWidget {
  const ColumnBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 120, height: 40, color: Colors.red),
          Container(width: 120, height: 40, color: Colors.green),
          Container(width: 120, height: 40, color: Colors.blue),
        ],
      ),
    );
  }
}

/// 示例: column-main-axis —— spaceAround 分布
class ColumnMainAxisDemo extends StatelessWidget {
  const ColumnMainAxisDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 260,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 120, height: 40, color: Colors.purple),
            Container(width: 120, height: 40, color: Colors.purple),
            Container(width: 120, height: 40, color: Colors.purple),
          ],
        ),
      ),
    );
  }
}

/// 示例: column-stretch —— 子项满宽
class ColumnStretchDemo extends StatelessWidget {
  const ColumnStretchDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('全宽按钮 A'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('全宽按钮 B'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例: column-expanded —— 头部/内容/底部
class ColumnExpandedDemo extends StatelessWidget {
  const ColumnExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 260,
        child: ColoredBox(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              Container(
                height: 50,
                color: Colors.blue,
                child: const Center(child: Text('头部')),
              ),
              const Expanded(child: ColoredBox(color: Colors.white)),
              Container(
                height: 50,
                color: Colors.green,
                child: const Center(child: Text('底部')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<DemoCase> kColumnCases = <DemoCase>[
  DemoCase(
    id: 'column-basic',
    title: '基本竖排',
    description: '子组件沿垂直方向排成一列。',
    builder: (_) => const ColumnBasicDemo(),
  ),
  DemoCase(
    id: 'column-main-axis',
    title: '主轴对齐',
    description: 'mainAxisAlignment 控制垂直排布。',
    builder: (_) => const ColumnMainAxisDemo(),
  ),
  DemoCase(
    id: 'column-stretch',
    title: '交叉轴拉伸满宽',
    description: 'CrossAxisAlignment.stretch 让子项横向撑满。',
    builder: (_) => const ColumnStretchDemo(),
  ),
  DemoCase(
    id: 'column-expanded',
    title: '用 Expanded 分配高度',
    description: '某项吃掉剩余高度。',
    builder: (_) => const ColumnExpandedDemo(),
  ),
];

// =====================================================================
// Stack 层叠布局
// =====================================================================

/// 示例: stack-badge —— 右上角红点角标
class StackBadgeDemo extends StatelessWidget {
  const StackBadgeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(width: 120, height: 120, color: Colors.grey.shade300),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 示例: stack-watermark —— 右下角水印
class StackWatermarkDemo extends StatelessWidget {
  const StackWatermarkDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.network(
            'https://picsum.photos/240/160',
            width: 240,
            height: 160,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) =>
                Container(width: 240, height: 160, color: Colors.grey.shade300),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('© ike', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kStackCases = <DemoCase>[
  DemoCase(
    id: 'stack-badge',
    title: '图片 + 角标',
    description: '用 Positioned 精确定位。',
    builder: (_) => const StackBadgeDemo(),
  ),
  DemoCase(
    id: 'stack-watermark',
    title: '整体对齐浮层',
    description: '未用 Positioned 的子按 alignment 统一对齐。',
    builder: (_) => const StackWatermarkDemo(),
  ),
];

// =====================================================================
// Flex 弹性布局
// =====================================================================

/// 示例: flex-vertical —— direction 竖直
class FlexVerticalDemo extends StatelessWidget {
  const FlexVerticalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 100, height: 40, color: Colors.red),
          Container(width: 100, height: 40, color: Colors.green),
        ],
      ),
    );
  }
}

/// 示例: flex-responsive —— 按宽度切换方向
class FlexResponsiveDemo extends StatelessWidget {
  const FlexResponsiveDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontal = constraints.maxWidth > 400;
        return Flex(
          direction: horizontal ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 80, height: 80, color: Colors.blue),
            Container(width: 80, height: 80, color: Colors.orange),
          ],
        );
      },
    );
  }
}

final List<DemoCase> kFlexCases = <DemoCase>[
  DemoCase(
    id: 'flex-vertical',
    title: '竖直方向（等价 Column）',
    description: 'direction 设为 Axis.vertical。',
    builder: (_) => const FlexVerticalDemo(),
  ),
  DemoCase(
    id: 'flex-responsive',
    title: '运行时切换方向',
    description: '响应式：宽屏横排、窄屏竖排。',
    builder: (_) => const FlexResponsiveDemo(),
  ),
];

// =====================================================================
// Wrap 流式布局
// =====================================================================

/// 示例: wrap-chips —— 标签自动折行
class WrapChipsDemo extends StatelessWidget {
  const WrapChipsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const tags = [
      'Flutter',
      'Dart',
      '移动端',
      '跨平台',
      '开源',
      '热重载',
      'Widget',
    ];
    return Center(
      child: SizedBox(
        width: 280,
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final t in tags) Chip(label: Text(t))],
        ),
      ),
    );
  }
}

/// 示例: wrap-alignment —— spaceEvenly 分布
class WrapAlignmentDemo extends StatelessWidget {
  const WrapAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 8,
          runSpacing: 8,
          children: [
            Container(width: 60, height: 40, color: Colors.blue),
            Container(width: 60, height: 40, color: Colors.blue),
            Container(width: 60, height: 40, color: Colors.blue),
            Container(width: 60, height: 40, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kWrapCases = <DemoCase>[
  DemoCase(
    id: 'wrap-chips',
    title: '标签自动折行',
    description: 'spacing 主轴间距、runSpacing 行间距。',
    builder: (_) => const WrapChipsDemo(),
  ),
  DemoCase(
    id: 'wrap-alignment',
    title: '对齐',
    description: 'alignment 控制每行内部排布。',
    builder: (_) => const WrapAlignmentDemo(),
  ),
];

// =====================================================================
// Center / Align 对齐
// =====================================================================

/// 示例: align-center —— 居中
class AlignCenterDemo extends StatelessWidget {
  const AlignCenterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 160,
      child: ColoredBox(
        color: Colors.blue.shade50,
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('我居中'),
          ),
        ),
      ),
    );
  }
}

/// 示例: align-corner —— 右下角
class AlignCornerDemo extends StatelessWidget {
  const AlignCornerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 160,
      child: ColoredBox(
        color: Colors.grey.shade200,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(width: 40, height: 40, color: Colors.red),
        ),
      ),
    );
  }
}

/// 示例: align-text-direction —— Directionality 切换左右
class AlignTextDirectionDemo extends StatelessWidget {
  const AlignTextDirectionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: SizedBox(
              width: 220,
              height: 70,
              child: ColoredBox(
                color: Colors.blue.shade50,
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('LTR 贴左'),
                ),
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              width: 220,
              height: 70,
              child: ColoredBox(
                color: Colors.orange.shade50,
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('RTL 贴右'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 示例: align-ratio —— 16:9 盒子
class AlignRatioDemo extends StatelessWidget {
  const AlignRatioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.teal,
            child: const Center(child: Text('16:9')),
          ),
        ),
      ),
    );
  }
}

final List<DemoCase> kAlignCases = <DemoCase>[
  DemoCase(
    id: 'align-center',
    title: '居中',
    description: 'Center 把子组件摆到父级正中。',
    builder: (_) => const AlignCenterDemo(),
  ),
  DemoCase(
    id: 'align-corner',
    title: '九宫格对齐',
    description: 'Alignment 常量控制贴哪一角。',
    builder: (_) => const AlignCornerDemo(),
  ),
  DemoCase(
    id: 'align-text-direction',
    title: '方向感知对齐',
    description: 'AlignmentDirectional.centerStart 跟随文字起始边。',
    builder: (_) => const AlignTextDirectionDemo(),
  ),
  DemoCase(
    id: 'align-ratio',
    title: '强制宽高比',
    description: 'AspectRatio 固定宽 / 高 比值。',
    builder: (_) => const AlignRatioDemo(),
  ),
];

// =====================================================================
// Expanded / Flexible 伸展
// =====================================================================

/// 示例: expanded-fill —— 输入框吃掉剩余宽度
class ExpandedFillDemo extends StatelessWidget {
  const ExpandedFillDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 8),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: '用户名'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例: expanded-flex —— 1:2:3 权重瓜分
class ExpandedFlexDemo extends StatelessWidget {
  const ExpandedFlexDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: const Row(
          children: [
            Expanded(
              flex: 1,
              child: ColoredBox(
                color: Colors.red,
                child: SizedBox(height: 60),
              ),
            ),
            Expanded(
              flex: 2,
              child: ColoredBox(
                color: Colors.green,
                child: SizedBox(height: 60),
              ),
            ),
            Expanded(
              flex: 3,
              child: ColoredBox(
                color: Colors.blue,
                child: SizedBox(height: 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例: flexible-loose —— 文字不撑满、按需占位
class FlexibleLooseDemo extends StatelessWidget {
  const FlexibleLooseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Container(width: 60, height: 60, color: Colors.blue.shade200),
            const SizedBox(width: 12),
            const Flexible(
              child: ColoredBox(
                color: Colors.amber,
                child: Text('按需占位，不超过分配上限'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例: expanded-fit-compare —— tight 与 loose 的差别
class ExpandedFitCompareDemo extends StatelessWidget {
  const ExpandedFitCompareDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('fit: tight（Expanded）'),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(flex: 1, child: Container(height: 32, color: Colors.red)),
                Expanded(
                  flex: 1,
                  child: Container(height: 32, color: Colors.green),
                ),
              ],
            ),
          ),
          const Text('fit: loose（Flexible）'),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Flexible(flex: 1, child: Text('短')),
                Flexible(
                  flex: 1,
                  child: Container(height: 32, width: 80, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kExpandedCases = <DemoCase>[
  DemoCase(
    id: 'expanded-fill',
    title: '吃满剩余空间',
    description: 'Expanded 强制子填满分配到的空间。',
    builder: (_) => const ExpandedFillDemo(),
  ),
  DemoCase(
    id: 'expanded-flex',
    title: 'flex 权重分配',
    description: '多个 Expanded 按 flex 比例瓜分剩余空间。',
    builder: (_) => const ExpandedFlexDemo(),
  ),
  DemoCase(
    id: 'flexible-loose',
    title: 'Flexible 按需占位',
    description: 'Flexible（fit: loose）只保证子不超过上限。',
    builder: (_) => const FlexibleLooseDemo(),
  ),
  DemoCase(
    id: 'expanded-fit-compare',
    title: 'fit 参数对比',
    description: 'tight 铺满整行，loose 只按内容占位。',
    builder: (_) => const ExpandedFitCompareDemo(),
  ),
];

// =====================================================================
// SafeArea 安全区
// =====================================================================

/// 示例: safearea-basic —— 用假造的刘海/手势条演示内容内缩
class SafeAreaBasicDemo extends StatelessWidget {
  const SafeAreaBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // 模拟一台上下左右各有“不安全区”的设备
    const fake = EdgeInsets.fromLTRB(20, 36, 20, 36);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(padding: fake, viewPadding: fake),
      child: Container(
        color: Colors.blueGrey, // 危险区露出的底色
        child: const SafeArea(
          child: ColoredBox(
            color: Colors.white,
            child: Center(child: Text('内容被 SafeArea 推入安全区内')),
          ),
        ),
      ),
    );
  }
}

/// 示例: safearea-edges —— top/bottom/left/right 开关控制哪几边内缩
class SafeAreaEdgesDemo extends StatelessWidget {
  const SafeAreaEdgesDemo({super.key});

  static Widget _cell(String label, bool allEdges) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 4),
        Expanded(
          child: Container(
            color: Colors.blueGrey,
            child: SafeArea(
              top: allEdges,
              bottom: allEdges,
              child: const ColoredBox(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const fake = EdgeInsets.fromLTRB(16, 32, 16, 32);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(padding: fake, viewPadding: fake),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(child: _cell('四边都缩', true)),
            const SizedBox(width: 8),
            Expanded(child: _cell('上下不缩', false)),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kSafeAreaCases = <DemoCase>[
  DemoCase(
    id: 'safearea-basic',
    title: '基本内缩',
    description: '把内容推入系统安全区，避开刘海/手势条（此处假造 padding 演示）。',
    previewFill: true,
    builder: (_) => const SafeAreaBasicDemo(),
  ),
  DemoCase(
    id: 'safearea-edges',
    title: '按边开关',
    description: 'top/bottom/left/right=false 让该边不内缩；minimum 可再留额外间距。',
    previewFill: true,
    builder: (_) => const SafeAreaEdgesDemo(),
  ),
];

// =====================================================================
// Table 表格
// =====================================================================

/// 示例: table-basic —— 三行三列基础表格
class TableBasicDemo extends StatelessWidget {
  const TableBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    Widget cell(String text) => Padding(
          padding: const EdgeInsets.all(10),
          child: Text(text),
        );
    return Center(
      child: Table(
        border: TableBorder.all(color: Colors.blueGrey.shade300),
        children: [
          TableRow(children: [cell('姓名'), cell('角色'), cell('状态')]),
          TableRow(children: [cell('张三'), cell('开发'), cell('在职')]),
          TableRow(children: [cell('李四'), cell('设计'), cell('休假')]),
        ],
      ),
    );
  }
}

/// 示例: table-column-width —— columnWidths 指定各列宽
class TableColumnWidthDemo extends StatelessWidget {
  const TableColumnWidthDemo({super.key});

  @override
  Widget build(BuildContext context) {
    Widget cell(String text) => Padding(
          padding: const EdgeInsets.all(10),
          child: Text(text),
        );
    return Center(
      child: Table(
        border: TableBorder.all(color: Colors.blueGrey.shade300),
        defaultColumnWidth: const FlexColumnWidth(), // 未指定列按 flex 平分剩余宽
        columnWidths: const {
          0: FixedColumnWidth(90),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(1),
        },
        children: [
          TableRow(children: [cell('固定90'), cell('Flex 2'), cell('Flex 1')]),
          TableRow(children: [cell('A'), cell('较长内容占据更多空间'), cell('B')]),
        ],
      ),
    );
  }
}

/// 示例: table-border-padding —— 自定义边框与单元格内边距
class TableBorderPaddingDemo extends StatelessWidget {
  const TableBorderPaddingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    Widget cell(String text, {bool header = false}) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            text,
            style: TextStyle(fontWeight: header ? FontWeight.bold : FontWeight.normal),
          ),
        );
    return Center(
      child: Table(
        border: const TableBorder(
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
          horizontalInside: BorderSide(color: Colors.grey, width: 0.5),
        ),
        defaultColumnWidth: const FlexColumnWidth(),
        children: [
          TableRow(children: [cell('课程', header: true), cell('学时', header: true)]),
          TableRow(children: [cell('Flutter 基础'), cell('24')]),
          TableRow(children: [cell('Dart 进阶'), cell('16')]),
        ],
      ),
    );
  }
}

final List<DemoCase> kTableCases = <DemoCase>[
  DemoCase(
    id: 'table-basic',
    title: '基础表格',
    description: 'Table + TableRow + TableCell，border 画网格线。',
    builder: (_) => const TableBasicDemo(),
  ),
  DemoCase(
    id: 'table-column-width',
    title: '列宽控制',
    description: 'columnWidths 用 Fixed/Flex/Fraction 指定每列宽度。',
    builder: (_) => const TableColumnWidthDemo(),
  ),
  DemoCase(
    id: 'table-border-padding',
    title: '边框与内边距',
    description: 'TableBorder 只画部分边，内层 Padding 控制留白。',
    builder: (_) => const TableBorderPaddingDemo(),
  ),
];

// =====================================================================
// 分组装配
// =====================================================================

final ComponentGroup kLayoutGroup = ComponentGroup(
  title: '布局组件',
  icon: Icons.grid_view_outlined,
  items: <ComponentInfo>[
    ComponentInfo(
      name: 'Row 横向布局',
      route: '/components/row',
      kind: 'StatelessWidget',
      intro: 'Row 把子组件沿水平方向排成一行，主轴=水平、交叉轴=垂直。',
      cases: kRowCases,
    ),
    ComponentInfo(
      name: 'Column 纵向布局',
      route: '/components/column',
      kind: 'StatelessWidget',
      intro: 'Column 把子组件沿垂直方向排成一列，与 Row 对称，主轴=垂直。',
      cases: kColumnCases,
    ),
    ComponentInfo(
      name: 'Stack 层叠布局',
      route: '/components/stack',
      kind: 'StatelessWidget',
      intro: 'Stack 让子组件沿 Z 轴叠放，后面的盖在前面上。适合角标、浮层、水印。',
      cases: kStackCases,
    ),
    ComponentInfo(
      name: 'Flex 弹性布局',
      route: '/components/flex',
      kind: 'StatelessWidget',
      intro: 'Flex 是 Row/Column 的底层实现，direction 决定主轴方向。',
      cases: kFlexCases,
    ),
    ComponentInfo(
      name: 'Wrap 流式布局',
      route: '/components/wrap',
      kind: 'StatelessWidget',
      intro: 'Wrap 类似 Row/Column，但子组件排到边界放不下时会自动换行。',
      cases: kWrapCases,
    ),
    ComponentInfo(
      name: 'Center / Align 对齐',
      route: '/components/align',
      kind: 'StatelessWidget',
      intro: 'Center 与 Align 把子组件在父级空间内摆到某个位置。',
      cases: kAlignCases,
    ),
    ComponentInfo(
      name: 'Expanded / Flexible 伸展',
      route: '/components/expanded',
      kind: 'StatelessWidget',
      intro: 'Expanded 和 Flexible 只能作为 Row/Column/Flex 的直接子，按比例分配主轴剩余空间。',
      cases: kExpandedCases,
    ),
    ComponentInfo(
      name: 'SafeArea 安全区',
      route: '/components/safearea',
      kind: 'StatelessWidget',
      intro: 'SafeArea 用 MediaQuery.padding 把内容从刘海、手势条等系统“不安全区”往里推，避免被遮挡。',
      cases: kSafeAreaCases,
    ),
    ComponentInfo(
      name: 'Table 表格',
      route: '/components/table',
      kind: 'StatelessWidget',
      intro: 'Table 用 TableRow / TableCell 组出行列对齐的网格，列宽由 columnWidths 精确控制。',
      cases: kTableCases,
    ),
  ],
);
