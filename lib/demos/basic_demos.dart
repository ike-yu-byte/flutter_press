import 'package:flutter/material.dart';

import '../models/demo_models.dart';

// =====================================================================
// Text 文本
// =====================================================================

/// 示例: text-style —— 标题文本样式
class TextStyleDemo extends StatelessWidget {
  const TextStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '你好，Flutter',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

/// 示例: text-overflow —— 两行截断
class TextOverflowDemo extends StatelessWidget {
  const TextOverflowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 220,
        child: const Text(
          '这是一段很长很长的文字，超出设定行数后会用省略号截断尾部，避免把布局撑爆。',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

/// 示例: text-rich —— 局部变色加粗
class TextRichDemo extends StatelessWidget {
  const TextRichDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '共 ', style: TextStyle(color: Colors.grey)),
            TextSpan(
              text: '12',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            TextSpan(text: ' 件', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

/// 示例: text-default-style —— 统一子树文字样式
class TextDefaultStyleDemo extends StatelessWidget {
  const TextDefaultStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 18, color: Colors.blue),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [Text('自动继承蓝色'), Text('无需逐个设 style')],
        ),
      ),
    );
  }
}

final List<DemoCase> kTextCases = <DemoCase>[
  DemoCase(
    id: 'text-style',
    title: '基本样式',
    description: '字号、字重、颜色、字间距。',
    builder: (_) => const TextStyleDemo(),
  ),
  DemoCase(
    id: 'text-overflow',
    title: '溢出省略',
    description: '超长文本按 maxLines 截断并显示省略号。',
    builder: (_) => const TextOverflowDemo(),
  ),
  DemoCase(
    id: 'text-rich',
    title: '富文本',
    description: '一段文字里混排多种样式，用 Text.rich + TextSpan。',
    builder: (_) => const TextRichDemo(),
  ),
  DemoCase(
    id: 'text-default-style',
    title: '主题继承',
    description: 'DefaultTextStyle 给整棵子树设默认文字样式。',
    builder: (_) => const TextDefaultStyleDemo(),
  ),
];

// =====================================================================
// Button 按钮
// =====================================================================

/// 示例: button-family —— 按钮家族一览
class ButtonFamilyDemo extends StatelessWidget {
  const ButtonFamilyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: [
          FilledButton(onPressed: () {}, child: const Text('Filled')),
          ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
          TextButton(onPressed: () {}, child: const Text('Text')),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
            tooltip: '收藏',
          ),
        ],
      ),
    );
  }
}

/// 示例: button-disabled —— onPressed 为 null 即禁用
class ButtonDisabledDemo extends StatelessWidget {
  const ButtonDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final bool canSubmit = ''.isNotEmpty; // 表单为空 → 不可提交
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: canSubmit ? () {} : null,
            child: const Text('提交（禁用）'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () {}, child: const Text('可用')),
        ],
      ),
    );
  }
}

/// 示例: button-icon —— 纯图标按钮与图标文字按钮
class ButtonIconDemo extends StatelessWidget {
  const ButtonIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('下载'),
          ),
        ],
      ),
    );
  }
}

/// 示例: button-fab —— 普通 FAB 与扩展 FAB
class ButtonFabDemo extends StatelessWidget {
  const ButtonFabDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
          const SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            label: const Text('写文章'),
          ),
        ],
      ),
    );
  }
}

/// 示例: button-loading —— 提交时切换为进度圈并禁用
class ButtonLoadingDemo extends StatefulWidget {
  const ButtonLoadingDemo({super.key});

  @override
  State<ButtonLoadingDemo> createState() => _ButtonLoadingDemoState();
}

class _ButtonLoadingDemoState extends State<ButtonLoadingDemo> {
  bool _isLoading = false;

  Future<void> _submit() async {
    setState(() => _isLoading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _isLoading ? null : _submit,
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Text('提交'),
      ),
    );
  }
}

/// 示例: button-style —— styleFrom 改颜色/尺寸/圆角
class ButtonStyleFromDemo extends StatelessWidget {
  const ButtonStyleFromDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          minimumSize: const Size(160, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: const Text('胶囊大按钮'),
      ),
    );
  }
}

/// 示例: button-state-style —— WidgetStateProperty 分状态配色
class ButtonStateStyleDemo extends StatelessWidget {
  const ButtonStateStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) return Colors.grey;
            if (states.contains(WidgetState.pressed)) return Colors.red.shade700;
            if (states.contains(WidgetState.hovered)) return Colors.red.shade300;
            return Colors.red;
          }),
        ),
        child: const Text('悬停/按下变色'),
      ),
    );
  }
}

final List<DemoCase> kButtonCases = <DemoCase>[
  DemoCase(
    id: 'button-family',
    title: '按钮家族',
    description: '四种文本按钮 + 图标按钮的横向对比。',
    builder: (_) => const ButtonFamilyDemo(),
  ),
  DemoCase(
    id: 'button-disabled',
    title: '禁用状态',
    description: 'onPressed 传 null 即禁用，无需额外 disabled 参数。',
    builder: (_) => const ButtonDisabledDemo(),
  ),
  DemoCase(
    id: 'button-icon',
    title: '图标按钮',
    description: 'IconButton 纯图标；.icon 提供图标 + 文字组合。',
    builder: (_) => const ButtonIconDemo(),
  ),
  DemoCase(
    id: 'button-fab',
    title: '浮动按钮 FAB',
    description: '普通 FAB 与 FloatingActionButton.extended。',
    builder: (_) => const ButtonFabDemo(),
  ),
  DemoCase(
    id: 'button-loading',
    title: '加载状态',
    description: '点击提交切换进度圈并禁用点击。',
    builder: (_) => const ButtonLoadingDemo(),
  ),
  DemoCase(
    id: 'button-style',
    title: '自定义样式',
    description: 'styleFrom() 改颜色 / 尺寸 / 圆角。',
    builder: (_) => const ButtonStyleFromDemo(),
  ),
  DemoCase(
    id: 'button-state-style',
    title: '状态样式',
    description: 'WidgetStateProperty 按悬停 / 按下 / 禁用给不同值。',
    builder: (_) => const ButtonStateStyleDemo(),
  ),
];

// =====================================================================
// Image 图片
// =====================================================================

/// 示例: image-network —— 网络图 cover 填充
class ImageNetworkDemo extends StatelessWidget {
  const ImageNetworkDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://picsum.photos/400/300',
        width: 240,
        height: 160,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stack) =>
            const Icon(Icons.broken_image, size: 48),
      ),
    );
  }
}

/// 示例: image-placeholder —— 加载中/失败占位
class ImagePlaceholderDemo extends StatelessWidget {
  const ImagePlaceholderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://picsum.photos/400/300',
        width: 240,
        height: 160,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stack) =>
            const Icon(Icons.broken_image, size: 48),
      ),
    );
  }
}

/// 示例: image-rounded —— ClipRRect 裁圆角
class ImageRoundedDemo extends StatelessWidget {
  const ImageRoundedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          'https://picsum.photos/300/300',
          width: 160,
          height: 160,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) =>
              const Icon(Icons.broken_image, size: 48),
        ),
      ),
    );
  }
}

/// 示例: image-asset —— 读取打包资源
class ImageAssetDemo extends StatelessWidget {
  const ImageAssetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: 120,
        errorBuilder: (context, error, stack) =>
            const Icon(Icons.image_not_supported_outlined, size: 48),
      ),
    );
  }
}

final List<DemoCase> kImageCases = <DemoCase>[
  DemoCase(
    id: 'image-network',
    title: '网络图片 + 填充',
    description: 'fit: BoxFit.cover 等比裁剪填满。',
    builder: (_) => const ImageNetworkDemo(),
  ),
  DemoCase(
    id: 'image-placeholder',
    title: '加载与错误占位',
    description: 'loadingBuilder 显示进度、errorBuilder 兜底失败。',
    builder: (_) => const ImagePlaceholderDemo(),
  ),
  DemoCase(
    id: 'image-rounded',
    title: '圆角图片',
    description: 'Image 自身无圆角，靠外层 ClipRRect 裁剪。',
    builder: (_) => const ImageRoundedDemo(),
  ),
  DemoCase(
    id: 'image-asset',
    title: '资源图片',
    description: 'Image.asset 读取 pubspec.yaml 声明的 assets。',
    builder: (_) => const ImageAssetDemo(),
  ),
];

// =====================================================================
// Icon 图标
// =====================================================================

/// 示例: icon-basic —— 不同尺寸颜色
class IconBasicDemo extends StatelessWidget {
  const IconBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, size: 24),
          SizedBox(width: 16),
          Icon(Icons.favorite, size: 36, color: Colors.red),
          SizedBox(width: 16),
          Icon(Icons.favorite_border, size: 36, color: Colors.pink),
        ],
      ),
    );
  }
}

/// 示例: icon-variants —— 实心/描边/圆角
class IconVariantsDemo extends StatelessWidget {
  const IconVariantsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.home, size: 32),
          SizedBox(width: 20),
          Icon(Icons.home_outlined, size: 32),
          SizedBox(width: 20),
          Icon(Icons.home_rounded, size: 32),
        ],
      ),
    );
  }
}

/// 示例: icon-button —— IconButton
class IconIconButtonDemo extends StatelessWidget {
  const IconIconButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            tooltip: '通知',
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kIconCases = <DemoCase>[
  DemoCase(
    id: 'icon-basic',
    title: '基础图标',
    description: '尺寸与颜色。',
    builder: (_) => const IconBasicDemo(),
  ),
  DemoCase(
    id: 'icon-variants',
    title: '图标变体',
    description: '同一图标有 _outlined / _rounded 等变体。',
    builder: (_) => const IconVariantsDemo(),
  ),
  DemoCase(
    id: 'icon-button',
    title: '图标按钮',
    description: 'IconButton 给图标加点击与水波纹。',
    builder: (_) => const IconIconButtonDemo(),
  ),
];

// =====================================================================
// Container 容器
// =====================================================================

/// 示例: container-basic —— 圆角背景盒子
class ContainerBasicDemo extends StatelessWidget {
  const ContainerBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text('内容', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

/// 示例: container-decorated —— 渐变阴影卡片
class ContainerDecoratedDemo extends StatelessWidget {
  const ContainerDecoratedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.blue, Colors.purple]),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: const Text('渐变阴影', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

/// 示例: container-border —— 带描边
class ContainerBorderDemo extends StatelessWidget {
  const ContainerBorderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('描边盒子'),
      ),
    );
  }
}

final List<DemoCase> kContainerCases = <DemoCase>[
  DemoCase(
    id: 'container-basic',
    title: '彩色圆角块',
    description: '背景色 + 圆角 + 内边距。',
    builder: (_) => const ContainerBasicDemo(),
  ),
  DemoCase(
    id: 'container-decorated',
    title: '渐变 + 阴影',
    description: 'BoxDecoration 支持渐变与投影。',
    builder: (_) => const ContainerDecoratedDemo(),
  ),
  DemoCase(
    id: 'container-border',
    title: '描边盒子',
    description: 'Border.all 加边框。',
    builder: (_) => const ContainerBorderDemo(),
  ),
];

// =====================================================================
// Padding 内边距
// =====================================================================

/// 示例: padding-all —— 四周留白
class PaddingAllDemo extends StatelessWidget {
  const PaddingAllDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue.shade100,
        child: const Padding(
          padding: EdgeInsets.all(32),
          child: ColoredBox(color: Colors.blue, child: Text('内容')),
        ),
      ),
    );
  }
}

/// 示例: padding-symmetric —— 水平/垂直分别设
class PaddingSymmetricDemo extends StatelessWidget {
  const PaddingSymmetricDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.amber.shade100,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          child: Text('水平 40，垂直 16'),
        ),
      ),
    );
  }
}

final List<DemoCase> kPaddingCases = <DemoCase>[
  DemoCase(
    id: 'padding-all',
    title: '四周内边距',
    description: 'EdgeInsets.all 在 child 四周插入空白。',
    builder: (_) => const PaddingAllDemo(),
  ),
  DemoCase(
    id: 'padding-symmetric',
    title: '不对称内边距',
    description: 'EdgeInsets.only / symmetric 指定不同边。',
    builder: (_) => const PaddingSymmetricDemo(),
  ),
];

// =====================================================================
// SizedBox 尺寸占位
// =====================================================================

/// 示例: sizedbox-gap —— 垂直撑间距
class SizedBoxGapDemo extends StatelessWidget {
  const SizedBoxGapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('标题', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          Text('内容'),
        ],
      ),
    );
  }
}

/// 示例: sizedbox-fixed —— 固定宽高
class SizedBoxFixedDemo extends StatelessWidget {
  const SizedBoxFixedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 160,
        height: 80,
        child: ColoredBox(color: Colors.teal),
      ),
    );
  }
}

/// 示例: sizedbox-infinite —— 全宽按钮
class SizedBoxInfiniteDemo extends StatelessWidget {
  const SizedBoxInfiniteDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('全宽按钮'),
        ),
      ),
    );
  }
}

final List<DemoCase> kSizedBoxCases = <DemoCase>[
  DemoCase(
    id: 'sizedbox-gap',
    title: '撑出间距',
    description: 'Column / Row 里最常用的间隔方式。',
    builder: (_) => const SizedBoxGapDemo(),
  ),
  DemoCase(
    id: 'sizedbox-fixed',
    title: '固定尺寸盒子',
    description: '强制 child 采用固定宽高。',
    builder: (_) => const SizedBoxFixedDemo(),
  ),
  DemoCase(
    id: 'sizedbox-infinite',
    title: '全宽',
    description: 'width: double.infinity 让子撑满父级宽度。',
    builder: (_) => const SizedBoxInfiniteDemo(),
  ),
];

// =====================================================================
// Divider 分割线
// =====================================================================

/// 示例: divider-basic —— 列表项之间
class DividerBasicDemo extends StatelessWidget {
  const DividerBasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(title: Text('选项一')),
            const Divider(),
            const ListTile(title: Text('选项二')),
          ],
        ),
      ),
    );
  }
}

/// 示例: divider-styled —— 缩进加粗变色
class DividerStyledDemo extends StatelessWidget {
  const DividerStyledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 280,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              thickness: 3,
              color: Colors.orange,
              indent: 40,
              endIndent: 40,
            ),
            SizedBox(height: 16),
            Divider(thickness: 1, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

/// 示例: divider-with-text —— 中间放文字
class DividerTextDemo extends StatelessWidget {
  const DividerTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 280,
        child: Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('或', style: TextStyle(color: Colors.grey)),
            ),
            Expanded(child: Divider()),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kDividerCases = <DemoCase>[
  DemoCase(
    id: 'divider-basic',
    title: '基本分割线',
    description: '在列表项之间画一条水平分隔线。',
    builder: (_) => const DividerBasicDemo(),
  ),
  DemoCase(
    id: 'divider-styled',
    title: '缩进与粗细',
    description: 'indent / thickness / color 定制。',
    builder: (_) => const DividerStyledDemo(),
  ),
  DemoCase(
    id: 'divider-with-text',
    title: '带文字分割线',
    description: 'Flutter 无内置打断式分割线，用 Row 拼。',
    builder: (_) => const DividerTextDemo(),
  ),
];

// =====================================================================
// CircleAvatar 头像
// =====================================================================

/// 示例: circleavatar-image —— 网络头像
class CircleAvatarImageDemo extends StatelessWidget {
  const CircleAvatarImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        radius: 36,
        backgroundImage: NetworkImage('https://picsum.photos/200/200'),
      ),
    );
  }
}

/// 示例: circleavatar-icon —— 图标头像
class CircleAvatarIconDemo extends StatelessWidget {
  const CircleAvatarIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 36,
        backgroundColor: Colors.blue.shade100,
        child: const Icon(Icons.person, color: Colors.blue, size: 40),
      ),
    );
  }
}

/// 示例: circleavatar-letter —— 首字母头像
class CircleAvatarLetterDemo extends StatelessWidget {
  const CircleAvatarLetterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        radius: 36,
        backgroundColor: Colors.orange,
        child: Text('Z', style: TextStyle(color: Colors.white, fontSize: 32)),
      ),
    );
  }
}

/// 示例: circleavatar-listtile —— 用户列表项
class CircleAvatarListTileDemo extends StatelessWidget {
  const CircleAvatarListTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200/200'),
          ),
          title: const Text('张三'),
          subtitle: const Text('在线'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }
}

final List<DemoCase> kCircleAvatarCases = <DemoCase>[
  DemoCase(
    id: 'circleavatar-image',
    title: '图片头像',
    description: 'backgroundImage 加载网络头像。',
    builder: (_) => const CircleAvatarImageDemo(),
  ),
  DemoCase(
    id: 'circleavatar-icon',
    title: '图标兜底',
    description: '无图时用图标占位。',
    builder: (_) => const CircleAvatarIconDemo(),
  ),
  DemoCase(
    id: 'circleavatar-letter',
    title: '文字首字母',
    description: 'child 放 Text 显示首字母。',
    builder: (_) => const CircleAvatarLetterDemo(),
  ),
  DemoCase(
    id: 'circleavatar-listtile',
    title: '列表项中',
    description: '配合 ListTile.leading 做用户列表。',
    builder: (_) => const CircleAvatarListTileDemo(),
  ),
];

// =====================================================================
// 分组装配
// =====================================================================

final ComponentGroup kBasicGroup = ComponentGroup(
  title: '基础组件',
  icon: Icons.smartphone_outlined,
  items: <ComponentInfo>[
    ComponentInfo(
      name: 'Text 文本',
      route: '/components/text',
      kind: 'StatelessWidget',
      intro: 'Text 渲染一段具有相同样式的文本，样式细节由 TextStyle 承载。',
      cases: kTextCases,
    ),
    ComponentInfo(
      name: 'Button 按钮',
      route: '/components/button',
      kind: 'StatefulWidget',
      intro: 'Flutter 内置一族 Material 按钮组件，参数几乎一致，区别只在默认样式。',
      cases: kButtonCases,
    ),
    ComponentInfo(
      name: 'Image 图片',
      route: '/components/image',
      kind: 'StatefulWidget',
      intro: 'Image 支持从资源、网络、文件、内存加载，用不同构造函数区分来源。',
      cases: kImageCases,
    ),
    ComponentInfo(
      name: 'Icon 图标',
      route: '/components/icon',
      kind: 'StatelessWidget',
      intro: 'Icon 渲染单色矢量图标，内置 Material Icons 字库，通过 Icons 静态常量引用。',
      cases: kIconCases,
    ),
    ComponentInfo(
      name: 'Container 容器',
      route: '/components/container',
      kind: 'StatelessWidget',
      intro: 'Container 是最"万能"的布局盒子，同时负责尺寸、padding、margin、装饰、对齐。',
      cases: kContainerCases,
    ),
    ComponentInfo(
      name: 'Padding 内边距',
      route: '/components/padding',
      kind: 'StatelessWidget',
      intro: 'Padding 在 child 周围插入空白，只管留白，比 Container 更轻。',
      cases: kPaddingCases,
    ),
    ComponentInfo(
      name: 'SizedBox 尺寸占位',
      route: '/components/sizedbox',
      kind: 'StatelessWidget',
      intro: 'SizedBox 强制 child 采用固定尺寸；无 child 时就是撑间距的占位块。',
      cases: kSizedBoxCases,
    ),
    ComponentInfo(
      name: 'Divider 分割线',
      route: '/components/divider',
      kind: 'StatelessWidget',
      intro: 'Divider 画一条水平分隔线，区隔内容。',
      cases: kDividerCases,
    ),
    ComponentInfo(
      name: 'CircleAvatar 头像',
      route: '/components/circleavatar',
      kind: 'StatelessWidget',
      intro: 'CircleAvatar 画一个圆形占位，常显示用户头像：图片、图标或文字首字母。',
      cases: kCircleAvatarCases,
    ),
  ],
);
