import 'package:flutter/material.dart';

import '../models/demo_models.dart';

// =====================================================================
// ListView 列表
// =====================================================================

/// 示例: listview-children —— 固定三项
class ListViewChildrenDemo extends StatelessWidget {
  const ListViewChildrenDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 240,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: const [
            ListTile(leading: Icon(Icons.home), title: Text('首页')),
            ListTile(leading: Icon(Icons.search), title: Text('搜索')),
            ListTile(leading: Icon(Icons.settings), title: Text('设置')),
          ],
        ),
      ),
    );
  }
}

/// 示例: listview-builder —— 100 条数据懒加载
class ListViewBuilderDemo extends StatelessWidget {
  const ListViewBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 260,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => ListTile(title: Text('第 $index 项')),
        ),
      ),
    );
  }
}

/// 示例: listview-separated —— 项间自动插 Divider
class ListViewSeparatedDemo extends StatelessWidget {
  const ListViewSeparatedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const items = ['苹果', '香蕉', '橙子', '葡萄', '西瓜'];
    return Center(
      child: SizedBox(
        width: 300,
        height: 260,
        child: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, i) => ListTile(title: Text(items[i])),
          separatorBuilder: (context, i) => const Divider(height: 1),
        ),
      ),
    );
  }
}

/// 示例: listview-horizontal —— 横向卡片流
class ListViewHorizontalDemo extends StatelessWidget {
  const ListViewHorizontalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const colors = [
      Colors.red,
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.purple,
    ];
    return Center(
      child: SizedBox(
        width: 320,
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          children: [
            for (final c in colors)
              Container(
                width: 80,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: c,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 示例: listview-slivers —— 头部 + 列表拼成一个滚动流
class ListViewSliversDemo extends StatelessWidget {
  const ListViewSliversDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 280,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  '本周热门',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('热门项 $index')),
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kListViewCases = <DemoCase>[
  DemoCase(
    id: 'listview-children',
    title: '固定项列表',
    description: '少量写死的条目直接用 children。',
    builder: (_) => const ListViewChildrenDemo(),
  ),
  DemoCase(
    id: 'listview-builder',
    title: 'builder 懒加载',
    description: '数据多时必须用 ListView.builder，按需构建可见项。',
    builder: (_) => const ListViewBuilderDemo(),
  ),
  DemoCase(
    id: 'listview-separated',
    title: 'separated 带分隔符',
    description: 'separatorBuilder 在每两项之间插入分隔线。',
    builder: (_) => const ListViewSeparatedDemo(),
  ),
  DemoCase(
    id: 'listview-horizontal',
    title: '横向滚动',
    description: 'scrollDirection: Axis.horizontal 让列表横着滚。',
    builder: (_) => const ListViewHorizontalDemo(),
  ),
  DemoCase(
    id: 'listview-slivers',
    title: '分组列表（Slivers）',
    description: 'CustomScrollView + SliverList 拼混合滚动流。',
    builder: (_) => const ListViewSliversDemo(),
  ),
];

// =====================================================================
// GridView 网格
// =====================================================================

/// 示例: gridview-count —— 3 列等宽网格
class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 260,
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(8),
          children: [
            for (var i = 1; i <= 9; i++)
              Container(
                alignment: Alignment.center,
                color: Colors.blue.shade100,
                child: Text('$i'),
              ),
          ],
        ),
      ),
    );
  }
}

/// 示例: gridview-extent —— 每格最宽 100，自动决定列数
class GridViewExtentDemo extends StatelessWidget {
  const GridViewExtentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        height: 220,
        child: GridView.extent(
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(8),
          children: [
            for (var i = 0; i < 12; i++)
              Container(
                alignment: Alignment.center,
                color: Colors.green.shade100,
                child: Text('$i'),
              ),
          ],
        ),
      ),
    );
  }
}

/// 示例: gridview-builder —— 100 项懒加载网格
class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 260,
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          itemCount: 100,
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            color:
                Colors.primaries[index % Colors.primaries.length].shade100,
            child: Text('$index'),
          ),
        ),
      ),
    );
  }
}

/// 示例: gridview-image —— 2 列图片墙
class GridViewImageDemo extends StatelessWidget {
  const GridViewImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: GridView.builder(
          padding: const EdgeInsets.all(4),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 1,
          ),
          itemCount: 8,
          itemBuilder: (context, index) => Image.network(
            'https://picsum.photos/seed/$index/200/200',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) =>
                Container(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}

final List<DemoCase> kGridViewCases = <DemoCase>[
  DemoCase(
    id: 'gridview-count',
    title: '固定列数 count',
    description: 'crossAxisCount 指定每行几列，最常用。',
    builder: (_) => const GridViewCountDemo(),
  ),
  DemoCase(
    id: 'gridview-extent',
    title: '固定最大宽度 extent',
    description: 'maxCrossAxisExtent 每格最宽多少，响应式友好。',
    builder: (_) => const GridViewExtentDemo(),
  ),
  DemoCase(
    id: 'gridview-builder',
    title: 'builder 懒加载',
    description: '数据多时用 GridView.builder + SliverGridDelegate。',
    builder: (_) => const GridViewBuilderDemo(),
  ),
  DemoCase(
    id: 'gridview-image',
    title: '图片墙（宽高比 + 裁剪）',
    description: 'childAspectRatio 控制单元格宽高比，配合 Image.network。',
    builder: (_) => const GridViewImageDemo(),
  ),
];

// =====================================================================
// PageView 翻页
// =====================================================================

/// 示例: pageview-basic —— 三页横滑
class PageViewBasicDemo extends StatelessWidget {
  const PageViewBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 200,
        child: PageView(
          children: const [
            ColoredBox(
              color: Colors.red,
              child: Center(
                child: Text(
                  '第 1 页',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ColoredBox(
              color: Colors.green,
              child: Center(
                child: Text(
                  '第 2 页',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ColoredBox(
              color: Colors.blue,
              child: Center(
                child: Text(
                  '第 3 页',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例: pageview-indicator —— 轮播 + 圆点指示器
class PageViewIndicatorDemo extends StatefulWidget {
  const PageViewIndicatorDemo({super.key});

  @override
  State<PageViewIndicatorDemo> createState() => _PageViewIndicatorDemoState();
}

class _PageViewIndicatorDemoState extends State<PageViewIndicatorDemo> {
  final _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const colors = [Colors.orange, Colors.teal, Colors.purple];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 300,
            height: 160,
            child: PageView.builder(
              controller: _controller,
              itemCount: colors.length,
              onPageChanged: (i) => setState(() => _page = i),
              itemBuilder: (context, i) => Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors[i],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < colors.length; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == _page ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == _page ? Colors.blue : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 示例: pageview-jump —— 按钮控制翻页
class PageViewJumpDemo extends StatefulWidget {
  const PageViewJumpDemo({super.key});

  @override
  State<PageViewJumpDemo> createState() => _PageViewJumpDemoState();
}

class _PageViewJumpDemoState extends State<PageViewJumpDemo> {
  final _controller = PageController();
  int _page = 0;

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
          SizedBox(
            width: 300,
            height: 160,
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (i) => setState(() => _page = i),
              children: const [
                ColoredBox(color: Colors.red, child: Center(child: Text('A'))),
                ColoredBox(
                  color: Colors.green,
                  child: Center(child: Text('B')),
                ),
                ColoredBox(
                  color: Colors.blue,
                  child: Center(child: Text('C')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text('当前第 $_page 页'),
          FilledButton.tonalIcon(
            onPressed: () {
              _controller.animateToPage(
                (_page + 1) % 3,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            icon: const Icon(Icons.skip_next),
            label: const Text('下一页'),
          ),
        ],
      ),
    );
  }
}

/// 示例: pageview-vertical —— 上下滑翻页
class PageViewVerticalDemo extends StatelessWidget {
  const PageViewVerticalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 220,
        height: 260,
        child: PageView(
          scrollDirection: Axis.vertical,
          children: const [
            ColoredBox(
              color: Colors.indigo,
              child: Center(
                child: Text('向上滑', style: TextStyle(color: Colors.white)),
              ),
            ),
            ColoredBox(
              color: Colors.teal,
              child: Center(
                child: Text('第二屏', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kPageViewCases = <DemoCase>[
  DemoCase(
    id: 'pageview-basic',
    title: '基本翻页',
    description: '三页纯色，滑动切换。',
    builder: (_) => const PageViewBasicDemo(),
  ),
  DemoCase(
    id: 'pageview-indicator',
    title: '带指示器的轮播',
    description: 'PageController + onPageChanged 驱动底部圆点。',
    builder: (_) => const PageViewIndicatorDemo(),
  ),
  DemoCase(
    id: 'pageview-jump',
    title: '代码跳页（下一页按钮）',
    description: 'animateToPage 平滑过渡、jumpToPage 直接切换。',
    builder: (_) => const PageViewJumpDemo(),
  ),
  DemoCase(
    id: 'pageview-vertical',
    title: '竖向翻页',
    description: 'scrollDirection: Axis.vertical，全屏引导页常见。',
    builder: (_) => const PageViewVerticalDemo(),
  ),
];

// =====================================================================
// SingleChildScrollView 单孩子滚动
// =====================================================================

/// 示例: scrollview-vertical —— 纵向滚一整块 Column
class ScrollViewVerticalDemo extends StatelessWidget {
  const ScrollViewVerticalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 240,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '标题',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              for (var i = 0; i < 20; i++)
                Text('第 $i 行内容，超出容器高度即可滚动'),
            ],
          ),
        ),
      ),
    );
  }
}

/// 示例: scrollview-horizontal —— 横向滚一排色块
class ScrollViewHorizontalDemo extends StatelessWidget {
  const ScrollViewHorizontalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        height: 90,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: const Row(
            children: [
              Text('很长很长的一行内容 '),
              Text('不会换行 '),
              Text('而是横向滚动 '),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}

/// 示例: scrollview-physics —— 内容不满也能下拉回弹
class ScrollViewPhysicsDemo extends StatelessWidget {
  const ScrollViewPhysicsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 200,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text('内容比容器短'),
              const SizedBox(height: 8),
              const Text('但仍然可以滚动回弹'),
            ],
          ),
        ),
      ),
    );
  }
}

final List<DemoCase> kScrollViewCases = <DemoCase>[
  DemoCase(
    id: 'scrollview-vertical',
    title: '纵向滚动长内容',
    description: '一整屏放不下的 Column，包一层就能滚。',
    builder: (_) => const ScrollViewVerticalDemo(),
  ),
  DemoCase(
    id: 'scrollview-horizontal',
    title: '横向滚动一行',
    description: 'scrollDirection: Axis.horizontal 让一行 Row 横滚。',
    builder: (_) => const ScrollViewHorizontalDemo(),
  ),
  DemoCase(
    id: 'scrollview-physics',
    title: '顶部对齐（小内容也滚）',
    description: '加 AlwaysScrollableScrollPhysics 内容不满也能回弹。',
    builder: (_) => const ScrollViewPhysicsDemo(),
  ),
];

// =====================================================================
// RefreshIndicator 下拉刷新
// =====================================================================

/// 示例: refresh-basic —— 下拉重新生成列表数据
class RefreshBasicDemo extends StatefulWidget {
  const RefreshBasicDemo({super.key});

  @override
  State<RefreshBasicDemo> createState() => _RefreshBasicDemoState();
}

class _RefreshBasicDemoState extends State<RefreshBasicDemo> {
  List<String> items = List.generate(20, (i) => '数据 $i');

  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    setState(() {
      items = List.generate(20, (i) => '刷新后 $i');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 260,
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, i) => ListTile(title: Text(items[i])),
          ),
        ),
      ),
    );
  }
}

/// 示例: refresh-programmatic —— 按钮触发下拉刷新动画
class RefreshProgrammaticDemo extends StatefulWidget {
  const RefreshProgrammaticDemo({super.key});

  @override
  State<RefreshProgrammaticDemo> createState() =>
      _RefreshProgrammaticDemoState();
}

class _RefreshProgrammaticDemoState extends State<RefreshProgrammaticDemo> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  int _count = 0;

  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    setState(() => _count++);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 300,
            height: 160,
            child: RefreshIndicator(
              key: _refreshKey,
              onRefresh: _onRefresh,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  ListTile(title: Text('已刷新 $_count 次')),
                  const ListTile(title: Text('↓ 或用下面按钮触发')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => _refreshKey.currentState?.show(),
            icon: const Icon(Icons.refresh),
            label: const Text('编程触发刷新'),
          ),
        ],
      ),
    );
  }
}

/// 示例: refresh-styled —— 自定义加载圈外观
class RefreshStyledDemo extends StatefulWidget {
  const RefreshStyledDemo({super.key});

  @override
  State<RefreshStyledDemo> createState() => _RefreshStyledDemoState();
}

class _RefreshStyledDemoState extends State<RefreshStyledDemo> {
  Future<void> _onRefresh() =>
      Future<void>.delayed(const Duration(seconds: 1));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 220,
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          color: Colors.white,
          backgroundColor: Colors.deepPurple,
          displacement: 60,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: const [
              ListTile(title: Text('紫色刷新圈')),
              ListTile(title: Text('下拉试试')),
            ],
          ),
        ),
      ),
    );
  }
}

final List<DemoCase> kRefreshIndicatorCases = <DemoCase>[
  DemoCase(
    id: 'refresh-basic',
    title: '基本下拉刷新',
    description: '列表下拉 → 转圈 → 数据更新后自动收起。',
    builder: (_) => const RefreshBasicDemo(),
  ),
  DemoCase(
    id: 'refresh-programmatic',
    title: '编程触发刷新',
    description: 'GlobalKey<RefreshIndicatorState> 代码唤起刷新。',
    builder: (_) => const RefreshProgrammaticDemo(),
  ),
  DemoCase(
    id: 'refresh-styled',
    title: '自定义样式',
    description: '颜色、背景色、位移高度都可调。',
    builder: (_) => const RefreshStyledDemo(),
  ),
];

// =====================================================================
// Dismissible 滑动删除
// =====================================================================

/// 示例: dismissible-basic —— 右滑删除
class DismissibleBasicDemo extends StatefulWidget {
  const DismissibleBasicDemo({super.key});

  @override
  State<DismissibleBasicDemo> createState() => _DismissibleBasicDemoState();
}

class _DismissibleBasicDemoState extends State<DismissibleBasicDemo> {
  final items = ['邮件一', '邮件二', '邮件三', '邮件四'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final item in items)
              Dismissible(
                key: Key(item),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (dir) {
                  setState(() => items.remove(item));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('已删除「$item」')),
                  );
                },
                child: ListTile(
                  title: Text(item),
                  tileColor: Colors.grey.shade100,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 示例: dismissible-twoway —— 左右滑不同操作
class DismissibleTwoWayDemo extends StatefulWidget {
  const DismissibleTwoWayDemo({super.key});

  @override
  State<DismissibleTwoWayDemo> createState() => _DismissibleTwoWayDemoState();
}

class _DismissibleTwoWayDemoState extends State<DismissibleTwoWayDemo> {
  final items = ['任务 A', '任务 B', '任务 C'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final item in items)
              Dismissible(
                key: Key(item),
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24),
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  ),
                ),
                background: Container(
                  color: Colors.green,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 24),
                  child: const Icon(Icons.archive, color: Colors.white),
                ),
                onDismissed: (dir) {
                  final msg =
                      dir == DismissDirection.startToEnd ? '已归档' : '已删除';
                  setState(() => items.remove(item));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$msg：$item')),
                  );
                },
                child: ListTile(
                  title: Text(item),
                  tileColor: Colors.grey.shade100,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 示例: dismissible-confirm —— 滑开后二次确认
class DismissibleConfirmDemo extends StatefulWidget {
  const DismissibleConfirmDemo({super.key});

  @override
  State<DismissibleConfirmDemo> createState() =>
      _DismissibleConfirmDemoState();
}

class _DismissibleConfirmDemoState extends State<DismissibleConfirmDemo> {
  final items = ['重要文件 1', '重要文件 2'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final item in items)
              Dismissible(
                key: Key(item),
                background: Container(
                  color: Colors.orange,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24),
                  child: const Icon(Icons.warning, color: Colors.white),
                ),
                confirmDismiss: (dir) async {
                  return await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('确认删除？'),
                          content: Text('「$item」删除后不可恢复'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('取消'),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('删除'),
                            ),
                          ],
                        ),
                      ) ??
                      false;
                },
                onDismissed: (_) => setState(() => items.remove(item)),
                child: ListTile(
                  title: Text(item),
                  tileColor: Colors.grey.shade100,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kDismissibleCases = <DemoCase>[
  DemoCase(
    id: 'dismissible-basic',
    title: '基本滑动删除',
    description: '右滑删除一项，露出红色背景 + 删除图标。',
    builder: (_) => const DismissibleBasicDemo(),
  ),
  DemoCase(
    id: 'dismissible-twoway',
    title: '双向滑动、不同背景',
    description: '左滑归档、右滑删除，按方向显示不同背景。',
    builder: (_) => const DismissibleTwoWayDemo(),
  ),
  DemoCase(
    id: 'dismissible-confirm',
    title: '确认后再删（confirmDismiss）',
    description: '滑开不等于删除，在 confirmDismiss 里弹框确认。',
    builder: (_) => const DismissibleConfirmDemo(),
  ),
];

// =====================================================================
// ListTile 列表项
// =====================================================================

/// 示例: listtile-basic —— 头像 + 标题 + 副标题 + 右箭头
class ListTileBasicDemo extends StatelessWidget {
  const ListTileBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: const Text('张三'),
          subtitle: const Text('在线 · 刚刚活跃'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }
}

/// 示例: listtile-selected —— 点击切换选中高亮
class ListTileSelectedDemo extends StatefulWidget {
  const ListTileSelectedDemo({super.key});

  @override
  State<ListTileSelectedDemo> createState() => _ListTileSelectedDemoState();
}

class _ListTileSelectedDemoState extends State<ListTileSelectedDemo> {
  int _current = 0;
  final options = ['微信支付', '支付宝', '银行卡'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < options.length; i++)
              ListTile(
                title: Text(options[i]),
                selected: _current == i,
                selectedTileColor: Colors.blue.shade50,
                selectedColor: Colors.blue,
                trailing:
                    _current == i ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () => setState(() => _current = i),
              ),
          ],
        ),
      ),
    );
  }
}

/// 示例: listtile-threeline —— 长副标题换行
class ListTileThreeLineDemo extends StatelessWidget {
  const ListTileThreeLineDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: const ListTile(
          leading: Icon(Icons.article),
          title: Text('一篇长文章'),
          subtitle: Text(
            '副标题内容比较长的时候会换行显示，isThreeLine 会给足三行的垂直空间',
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}

/// 示例: listtile-dense —— 紧凑行高对比
class ListTileDenseDemo extends StatelessWidget {
  const ListTileDenseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(title: Text('默认行高')),
            const ListTile(title: Text('默认行高')),
            const ListTile(dense: true, title: Text('dense 紧凑')),
            const ListTile(dense: true, title: Text('dense 紧凑')),
          ],
        ),
      ),
    );
  }
}

/// 示例: listtile-controls —— 三种 ListTile 变体
class ListTileControlsDemo extends StatefulWidget {
  const ListTileControlsDemo({super.key});

  @override
  State<ListTileControlsDemo> createState() => _ListTileControlsDemoState();
}

class _ListTileControlsDemoState extends State<ListTileControlsDemo> {
  bool _notify = true;
  String _pay = 'wechat';
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
              title: const Text('接收通知'),
              value: _notify,
              onChanged: (v) => setState(() => _notify = v ?? false),
            ),
            RadioListTile<String>(
              title: const Text('微信支付'),
              value: 'wechat',
              groupValue: _pay,
              onChanged: (v) => setState(() => _pay = v!),
            ),
            SwitchListTile(
              title: const Text('深色模式'),
              value: _dark,
              onChanged: (v) => setState(() => _dark = v),
            ),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kListTileCases = <DemoCase>[
  DemoCase(
    id: 'listtile-basic',
    title: '五槽位基本形态',
    description: 'leading / title / subtitle / trailing 一次配齐。',
    builder: (_) => const ListTileBasicDemo(),
  ),
  DemoCase(
    id: 'listtile-selected',
    title: '选中态',
    description: 'selected 高亮标题，selectedTileColor 铺底色。',
    builder: (_) => const ListTileSelectedDemo(),
  ),
  DemoCase(
    id: 'listtile-threeline',
    title: '三行标题（isThreeLine）',
    description: '副标题可能占两行时声明 isThreeLine: true。',
    builder: (_) => const ListTileThreeLineDemo(),
  ),
  DemoCase(
    id: 'listtile-dense',
    title: 'dense 紧凑模式',
    description: '设置页等密排场景用 dense: true 压缩行高。',
    builder: (_) => const ListTileDenseDemo(),
  ),
  DemoCase(
    id: 'listtile-controls',
    title: '与控件组合的现成版本',
    description: 'CheckboxListTile / RadioListTile / SwitchListTile。',
    builder: (_) => const ListTileControlsDemo(),
  ),
];

// =====================================================================
// Card 卡片
// =====================================================================

/// 示例: card-basic —— 标题 + 正文的内容卡
class CardBasicDemo extends StatelessWidget {
  const CardBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Card(
          margin: const EdgeInsets.all(12),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '卡片标题',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text('卡片正文内容，Card 只负责表面样式，内部自由摆放任意 widget。'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 示例: card-clickable —— 整卡可点带水波纹
class CardClickableDemo extends StatelessWidget {
  const CardClickableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.photo_album, color: Colors.blue),
                  SizedBox(width: 12),
                  Expanded(child: Text('点整张卡片都有水波纹')),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 示例: card-media —— 图片 + 文字 + 操作区
class CardMediaDemo extends StatelessWidget {
  const CardMediaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Image.network(
                'https://picsum.photos/seed/card/280/150',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '云南大理',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '风花雪月，苍山洱海。',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 示例: card-shape —— 不同圆角与阴影对比
class CardShapeDemo extends StatelessWidget {
  const CardShapeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 0,
              color: Colors.amber.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.amber),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('描边 + 无阴影'),
              ),
            ),
            Card(
              elevation: 8,
              shape: const StadiumBorder(),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('胶囊形 + 深阴影'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kCardCases = <DemoCase>[
  DemoCase(
    id: 'card-basic',
    title: '基本信息卡',
    description: 'Card + 内部 Column 组合一张内容卡。',
    builder: (_) => const CardBasicDemo(),
  ),
  DemoCase(
    id: 'card-clickable',
    title: '可点击卡片',
    description: 'Card 本身不处理点击，内嵌 InkWell + clipBehavior。',
    builder: (_) => const CardClickableDemo(),
  ),
  DemoCase(
    id: 'card-media',
    title: '图文媒体卡',
    description: '上图下文的典型 feed 卡片。',
    builder: (_) => const CardMediaDemo(),
  ),
  DemoCase(
    id: 'card-shape',
    title: '形状与高度定制',
    description: 'shape 换边框/圆角，elevation 控制阴影层级。',
    builder: (_) => const CardShapeDemo(),
  ),
];

// =====================================================================
// 分组装配
// =====================================================================

final ComponentGroup kScrollListGroup = ComponentGroup(
  title: '滚动与列表',
  icon: Icons.swap_vert_outlined,
  items: <ComponentInfo>[
    ComponentInfo(
      name: 'ListView 列表',
      route: '/components/listview',
      kind: 'StatelessWidget',
      intro: 'ListView 是可滚动列表，Flutter 里最核心的长内容组件，懒加载只渲染视口内的项。',
      cases: kListViewCases,
    ),
    ComponentInfo(
      name: 'GridView 网格',
      route: '/components/gridview',
      kind: 'StatelessWidget',
      intro: 'GridView 以固定的行列网格展示内容，典型场景是图片墙、功能入口九宫格。',
      cases: kGridViewCases,
    ),
    ComponentInfo(
      name: 'PageView 翻页',
      route: '/components/pageview',
      kind: 'StatefulWidget',
      intro: 'PageView 一次显示一页，左右（或上下）滑动切换。适合引导页、图片轮播。',
      cases: kPageViewCases,
    ),
    ComponentInfo(
      name: 'SingleChildScrollView 单孩子滚动',
      route: '/components/scrollview',
      kind: 'StatefulWidget',
      intro: 'SingleChildScrollView 让一个子组件变得可滚动，适合一整块固定内容滚动。',
      cases: kScrollViewCases,
    ),
    ComponentInfo(
      name: 'RefreshIndicator 下拉刷新',
      route: '/components/refreshindicator',
      kind: 'StatefulWidget',
      intro: 'RefreshIndicator 包裹可滚动组件，用户下拉时显示加载圈，松手触发异步刷新。',
      cases: kRefreshIndicatorCases,
    ),
    ComponentInfo(
      name: 'Dismissible 滑动删除',
      route: '/components/dismissible',
      kind: 'StatefulWidget',
      intro: 'Dismissible 让子组件可以向某个方向滑走，滑出后触发回调（通常删除）。',
      cases: kDismissibleCases,
    ),
    ComponentInfo(
      name: 'ListTile 列表项',
      route: '/components/listtile',
      kind: 'StatelessWidget',
      intro: 'ListTile 是 Material 标准的"一行列表项"布局，预置五个槽位，点击/水波纹自带。',
      cases: kListTileCases,
    ),
    ComponentInfo(
      name: 'Card 卡片',
      route: '/components/card',
      kind: 'StatelessWidget',
      intro: 'Card 是一个带圆角、阴影、内边距的 Material 表面容器，用来把相关内容成组浮在页面上。',
      cases: kCardCases,
    ),
  ],
);
