import 'package:flutter/material.dart';

import '../models/demo_models.dart';

// =====================================================================
// Scaffold 页面脚手架
// =====================================================================

/// 示例: scaffold-full —— appBar + body + FAB + 底部导航 + 抽屉
class ScaffoldFullDemo extends StatefulWidget {
  const ScaffoldFullDemo({super.key});

  @override
  State<ScaffoldFullDemo> createState() => _ScaffoldFullDemoState();
}

class _ScaffoldFullDemoState extends State<ScaffoldFullDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      drawer: const Drawer(child: Center(child: Text('抽屉内容'))),
      body: IndexedStack(
        index: _index,
        children: const [
          Center(child: Text('页面 0')),
          Center(child: Text('页面 1')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}

/// 示例: scaffold-safearea —— 内容避开刘海/手势条
class ScaffoldSafeAreaDemo extends StatelessWidget {
  const ScaffoldSafeAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('详情')),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('这段内容不会被底部手势条挡住'),
        ),
      ),
    );
  }
}

/// 示例: scaffold-flexible-appbar —— 图片头 + 渐隐标题栏
class ScaffoldFlexibleDemo extends StatelessWidget {
  const ScaffoldFlexibleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('相册', style: TextStyle(color: Colors.white)),
              background: Image.network(
                'https://picsum.photos/seed/scaffold/600/360',
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  color: Colors.blueGrey,
                  child: const Icon(Icons.image, color: Colors.white),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('向下滚动看标题栏收缩效果……'),
            ),
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kScaffoldCases = <DemoCase>[
  DemoCase(
    id: 'scaffold-full',
    title: '完整骨架',
    description: 'appBar + body + FAB + 底部导航 + 抽屉一次配齐。',
    previewHeight: 420,
    previewFill: true,
    builder: (_) => const ScaffoldFullDemo(),
  ),
  DemoCase(
    id: 'scaffold-safearea',
    title: 'body 的安全区处理',
    description: '非滚动内容记得包 SafeArea。',
    previewHeight: 320,
    previewFill: true,
    builder: (_) => const ScaffoldSafeAreaDemo(),
  ),
  DemoCase(
    id: 'scaffold-flexible-appbar',
    title: '透明顶栏（封面头图）',
    description: 'SliverAppBar + flexibleSpace 做图片头图。',
    previewHeight: 360,
    previewFill: true,
    builder: (_) => const ScaffoldFlexibleDemo(),
  ),
];

// =====================================================================
// AppBar 顶栏
// =====================================================================

/// 示例: appbar-basic —— 居中标题 + 右侧两个操作
class AppBarBasicDemo extends StatelessWidget {
  const AppBarBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人资料'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: const Center(child: Text('页面内容')),
    );
  }
}

/// 示例: appbar-leading —— 手动指定左侧按钮
class AppBarLeadingDemo extends StatelessWidget {
  const AppBarLeadingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.maybePop(context),
        ),
        automaticallyImplyLeading: true,
      ),
      body: const Center(child: Text('左上角是 ✕ 不是 ←')),
    );
  }
}

/// 示例: appbar-bottom-tab —— 顶栏下方选项卡
class AppBarBottomTabDemo extends StatelessWidget {
  const AppBarBottomTabDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('音乐'),
          bottom: const TabBar(
            tabs: [Tab(text: '热门'), Tab(text: '新歌'), Tab(text: '排行')],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('热门')),
            Center(child: Text('新歌')),
            Center(child: Text('排行')),
          ],
        ),
      ),
    );
  }
}

/// 示例: appbar-search —— 标题即搜索框
class AppBarSearchDemo extends StatefulWidget {
  const AppBarSearchDemo({super.key});

  @override
  State<AppBarSearchDemo> createState() => _AppBarSearchDemoState();
}

class _AppBarSearchDemoState extends State<AppBarSearchDemo> {
  bool _searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searching
            ? const TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: '搜索…'),
              )
            : const Text('商品列表'),
        actions: [
          IconButton(
            icon: Icon(_searching ? Icons.close : Icons.search),
            onPressed: () => setState(() => _searching = !_searching),
          ),
        ],
      ),
      body: const Center(child: Text('点右上角切换搜索态')),
    );
  }
}

final List<DemoCase> kAppBarCases = <DemoCase>[
  DemoCase(
    id: 'appbar-basic',
    title: '基本顶栏',
    description: '居中标题 + 右侧两个操作。',
    previewHeight: 300,
    previewFill: true,
    builder: (_) => const AppBarBasicDemo(),
  ),
  DemoCase(
    id: 'appbar-leading',
    title: '自动返回按钮与抽屉按钮',
    description: 'leading 手动覆盖默认返回/抽屉按钮。',
    previewHeight: 300,
    previewFill: true,
    builder: (_) => const AppBarLeadingDemo(),
  ),
  DemoCase(
    id: 'appbar-bottom-tab',
    title: 'bottom 挂 TabBar',
    description: '顶栏下方挂选项卡。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const AppBarBottomTabDemo(),
  ),
  DemoCase(
    id: 'appbar-search',
    title: '搜索栏形态',
    description: '标题位置换成输入框。',
    previewHeight: 300,
    previewFill: true,
    builder: (_) => const AppBarSearchDemo(),
  ),
];

// =====================================================================
// BottomNavigationBar 底部导航
// =====================================================================

/// 示例: bottomnav-basic —— 首页/发现/我的
class BottomNavBasicDemo extends StatefulWidget {
  const BottomNavBasicDemo({super.key});

  @override
  State<BottomNavBasicDemo> createState() => _BottomNavBasicDemoState();
}

class _BottomNavBasicDemoState extends State<BottomNavBasicDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          Center(child: Text('首页')),
          Center(child: Text('发现')),
          Center(child: Text('我的')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}

/// 示例: bottomnav-shifting —— 选中态带背景 pill
class BottomNavShiftingDemo extends StatefulWidget {
  const BottomNavShiftingDemo({super.key});

  @override
  State<BottomNavShiftingDemo> createState() => _BottomNavShiftingDemoState();
}

class _BottomNavShiftingDemoState extends State<BottomNavShiftingDemo> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Tab $_index')),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页', backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索', backgroundColor: Colors.teal),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '通知', backgroundColor: Colors.purple),
        ],
      ),
    );
  }
}

/// 示例: bottomnav-indexedstack —— Tab 切换不丢状态
class BottomNavIndexedStackDemo extends StatefulWidget {
  const BottomNavIndexedStackDemo({super.key});

  @override
  State<BottomNavIndexedStackDemo> createState() => _BottomNavIndexedStackDemoState();
}

class _BottomNavIndexedStackDemoState extends State<BottomNavIndexedStackDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          ListView.builder(itemCount: 50, itemBuilder: (c, i) => ListTile(title: Text('首页 $i'))),
          ListView.builder(itemCount: 50, itemBuilder: (c, i) => ListTile(title: Text('发现 $i'))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: '发现'),
        ],
      ),
    );
  }
}

/// 示例: bottomnav-m3-navigationbar —— NavigationBar 新组件
class BottomNavM3Demo extends StatefulWidget {
  const BottomNavM3Demo({super.key});

  @override
  State<BottomNavM3Demo> createState() => _BottomNavM3DemoState();
}

class _BottomNavM3DemoState extends State<BottomNavM3Demo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('页面 $_index')),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: '首页'),
          NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: '搜索'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}

final List<DemoCase> kBottomNavCases = <DemoCase>[
  DemoCase(
    id: 'bottomnav-basic',
    title: '基本三 Tab',
    description: '首页/发现/我的，点项切 currentIndex。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const BottomNavBasicDemo(),
  ),
  DemoCase(
    id: 'bottomnav-shifting',
    title: 'fixed vs shifting',
    description: 'shifting 选中项显示文字 + 背景色。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const BottomNavShiftingDemo(),
  ),
  DemoCase(
    id: 'bottomnav-indexedstack',
    title: '保持各页状态（IndexedStack）',
    description: 'IndexedStack 保留各 Tab 的滚动位置。',
    previewHeight: 360,
    previewFill: true,
    builder: (_) => const BottomNavIndexedStackDemo(),
  ),
  DemoCase(
    id: 'bottomnav-m3-navigationbar',
    title: 'M3 替代者：NavigationBar',
    description: 'Material 3 新一代底部导航。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const BottomNavM3Demo(),
  ),
];

// =====================================================================
// NavigationRail 侧边导航
// =====================================================================

/// 示例: rail-basic —— 左侧双项导航
class RailBasicDemo extends StatefulWidget {
  const RailBasicDemo({super.key});

  @override
  State<RailBasicDemo> createState() => _RailBasicDemoState();
}

class _RailBasicDemoState extends State<RailBasicDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          labelType: NavigationRailLabelType.all,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('首页'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: Text('设置'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: Center(child: Text('内容区 $_index'))),
      ],
    );
  }
}

/// 示例: rail-extended —— 可展开的桌面风格
class RailExtendedDemo extends StatefulWidget {
  const RailExtendedDemo({super.key});

  @override
  State<RailExtendedDemo> createState() => _RailExtendedDemoState();
}

class _RailExtendedDemoState extends State<RailExtendedDemo> {
  int _index = 0;
  bool _extended = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          indicatorColor: Colors.blue.shade100,
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () => setState(() => _extended = !_extended)),
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          // 用 labelType 模拟展开/收起文字（该版本无 NavigationRail.extended 构造器）
          labelType: _extended ? NavigationRailLabelType.all : NavigationRailLabelType.selected,
          destinations: const [
            NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('仪表盘')),
            NavigationRailDestination(icon: Icon(Icons.mail), label: Text('邮件')),
            NavigationRailDestination(icon: Icon(Icons.calendar_month), label: Text('日历')),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: Center(child: Text('页面 $_index（点 ☰ 收展）'))),
      ],
    );
  }
}

/// 示例: rail-leading-trailing —— 上下扩展槽位
class RailSlotsDemo extends StatelessWidget {
  const RailSlotsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: 0,
          leading: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: FlutterLogo(size: 32),
          ),
          trailing: const Expanded(child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(padding: EdgeInsets.only(bottom: 8), child: Icon(Icons.help_outline)),
          )),
          labelType: NavigationRailLabelType.all,
          destinations: const [
            NavigationRailDestination(icon: Icon(Icons.star), label: Text('精选')),
            NavigationRailDestination(icon: Icon(Icons.video_library), label: Text('课程')),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        const Expanded(child: Center(child: Text('主内容'))),
      ],
    );
  }
}

/// 示例: rail-responsive —— 窗口宽窄自适应
class RailResponsiveDemo extends StatefulWidget {
  const RailResponsiveDemo({super.key});

  @override
  State<RailResponsiveDemo> createState() => _RailResponsiveDemoState();
}

class _RailResponsiveDemoState extends State<RailResponsiveDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final wide = c.maxWidth >= 600;
        return Scaffold(
          body: Row(
            children: [
              if (wide)
                NavigationRail(
                  selectedIndex: _index,
                  onDestinationSelected: (i) => setState(() => _index = i),
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.home), label: Text('首页')),
                    NavigationRailDestination(icon: Icon(Icons.person), label: Text('我的')),
                  ],
                ),
              Expanded(child: Center(child: Text('页面 $_index（当前 ${wide ? '宽屏侧栏' : '窄屏底栏'}）'))),
            ],
          ),
          bottomNavigationBar: wide
              ? null
              : BottomNavigationBar(
                  currentIndex: _index,
                  onTap: (i) => setState(() => _index = i),
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
                  ],
                ),
        );
      },
    );
  }
}

final List<DemoCase> kRailCases = <DemoCase>[
  DemoCase(
    id: 'rail-basic',
    title: '基本用法',
    description: '左侧竖排导航，labelType.all 始终显示文字。',
    previewHeight: 300,
    previewFill: true,
    builder: (_) => const RailBasicDemo(),
  ),
  DemoCase(
    id: 'rail-extended',
    title: '可展开（extended）',
    description: 'NavigationRail.extended 选中项旁滑出文字。',
    previewHeight: 300,
    previewFill: true,
    builder: (_) => const RailExtendedDemo(),
  ),
  DemoCase(
    id: 'rail-leading-trailing',
    title: '顶部/底部附加区',
    description: 'leading 放 logo，trailing 放次要项。',
    previewHeight: 300,
    previewFill: true,
    builder: (_) => const RailSlotsDemo(),
  ),
  DemoCase(
    id: 'rail-responsive',
    title: '响应式：宽屏侧栏、窄屏底栏',
    description: '按宽度切换两种导航（预览宽度会触发窄屏）。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const RailResponsiveDemo(),
  ),
];

// =====================================================================
// Drawer 抽屉
// =====================================================================

/// 示例: drawer-basic —— 标准侧边菜单
class DrawerBasicDemo extends StatefulWidget {
  const DrawerBasicDemo({super.key});

  @override
  State<DrawerBasicDemo> createState() => _DrawerBasicDemoState();
}

class _DrawerBasicDemoState extends State<DrawerBasicDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 24, child: Icon(Icons.person)),
                  SizedBox(height: 8),
                  Text('张三', style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('个人中心'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('设置'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('点左上角 ☰ 打开抽屉')),
    );
  }
}

/// 示例: drawer-programmatic —— 按钮唤开抽屉
class DrawerProgrammaticDemo extends StatefulWidget {
  const DrawerProgrammaticDemo({super.key});

  @override
  State<DrawerProgrammaticDemo> createState() => _DrawerProgrammaticDemoState();
}

class _DrawerProgrammaticDemoState extends State<DrawerProgrammaticDemo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('首页')),
      drawer: const Drawer(child: Center(child: Text('抽屉内容'))),
      body: Center(
        child: FilledButton.icon(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(Icons.menu_open),
          label: const Text('代码打开抽屉'),
        ),
      ),
    );
  }
}

/// 示例: drawer-end —— 右侧筛选面板
class EndDrawerDemo extends StatefulWidget {
  const EndDrawerDemo({super.key});

  @override
  State<EndDrawerDemo> createState() => _EndDrawerDemoState();
}

class _EndDrawerDemoState extends State<EndDrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('商品列表')),
      endDrawer: SizedBox(
        width: 260,
        child: Drawer(
          child: ListView(
            children: const [
              Padding(padding: EdgeInsets.all(16), child: Text('筛选', style: TextStyle(fontWeight: FontWeight.bold))),
              ListTile(title: Text('价格从低到高')),
              ListTile(title: Text('仅看有货')),
            ],
          ),
        ),
      ),
      body: const Center(child: Text('点右上角图标开右抽屉')),
    );
  }
}

final List<DemoCase> kDrawerCases = <DemoCase>[
  DemoCase(
    id: 'drawer-basic',
    title: '基本抽屉',
    description: '菜单头 + 列表项，点项先关抽屉。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const DrawerBasicDemo(),
  ),
  DemoCase(
    id: 'drawer-programmatic',
    title: '编程开合',
    description: 'GlobalKey<ScaffoldState> 控制开关。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const DrawerProgrammaticDemo(),
  ),
  DemoCase(
    id: 'drawer-end',
    title: '右侧抽屉 endDrawer',
    description: 'endDrawer 常自限宽度。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const EndDrawerDemo(),
  ),
];

// =====================================================================
// TabBar / TabBarView 选项卡
// =====================================================================

/// 示例: tabbar-default —— 三页联动
class TabBarDefaultDemo extends StatelessWidget {
  const TabBarDefaultDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('资讯'),
          bottom: const TabBar(
            tabs: [Tab(text: '热点'), Tab(text: '科技'), Tab(text: '体育')],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('热点内容')),
            Center(child: Text('科技内容')),
            Center(child: Text('体育内容')),
          ],
        ),
      ),
    );
  }
}

/// 示例: tabbar-controller —— 监听 + 按钮跳页
class TabBarControllerDemo extends StatefulWidget {
  const TabBarControllerDemo({super.key});

  @override
  State<TabBarControllerDemo> createState() => _TabBarControllerDemoState();
}

class _TabBarControllerDemoState extends State<TabBarControllerDemo>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(length: 3, vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('手动控制'),
        bottom: TabBar(
          controller: _controller,
          tabs: const [Tab(text: 'A'), Tab(text: 'B'), Tab(text: 'C')],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Center(
            child: FilledButton(
              onPressed: () => _controller.animateTo(2, duration: const Duration(milliseconds: 300), curve: Curves.easeOut),
              child: const Text('跳到 C 页'),
            ),
          ),
          const Center(child: Text('B')),
          const Center(child: Text('C')),
        ],
      ),
    );
  }
}

/// 示例: tabbar-scrollable —— 可滚动的图标标签
class TabBarScrollableDemo extends StatelessWidget {
  const TabBarScrollableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const tabs = ['推荐', '热门', '音乐', '游戏', '影视', '知识', '动漫', '体育'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('频道'),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              for (final t in tabs) Tab(icon: const Icon(Icons.bolt), text: t),
            ],
          ),
        ),
        body: TabBarView(
          children: [for (final t in tabs) Center(child: Text(t))],
        ),
      ),
    );
  }
}

/// 示例: tabbar-only —— 仅标签条手动切 IndexedStack
class TabBarOnlyDemo extends StatefulWidget {
  const TabBarOnlyDemo({super.key});

  @override
  State<TabBarOnlyDemo> createState() => _TabBarOnlyDemoState();
}

class _TabBarOnlyDemoState extends State<TabBarOnlyDemo>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _controller,
          tabs: const [Tab(text: '一'), Tab(text: '二'), Tab(text: '三')],
        ),
        Expanded(
          child: IndexedStack(
            index: _controller.index,
            children: const [
              Center(child: Text('页一')),
              Center(child: Text('页二')),
              Center(child: Text('页三')),
            ],
          ),
        ),
      ],
    );
  }
}

final List<DemoCase> kTabBarCases = <DemoCase>[
  DemoCase(
    id: 'tabbar-default',
    title: 'DefaultTabController（最省事）',
    description: 'TabBar 与 TabBarView 自动对上。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const TabBarDefaultDemo(),
  ),
  DemoCase(
    id: 'tabbar-controller',
    title: '手动 TabController',
    description: '可监听切页、代码跳页。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const TabBarControllerDemo(),
  ),
  DemoCase(
    id: 'tabbar-scrollable',
    title: '图标 + 文字 + 滚动 Tab',
    description: 'isScrollable 横向滚动而不是压缩。',
    previewHeight: 340,
    previewFill: true,
    builder: (_) => const TabBarScrollableDemo(),
  ),
  DemoCase(
    id: 'tabbar-only',
    title: '各自独立使用',
    description: 'TabBar + IndexedStack 手动切 body。',
    previewHeight: 300,
    previewFill: true,
    builder: (_) => const TabBarOnlyDemo(),
  ),
];

// =====================================================================
// PopupMenuButton 弹出菜单
// =====================================================================

/// 示例: popup-basic —— 编辑/删除两项
class PopupBasicDemo extends StatelessWidget {
  const PopupBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<String>(
        onSelected: (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('点了：$value'), duration: const Duration(seconds: 1)),
          );
        },
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'edit', child: Text('编辑')),
          PopupMenuItem(value: 'delete', child: Text('删除')),
        ],
      ),
    );
  }
}

/// 示例: popup-custom-trigger —— 文字按钮触发 + 下方弹出
class PopupCustomTriggerDemo extends StatelessWidget {
  const PopupCustomTriggerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<String>(
        offset: const Offset(0, 48),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text('排序方式', style: TextStyle(color: Colors.blue)),
        ),
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'time', child: Text('按时间')),
          PopupMenuItem(value: 'price', child: Text('按价格')),
          PopupMenuItem(value: 'sales', child: Text('按销量')),
        ],
        onSelected: (v) {},
      ),
    );
  }
}

/// 示例: popup-rich —— 图标 + 选中态 + 分隔线
class PopupRichDemo extends StatefulWidget {
  const PopupRichDemo({super.key});

  @override
  State<PopupRichDemo> createState() => _PopupRichDemoState();
}

class _PopupRichDemoState extends State<PopupRichDemo> {
  String _view = 'list';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<String>(
        icon: const Icon(Icons.view_array),
        initialValue: _view,
        onSelected: (v) => setState(() => _view = v),
        itemBuilder: (context) => [
          const CheckedPopupMenuItem(value: 'list', child: Text('列表视图')),
          const CheckedPopupMenuItem(value: 'grid', child: Text('网格视图')),
          const PopupMenuDivider(),
          PopupMenuItem(
            value: 'setting',
            child: const Row(children: [Icon(Icons.tune, size: 18), SizedBox(width: 8), Text('显示设置')]),
          ),
        ],
      ),
    );
  }
}

/// 示例: popup-callback —— 每项独立回调
class PopupCallbackDemo extends StatelessWidget {
  const PopupCallbackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<void>(
        itemBuilder: (context) => [
          PopupMenuItem(onTap: () => debugPrint('分享'), child: const Text('分享')),
          PopupMenuItem(onTap: () => debugPrint('收藏'), child: const Text('收藏')),
        ],
      ),
    );
  }
}

/// 示例: popup-disabled —— 禁用态
class PopupDisabledDemo extends StatelessWidget {
  const PopupDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<String>(
        enabled: false,
        tooltip: '暂不可用',
        itemBuilder: (context) => const [PopupMenuItem(value: 'a', child: Text('A'))],
      ),
    );
  }
}

final List<DemoCase> kPopupCases = <DemoCase>[
  DemoCase(
    id: 'popup-basic',
    title: '基本用法',
    description: '默认 ⋮ 按钮，点项回调 onSelected。',
    builder: (_) => const PopupBasicDemo(),
  ),
  DemoCase(
    id: 'popup-custom-trigger',
    title: '自定义触发按钮与偏移',
    description: 'child 换按钮外观，offset 控制弹出位置。',
    builder: (_) => const PopupCustomTriggerDemo(),
  ),
  DemoCase(
    id: 'popup-rich',
    title: '带图标与分组的菜单',
    description: 'CheckedPopupMenuItem + PopupMenuDivider。',
    builder: (_) => const PopupRichDemo(),
  ),
  DemoCase(
    id: 'popup-callback',
    title: '回调式',
    description: '每项自带 onTap。',
    builder: (_) => const PopupCallbackDemo(),
  ),
  DemoCase(
    id: 'popup-disabled',
    title: '启用条件',
    description: 'enabled: false 置灰不可点。',
    builder: (_) => const PopupDisabledDemo(),
  ),
];

// =====================================================================
// Navigator 路由跳转
// =====================================================================

/// 跳转目标页（带参）
class NavDetailPage extends StatelessWidget {
  const NavDetailPage({super.key, required this.id, required this.name});

  final int id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情 #$id')),
      body: Center(child: Text('姓名：$name，点左上角返回')),
    );
  }
}

/// 示例: navigator-push —— 带参跳转详情页
class NavigatorPushDemo extends StatelessWidget {
  const NavigatorPushDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NavDetailPage(id: 42, name: '张三'),
            ),
          );
        },
        icon: const Icon(Icons.arrow_forward),
        label: const Text('去详情'),
      ),
    );
  }
}

/// 城市选择页（回传结果）
class CityPickerPage extends StatelessWidget {
  const CityPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('选择城市')),
      body: ListView(
        children: [
          for (final city in const ['北京', '上海', '广州', '深圳'])
            ListTile(title: Text(city), onTap: () => Navigator.pop(context, city)),
        ],
      ),
    );
  }
}

/// 示例: navigator-result —— 选择页回传结果
class NavigatorResultDemo extends StatefulWidget {
  const NavigatorResultDemo({super.key});

  @override
  State<NavigatorResultDemo> createState() => _NavigatorResultDemoState();
}

class _NavigatorResultDemoState extends State<NavigatorResultDemo> {
  String? _picked;

  Future<void> _pickCity() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const CityPickerPage()),
    );
    if (result != null && mounted) setState(() => _picked = result);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_picked ?? '还没选城市'),
          const SizedBox(height: 8),
          FilledButton(onPressed: _pickCity, child: const Text('去选城市')),
        ],
      ),
    );
  }
}

/// 示例: navigator-pop-replace —— 在内嵌 Navigator 里演示 push/pop/replace
class NavigatorPopReplaceDemo extends StatelessWidget {
  const NavigatorPopReplaceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => settings.name == '/detail'
            ? _PopReplaceDetail()
            : _PopReplaceHome(),
      ),
    );
  }
}

class _PopReplaceHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('主页（内嵌导航）'),
        const SizedBox(height: 12),
        FilledButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => _PopReplaceDetail())),
          child: const Text('push 子页'),
        ),
      ],
    );
  }
}

class _PopReplaceDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('子页'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('pop 返回'),
            ),
            const SizedBox(width: 12),
            FilledButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => _PopReplaceHome())),
              child: const Text('replace 回主页'),
            ),
          ],
        ),
      ],
    );
  }
}

/// 示例: navigator-named —— 内嵌 Navigator 演示命名路由与参数
class NavigatorNamedDemo extends StatelessWidget {
  const NavigatorNamedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) {
          if (settings.name == '/detail') {
            final args = (settings.arguments ?? const {'id': 7}) as Map<String, dynamic>;
            return _NamedDetail(id: args['id'] as int);
          }
          return const _NamedHome();
        },
      ),
    );
  }
}

class _NamedHome extends StatelessWidget {
  const _NamedHome();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () => Navigator.pushNamed(context, '/detail', arguments: const {'id': 7}),
        child: const Text('pushNamed 去详情'),
      ),
    );
  }
}

class _NamedDetail extends StatelessWidget {
  const _NamedDetail({required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('详情 #$id'),
        const SizedBox(height: 12),
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('返回')),
      ],
    );
  }
}

/// 示例: navigator-popscope —— 返回前弹确认
class NavigatorPopScopeDemo extends StatelessWidget {
  const NavigatorPopScopeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('放弃编辑？'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('继续编辑')),
              FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('放弃')),
            ],
          ),
        );
        if (shouldPop == true && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text('本页拦截了返回手势，点系统返回会弹确认（需在真实路由页才会触发）')),
      ),
    );
  }
}

final List<DemoCase> kNavigatorCases = <DemoCase>[
  DemoCase(
    id: 'navigator-push',
    title: '跳转到新页面（命令式）',
    description: 'push 一个 MaterialPageRoute，参数走构造函数。',
    builder: (_) => const NavigatorPushDemo(),
  ),
  DemoCase(
    id: 'navigator-result',
    title: '接收返回值',
    description: 'push 返回 Future，pop(context, value) 拿结果。',
    builder: (_) => const NavigatorResultDemo(),
  ),
  DemoCase(
    id: 'navigator-pop-replace',
    title: '返回与替换',
    description: '内嵌 Navigator 演示 pop / pushReplacement。',
    previewHeight: 260,
    previewFill: true,
    builder: (_) => const NavigatorPopReplaceDemo(),
  ),
  DemoCase(
    id: 'navigator-named',
    title: '命名路由',
    description: 'pushNamed + arguments（此处用内嵌 Navigator 自洽演示）。',
    previewHeight: 260,
    previewFill: true,
    builder: (_) => const NavigatorNamedDemo(),
  ),
  DemoCase(
    id: 'navigator-popscope',
    title: '返回拦截（PopScope）',
    description: 'canPop: false + onPopInvokedWithResult 拦截返回。',
    previewHeight: 220,
    previewFill: true,
    builder: (_) => const NavigatorPopScopeDemo(),
  ),
];

// =====================================================================
// 分组装配
// =====================================================================

final ComponentGroup kNavigationGroup = ComponentGroup(
  title: '导航与页面骨架',
  icon: Icons.navigation_outlined,
  items: <ComponentInfo>[
    ComponentInfo(
      name: 'Scaffold 页面脚手架',
      route: '/components/scaffold',
      kind: 'StatefulWidget',
      intro: 'Scaffold 是 Material 页面的骨架容器，把 AppBar、body、底部导航、FAB、抽屉等槽位统一安排。',
      cases: kScaffoldCases,
    ),
    ComponentInfo(
      name: 'AppBar 顶栏',
      route: '/components/appbar',
      kind: 'StatefulWidget',
      intro: 'AppBar 是页面顶部那条栏，放标题、返回按钮、右侧操作，还能挂 bottom。',
      cases: kAppBarCases,
    ),
    ComponentInfo(
      name: 'BottomNavigationBar 底部导航',
      route: '/components/bottomnavigationbar',
      kind: 'StatefulWidget',
      intro: 'App 最常见的底部主导航，放 Scaffold.bottomNavigationBar，点项切 currentIndex。',
      cases: kBottomNavCases,
    ),
    ComponentInfo(
      name: 'NavigationRail 侧边导航',
      route: '/components/navigationrail',
      kind: 'StatefulWidget',
      intro: 'NavigationRail 是竖向导航栏，常用于平板/桌面/宽屏布局。',
      cases: kRailCases,
    ),
    ComponentInfo(
      name: 'Drawer 抽屉',
      route: '/components/drawer',
      kind: 'StatelessWidget',
      intro: 'Drawer 是从屏幕侧边滑出的面板，挂到 Scaffold.drawer，AppBar 自动出现 ☰。',
      cases: kDrawerCases,
    ),
    ComponentInfo(
      name: 'TabBar / TabBarView 选项卡',
      route: '/components/tabbar',
      kind: 'StatefulWidget',
      intro: 'TabBar 是顶部标签条，TabBarView 是可左右滑动内容页，通过 TabController 联动。',
      cases: kTabBarCases,
    ),
    ComponentInfo(
      name: 'PopupMenuButton 弹出菜单',
      route: '/components/popupmenubutton',
      kind: 'StatefulWidget',
      intro: 'PopupMenuButton 点击后弹出一小组菜单项，选中回调 onSelected。',
      cases: kPopupCases,
    ),
    ComponentInfo(
      name: 'Navigator 路由跳转',
      route: '/components/navigator',
      kind: 'StatefulWidget',
      intro: 'Navigator 管理页面入栈/出栈，有命令式和命名路由两种写法。',
      cases: kNavigatorCases,
    ),
  ],
);
