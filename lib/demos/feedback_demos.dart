import 'package:flutter/material.dart';

import '../models/demo_models.dart';

// =====================================================================
// AlertDialog 对话框
// =====================================================================

/// 示例: alert-confirm —— 删除二次确认
class AlertDialogConfirmDemo extends StatefulWidget {
  const AlertDialogConfirmDemo({super.key});

  @override
  State<AlertDialogConfirmDemo> createState() => _AlertDialogConfirmDemoState();
}

class _AlertDialogConfirmDemoState extends State<AlertDialogConfirmDemo> {
  String _status = '待操作';

  Future<void> _confirmDelete() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除？'),
        content: const Text('删除后不可恢复。'),
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
    );
    if (!mounted) return;
    setState(() => _status = ok == true ? '已删除' : '已取消');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_status),
          const SizedBox(height: 8),
          FilledButton.tonalIcon(
            onPressed: _confirmDelete,
            icon: const Icon(Icons.delete),
            label: const Text('删除文件'),
          ),
        ],
      ),
    );
  }
}

/// 示例: alert-input —— 重命名输入弹窗
class AlertDialogInputDemo extends StatefulWidget {
  const AlertDialogInputDemo({super.key});

  @override
  State<AlertDialogInputDemo> createState() => _AlertDialogInputDemoState();
}

class _AlertDialogInputDemoState extends State<AlertDialogInputDemo> {
  final _controller = TextEditingController(text: '旧文件名');
  String _name = '旧文件名';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _rename() async {
    _controller.text = _name;
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('重命名'),
        content: TextField(controller: _controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
          FilledButton(
            onPressed: () => Navigator.pop(context, _controller.text),
            child: const Text('确定'),
          ),
        ],
      ),
    );
    if (result != null && result.isNotEmpty && mounted) setState(() => _name = result);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('当前名称：$_name'),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: _rename, child: const Text('重命名')),
        ],
      ),
    );
  }
}

/// 示例: alert-simple-dialog —— 打开方式选择
class SimpleDialogDemo extends StatefulWidget {
  const SimpleDialogDemo({super.key});

  @override
  State<SimpleDialogDemo> createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _opened = '默认';

  Future<void> _pick() async {
    final app = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Open with'),
        children: [
          for (final app in const ['浏览器', 'PDF 阅读器', '编辑器'])
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, app),
              child: Text(app),
            ),
        ],
      ),
    );
    if (app != null && mounted) setState(() => _opened = app);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('用「$_opened」打开'),
          const SizedBox(height: 8),
          FilledButton(onPressed: _pick, child: const Text('选择打开方式')),
        ],
      ),
    );
  }
}

/// 示例: alert-unclosable —— barrierDismissible false + 自定义 icon/形状
class AlertDialogStyledDemo extends StatelessWidget {
  const AlertDialogStyledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            icon: const Icon(Icons.warning_amber, color: Colors.orange, size: 36),
            title: const Text('需要登录'),
            content: const Text('登录后才能继续操作。'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            actions: [
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('去登录'),
                ),
              ),
            ],
          ),
        ),
        child: const Text('弹出强制登录框'),
      ),
    );
  }
}

final List<DemoCase> kAlertDialogCases = <DemoCase>[
  DemoCase(
    id: 'alert-confirm',
    title: '确认对话框',
    description: 'showDialog + AlertDialog，await 返回值。',
    builder: (_) => const AlertDialogConfirmDemo(),
  ),
  DemoCase(
    id: 'alert-input',
    title: '带输入框的对话框',
    description: '对话框里放表单，确认时读取 controller。',
    builder: (_) => const AlertDialogInputDemo(),
  ),
  DemoCase(
    id: 'alert-simple-dialog',
    title: '列表选择对话框（SimpleDialog）',
    description: '纯"挑一个"场景，选项即按钮。',
    builder: (_) => const SimpleDialogDemo(),
  ),
  DemoCase(
    id: 'alert-unclosable',
    title: '不可取消 & 富样式',
    description: 'barrierDismissible: false + 自定义 icon/形状。',
    builder: (_) => const AlertDialogStyledDemo(),
  ),
];

// =====================================================================
// SnackBar 消息条
// =====================================================================

/// 示例: snackbar-basic —— 操作成功轻提示
class SnackBarBasicDemo extends StatelessWidget {
  const SnackBarBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('已保存到相册'), duration: Duration(seconds: 2)),
          );
        },
        child: const Text('保存图片'),
      ),
    );
  }
}

/// 示例: snackbar-undo —— 删除 + 撤销
class SnackBarUndoDemo extends StatefulWidget {
  const SnackBarUndoDemo({super.key});

  @override
  State<SnackBarUndoDemo> createState() => _SnackBarUndoDemoState();
}

class _SnackBarUndoDemoState extends State<SnackBarUndoDemo> {
  final items = ['条目 A', '条目 B', '条目 C'];

  void _remove(int index) {
    final removed = items.removeAt(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('已删除「$removed」'),
        action: SnackBarAction(
          label: '撤销',
          onPressed: () => setState(() => items.insert(index, removed)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < items.length; i++)
              ListTile(
                title: Text(items[i]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _remove(i),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 示例: snackbar-styles —— 三种外观对比
class SnackBarStylesDemo extends StatelessWidget {
  const SnackBarStylesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    void show(SnackBar bar) => ScaffoldMessenger.of(context).showSnackBar(bar);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            onPressed: () => show(const SnackBar(
              content: Text('贴底常规样式'),
              backgroundColor: Colors.teal,
            )),
            child: const Text('底部贴边'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => show(const SnackBar(
              content: Text('floating 会浮起留边'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(16),
            )),
            child: const Text('浮动样式'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => show(const SnackBar(
              content: Row(children: [Icon(Icons.error, color: Colors.white), SizedBox(width: 8), Text('操作失败')]),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
            )),
            child: const Text('错误红色'),
          ),
        ],
      ),
    );
  }
}

/// 示例: snackbar-replace —— 清掉旧消息再弹新的
class SnackBarReplaceDemo extends StatelessWidget {
  const SnackBarReplaceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () {
          final messenger = ScaffoldMessenger.of(context);
          messenger.clearSnackBars();
          messenger.showSnackBar(const SnackBar(content: Text('最新消息')));
        },
        child: const Text('清掉旧的再弹新的'),
      ),
    );
  }
}

final List<DemoCase> kSnackBarCases = <DemoCase>[
  DemoCase(
    id: 'snackbar-basic',
    title: '基本提示',
    description: 'ScaffoldMessenger.of(context).showSnackBar。',
    builder: (_) => const SnackBarBasicDemo(),
  ),
  DemoCase(
    id: 'snackbar-undo',
    title: '带撤销动作',
    description: 'SnackBarAction 提供单个撤销按钮。',
    previewHeight: 260,
    builder: (_) => const SnackBarUndoDemo(),
  ),
  DemoCase(
    id: 'snackbar-styles',
    title: '样式与位置',
    description: 'floating 浮起、backgroundColor 语义色。',
    builder: (_) => const SnackBarStylesDemo(),
  ),
  DemoCase(
    id: 'snackbar-replace',
    title: '替换当前消息',
    description: 'clearSnackBars() 先清再弹。',
    builder: (_) => const SnackBarReplaceDemo(),
  ),
];

// =====================================================================
// BottomSheet 底部弹窗
// =====================================================================

/// 示例: bottomsheet-modal —— 分享渠道列表
class BottomSheetModalDemo extends StatelessWidget {
  const BottomSheetModalDemo({super.key});

  Future<void> _showShare(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('分享到', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            for (final channel in const ['微信好友', '朋友圈', '复制链接', '更多'])
              ListTile(
                leading: const Icon(Icons.share),
                title: Text(channel),
                onTap: () => Navigator.pop(context),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton.icon(
        onPressed: () => _showShare(context),
        icon: const Icon(Icons.ios_share),
        label: const Text('弹出分享面板'),
      ),
    );
  }
}

/// 示例: bottomsheet-scrollable —— 长列表筛选面板
class BottomSheetScrollableDemo extends StatelessWidget {
  const BottomSheetScrollableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton.tonalIcon(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.6,
            maxChildSize: 0.9,
            minChildSize: 0.4,
            expand: false,
            builder: (context, scrollController) => Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('价格区间', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 30,
                    itemBuilder: (context, i) => ListTile(title: Text('筛选项 $i')),
                  ),
                ),
              ],
            ),
          ),
        ),
        icon: const Icon(Icons.filter_alt),
        label: const Text('打开筛选（可拖高）'),
      ),
    );
  }
}

/// 示例: bottomsheet-persistent —— 地图式常驻面板（简化示意）
class PersistentSheetDemo extends StatefulWidget {
  const PersistentSheetDemo({super.key});

  @override
  State<PersistentSheetDemo> createState() => _PersistentSheetDemoState();
}

class _PersistentSheetDemoState extends State<PersistentSheetDemo> {
  PersistentBottomSheetController? _controller;

  void _openPersistent(BuildContext context) {
    _controller?.close();
    _controller = showBottomSheet(
      context: context,
      builder: (context) => const Padding(
        padding: EdgeInsets.all(24),
        child: Text('非模态面板：点其他地方不会自动关，需代码 close'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilledButton(onPressed: () => _openPersistent(context), child: const Text('打开常驻面板')),
          const SizedBox(width: 12),
          OutlinedButton(onPressed: () => _controller?.close(), child: const Text('关闭')),
        ],
      ),
    );
  }
}

final List<DemoCase> kBottomSheetCases = <DemoCase>[
  DemoCase(
    id: 'bottomsheet-modal',
    title: '模态底部弹窗（最常用）',
    description: 'showModalBottomSheet + showDragHandle。',
    builder: (_) => const BottomSheetModalDemo(),
  ),
  DemoCase(
    id: 'bottomsheet-scrollable',
    title: '高内容可滚动',
    description: 'isScrollControlled + DraggableScrollableSheet。',
    builder: (_) => const BottomSheetScrollableDemo(),
  ),
  DemoCase(
    id: 'bottomsheet-persistent',
    title: '持久底部面板（非模态）',
    description: 'showBottomSheet 返回 controller 手动 close。',
    builder: (_) => const PersistentSheetDemo(),
  ),
];

// =====================================================================
// Tooltip 提示气泡
// =====================================================================

/// 示例: tooltip-basic —— 图标加说明
class TooltipBasicDemo extends StatelessWidget {
  const TooltipBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Tooltip(
        message: '这是收藏按钮',
        child: Icon(Icons.favorite, size: 32),
      ),
    );
  }
}

/// 示例: tooltip-trigger —— 点击即弹、自定义时长
class TooltipTriggerDemo extends StatelessWidget {
  const TooltipTriggerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Tooltip(
        message: '点一下就出现的提示',
        triggerMode: TooltipTriggerMode.tap,
        showDuration: Duration(seconds: 2),
        child: Icon(Icons.info_outline),
      ),
    );
  }
}

/// 示例: tooltip-style —— preferBelow + 自定义装饰
class TooltipStyleDemo extends StatelessWidget {
  const TooltipStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Tooltip(
        message: '我显示在下方、圆角深底',
        preferBelow: true,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        textStyle: TextStyle(color: Colors.white, fontSize: 12),
        child: Icon(Icons.location_on),
      ),
    );
  }
}

/// 示例: tooltip-rich —— 提示里带图标排版
class TooltipRichDemo extends StatelessWidget {
  const TooltipRichDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Tooltip(
        triggerMode: TooltipTriggerMode.tap,
        richMessage: TextSpan(
          children: [
            TextSpan(text: '支持 ', style: TextStyle(color: Colors.white)),
            TextSpan(text: 'Markdown', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
            TextSpan(text: ' 语法', style: TextStyle(color: Colors.white)),
          ],
        ),
        child: Icon(Icons.help_outline),
      ),
    );
  }
}

/// 示例: tooltip-manual —— 外部状态控制
class TooltipManualDemo extends StatefulWidget {
  const TooltipManualDemo({super.key});

  @override
  State<TooltipManualDemo> createState() => _TooltipManualDemoState();
}

class _TooltipManualDemoState extends State<TooltipManualDemo> {
  final _key = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Tooltip(
            key: _key,
            triggerMode: TooltipTriggerMode.manual,
            message: '手动模式的气泡',
            child: const Icon(Icons.touch_app),
          ),
          const SizedBox(height: 12),
          // 新版 TooltipState 提供 ensureTooltipVisible()（已移除 manualTrigger/hideTooltip）
          FilledButton.tonal(
            onPressed: () => _key.currentState?.ensureTooltipVisible(),
            child: const Text('显示'),
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kTooltipCases = <DemoCase>[
  DemoCase(
    id: 'tooltip-basic',
    title: '基础提示',
    description: '桌面悬停显示、移动长按显示。',
    builder: (_) => const TooltipBasicDemo(),
  ),
  DemoCase(
    id: 'tooltip-trigger',
    title: '触发方式与时长',
    description: 'triggerMode: tap + showDuration。',
    builder: (_) => const TooltipTriggerDemo(),
  ),
  DemoCase(
    id: 'tooltip-style',
    title: '位置与样式',
    description: 'preferBelow + decoration 自定义。',
    builder: (_) => const TooltipStyleDemo(),
  ),
  DemoCase(
    id: 'tooltip-rich',
    title: '富文本提示（RICH）',
    description: 'richMessage 用 TextSpan 排版。',
    builder: (_) => const TooltipRichDemo(),
  ),
  DemoCase(
    id: 'tooltip-manual',
    title: '手动控制显隐',
    description: 'GlobalKey<TooltipState> + manualTrigger。',
    builder: (_) => const TooltipManualDemo(),
  ),
];

// =====================================================================
// ProgressIndicator 进度指示
// =====================================================================

/// 示例: progress-indeterminate —— 圆形 + 线性转圈
class ProgressIndeterminateDemo extends StatelessWidget {
  const ProgressIndeterminateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 24),
          SizedBox(width: 200, child: LinearProgressIndicator()),
          SizedBox(height: 24),
          CircularProgressIndicator(color: Colors.green, strokeWidth: 6),
        ],
      ),
    );
  }
}

/// 示例: progress-determinate —— 下载进度 60%
class ProgressDeterminateDemo extends StatelessWidget {
  const ProgressDeterminateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const progress = 0.6;
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: progress, minHeight: 10, borderRadius: BorderRadius.all(Radius.circular(5))),
          SizedBox(height: 16),
          CircularProgressIndicator(value: progress),
          SizedBox(height: 8),
          Text('下载中 60%'),
        ],
      ),
    );
  }
}

/// 示例: progress-conditional —— 模拟加载后显示内容
class ProgressConditionalDemo extends StatefulWidget {
  const ProgressConditionalDemo({super.key});

  @override
  State<ProgressConditionalDemo> createState() => _ProgressConditionalDemoState();
}

class _ProgressConditionalDemoState extends State<ProgressConditionalDemo> {
  bool _loading = true;

  void _reload() {
    setState(() => _loading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _loading = false);
    });
  }

  @override
  void initState() {
    super.initState();
    _reload();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _loading
          ? const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 12),
                Text('加载中…'),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('内容已就绪'),
                const SizedBox(height: 12),
                OutlinedButton(onPressed: _reload, child: const Text('重新加载')),
              ],
            ),
    );
  }
}

/// 示例: progress-steps —— 分段步骤进度
class ProgressStepsDemo extends StatelessWidget {
  const ProgressStepsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 240,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(value: 2 / 5, color: Colors.indigo),
            SizedBox(height: 8),
            Text('第 2 步 / 共 5 步'),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kProgressCases = <DemoCase>[
  DemoCase(
    id: 'progress-indeterminate',
    title: '不确定进度（加载中）',
    description: '不传 value 即转圈。',
    builder: (_) => const ProgressIndeterminateDemo(),
  ),
  DemoCase(
    id: 'progress-determinate',
    title: '确定进度（有 value）',
    description: 'value 0.0~1.0 按比例填充。',
    builder: (_) => const ProgressDeterminateDemo(),
  ),
  DemoCase(
    id: 'progress-conditional',
    title: '加载/内容条件切换',
    description: 'loading 态与内容态二选一。',
    previewHeight: 220,
    builder: (_) => const ProgressConditionalDemo(),
  ),
  DemoCase(
    id: 'progress-steps',
    title: '分段步骤进度',
    description: 'value 表达“完成 x/total”。',
    builder: (_) => const ProgressStepsDemo(),
  ),
];

// =====================================================================
// Badge 徽标
// =====================================================================

/// 示例: badge-count —— 通知图标带数字
class BadgeCountDemo extends StatelessWidget {
  const BadgeCountDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Badge.count(count: 5, child: const Icon(Icons.notifications, size: 32)),
    );
  }
}

/// 示例: badge-dot —— 仅未读点
class BadgeDotDemo extends StatelessWidget {
  const BadgeDotDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Badge(isLabelVisible: false, child: Icon(Icons.mail, size: 32)),
    );
  }
}

/// 示例: badge-styled —— 颜色/位置/99+ 截断
class BadgeStyledDemo extends StatelessWidget {
  const BadgeStyledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Badge.count(
            count: 99,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            largeSize: 16,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            offset: const Offset(8, -8),
            child: const Icon(Icons.shopping_cart, size: 32),
          ),
          const SizedBox(width: 40),
          Badge.count(
            count: 99,
            alignment: Alignment.topLeft,
            child: const Icon(Icons.chat_bubble, size: 32),
          ),
        ],
      ),
    );
  }
}

/// 示例: badge-on-appbar-action —— 顶栏消息入口
class BadgeActionDemo extends StatelessWidget {
  const BadgeActionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        actions: [
          IconButton(
            icon: Badge.count(count: 3, child: const Icon(Icons.notifications)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Badge.count(count: 12, child: const Icon(Icons.email)),
            title: const Text('未读邮件'),
            subtitle: const Text('12 封新消息'),
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kBadgeCases = <DemoCase>[
  DemoCase(
    id: 'badge-count',
    title: '数字徽标',
    description: 'Badge.count 自动把数字排到右上角。',
    builder: (_) => const BadgeCountDemo(),
  ),
  DemoCase(
    id: 'badge-dot',
    title: '小红点（不显示数字）',
    description: 'isLabelVisible: false 只显点。',
    builder: (_) => const BadgeDotDemo(),
  ),
  DemoCase(
    id: 'badge-styled',
    title: '自定义外观 + 大数截断',
    description: '颜色/偏移/挂载角都可调。',
    previewHeight: 200,
    builder: (_) => const BadgeStyledDemo(),
  ),
  DemoCase(
    id: 'badge-on-appbar-action',
    title: '配合 IconButton / ListTile',
    description: '惯例是 Badge 包 icon。',
    previewHeight: 320,
    previewFill: true,
    builder: (_) => const BadgeActionDemo(),
  ),
];

// =====================================================================
// 分组装配
// =====================================================================

final ComponentGroup kFeedbackGroup = ComponentGroup(
  title: '反馈与浮层',
  icon: Icons.notifications_outlined,
  items: <ComponentInfo>[
    ComponentInfo(
      name: 'AlertDialog 对话框',
      route: '/components/alertdialog',
      kind: 'StatelessWidget',
      intro: '对话框用于打断用户、请求确认或展示关键信息，通过 showDialog 弹出。',
      cases: kAlertDialogCases,
    ),
    ComponentInfo(
      name: 'SnackBar 消息条',
      route: '/components/snackbar',
      kind: 'StatelessWidget',
      intro: 'SnackBar 是从屏幕底部短暂弹出的轻提示，不打断操作，几秒后自动消失。',
      cases: kSnackBarCases,
    ),
    ComponentInfo(
      name: 'BottomSheet 底部弹窗',
      route: '/components/bottomsheet',
      kind: 'StatelessWidget',
      intro: '底部弹窗从屏幕底部升起，适合分享渠道/筛选条件等中等复杂度内容。',
      cases: kBottomSheetCases,
    ),
    ComponentInfo(
      name: 'Tooltip 提示气泡',
      route: '/components/tooltip',
      kind: 'StatefulWidget',
      intro: 'Tooltip 给某个 widget 加一段悬浮/长按提示文字。',
      cases: kTooltipCases,
    ),
    ComponentInfo(
      name: 'ProgressIndicator 进度指示',
      route: '/components/progressindicator',
      kind: 'StatelessWidget',
      intro: '进度指示分为不确定（转圈）与确定（百分比）两类。',
      cases: kProgressCases,
    ),
    ComponentInfo(
      name: 'Badge 徽标',
      route: '/components/badge',
      kind: 'StatelessWidget',
      intro: 'Badge 是叠在图标右上角的小红点或数字，Material 3 提供。',
      cases: kBadgeCases,
    ),
  ],
);
