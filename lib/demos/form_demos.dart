import 'package:flutter/material.dart';

import '../models/demo_models.dart';

// =====================================================================
// TextField 输入框
// =====================================================================

/// 示例: textfield-basic —— 带标签的输入框并实时显示内容
class TextFieldBasicDemo extends StatefulWidget {
  const TextFieldBasicDemo({super.key});

  @override
  State<TextFieldBasicDemo> createState() => _TextFieldBasicDemoState();
}

class _TextFieldBasicDemoState extends State<TextFieldBasicDemo> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: '用户名',
                hintText: '请输入',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            Text('当前输入：${_controller.text}'),
          ],
        ),
      ),
    );
  }
}

/// 示例: textfield-password —— 显隐切换密码框
class TextFieldPasswordDemo extends StatefulWidget {
  const TextFieldPasswordDemo({super.key});

  @override
  State<TextFieldPasswordDemo> createState() => _TextFieldPasswordDemoState();
}

class _TextFieldPasswordDemoState extends State<TextFieldPasswordDemo> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: TextField(
          obscureText: _obscure,
          decoration: InputDecoration(
            labelText: '密码',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => _obscure = !_obscure),
            ),
          ),
        ),
      ),
    );
  }
}

/// 示例: textfield-keyboard —— 手机号键盘 + 限 11 位
class TextFieldKeyboardDemo extends StatelessWidget {
  const TextFieldKeyboardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: TextField(
          keyboardType: TextInputType.phone,
          maxLength: 11,
          decoration: const InputDecoration(
            labelText: '手机号',
            prefixText: '+86 ',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

/// 示例: textfield-multiline —— 自适应高度的多行文本
class TextFieldMultilineDemo extends StatelessWidget {
  const TextFieldMultilineDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: TextField(
          maxLines: null,
          decoration: const InputDecoration(
            labelText: '备注',
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

/// 示例: textfield-decoration —— 三种装饰风格
class TextFieldDecorationDemo extends StatelessWidget {
  const TextFieldDecorationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: '默认下划线'),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: '描边',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: '填充',
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kTextFieldCases = <DemoCase>[
  DemoCase(
    id: 'textfield-basic',
    title: '基础输入 + 读取值',
    description: '用 TextEditingController 读写文本。',
    builder: (_) => const TextFieldBasicDemo(),
  ),
  DemoCase(
    id: 'textfield-password',
    title: '密码框',
    description: 'obscureText 遮蔽输入，右侧眼睛按钮切换明文。',
    builder: (_) => const TextFieldPasswordDemo(),
  ),
  DemoCase(
    id: 'textfield-keyboard',
    title: '键盘类型与长度限制',
    description: 'keyboardType 弹对应键盘，maxLength 限字数。',
    builder: (_) => const TextFieldKeyboardDemo(),
  ),
  DemoCase(
    id: 'textfield-multiline',
    title: '多行输入',
    description: 'maxLines: null 自动增高，做备注/留言框。',
    builder: (_) => const TextFieldMultilineDemo(),
  ),
  DemoCase(
    id: 'textfield-decoration',
    title: '边框风格对比',
    description: '下划线、描边、填充三种主流装饰风格。',
    builder: (_) => const TextFieldDecorationDemo(),
  ),
];

// =====================================================================
// Form 表单校验
// =====================================================================

/// 示例: form-login —— 邮箱 + 密码双字段校验
class FormLoginDemo extends StatefulWidget {
  const FormLoginDemo({super.key});

  @override
  State<FormLoginDemo> createState() => _FormLoginDemoState();
}

class _FormLoginDemoState extends State<FormLoginDemo> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('提交成功')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: '邮箱',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return '请输入邮箱';
                  if (!value.contains('@')) return '邮箱格式不正确';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _pwdController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '密码',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.length < 6) ? '密码至少 6 位' : null,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _submit,
                  child: const Text('登录'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 示例: form-autovalidate —— 输入过程实时报错
class FormAutoValidateDemo extends StatefulWidget {
  const FormAutoValidateDemo({super.key});

  @override
  State<FormAutoValidateDemo> createState() => _FormAutoValidateDemoState();
}

class _FormAutoValidateDemoState extends State<FormAutoValidateDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: '昵称（2-10 个字）',
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              if (v == null || v.trim().length < 2 || v.trim().length > 10) {
                return '长度需 2-10 个字';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

/// 示例: form-reset —— 填写后一键重置
class FormResetDemo extends StatefulWidget {
  const FormResetDemo({super.key});

  @override
  State<FormResetDemo> createState() => _FormResetDemoState();
}

class _FormResetDemoState extends State<FormResetDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: '默认值',
                decoration: const InputDecoration(
                  labelText: '内容',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _formKey.currentState!.reset(),
                      child: const Text('重置'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<DemoCase> kFormCases = <DemoCase>[
  DemoCase(
    id: 'form-login',
    title: '登录表单（完整校验流程）',
    description: 'GlobalKey<FormState> → validate() → 提交。',
    builder: (_) => const FormLoginDemo(),
  ),
  DemoCase(
    id: 'form-autovalidate',
    title: 'autovalidateMode 即时校验',
    description: '设 autovalidateMode 边输边验。',
    builder: (_) => const FormAutoValidateDemo(),
  ),
  DemoCase(
    id: 'form-reset',
    title: '统一重置与局部保存',
    description: 'reset() 一键清空全表。',
    builder: (_) => const FormResetDemo(),
  ),
];

// =====================================================================
// Checkbox 复选框
// =====================================================================

/// 示例: checkbox-basic —— 单个开关勾选
class CheckboxBasicDemo extends StatefulWidget {
  const CheckboxBasicDemo({super.key});

  @override
  State<CheckboxBasicDemo> createState() => _CheckboxBasicDemoState();
}

class _CheckboxBasicDemoState extends State<CheckboxBasicDemo> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: _checked,
            onChanged: (bool? v) => setState(() => _checked = v ?? false),
          ),
          const Text('同意用户协议'),
        ],
      ),
    );
  }
}

/// 示例: checkbox-group —— 兴趣爱好多选
class CheckboxGroupDemo extends StatefulWidget {
  const CheckboxGroupDemo({super.key});

  @override
  State<CheckboxGroupDemo> createState() => _CheckboxGroupDemoState();
}

class _CheckboxGroupDemoState extends State<CheckboxGroupDemo> {
  final _options = ['编程', '读书', '运动', '音乐'];
  final _selected = <String>{'编程'};

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final opt in _options)
            CheckboxListTile(
              title: Text(opt),
              value: _selected.contains(opt),
              onChanged: (v) => setState(() {
                v == true ? _selected.add(opt) : _selected.remove(opt);
              }),
            ),
          const SizedBox(height: 8),
          Text('已选：${_selected.join('、')}'),
        ],
      ),
    );
  }
}

/// 示例: checkbox-tristate —— 全选框三态联动子项
class CheckboxTristateDemo extends StatefulWidget {
  const CheckboxTristateDemo({super.key});

  @override
  State<CheckboxTristateDemo> createState() => _CheckboxTristateDemoState();
}

class _CheckboxTristateDemoState extends State<CheckboxTristateDemo> {
  final _children = [false, false, false];

  bool? get _parent => _children.every((c) => c)
      ? true
      : _children.every((c) => !c)
          ? false
          : null;

  void _toggleAll(bool? all) {
    setState(() {
      for (var i = 0; i < _children.length; i++) {
        _children[i] = all ?? false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            title: const Text('全选'),
            value: _parent,
            tristate: true,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: _toggleAll,
          ),
          for (var i = 0; i < _children.length; i++)
            CheckboxListTile(
              title: Text('子项 $i'),
              value: _children[i],
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (v) => setState(() => _children[i] = v ?? false),
            ),
        ],
      ),
    );
  }
}

/// 示例: checkbox-disabled —— onChanged 传 null 即禁用
class CheckboxDisabledDemo extends StatelessWidget {
  const CheckboxDisabledDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(value: true, onChanged: null),
          Text('不可修改'),
        ],
      ),
    );
  }
}

final List<DemoCase> kCheckboxCases = <DemoCase>[
  DemoCase(
    id: 'checkbox-basic',
    title: '基础勾选',
    description: '单个开关勾选，受控于 value + onChanged。',
    builder: (_) => const CheckboxBasicDemo(),
  ),
  DemoCase(
    id: 'checkbox-group',
    title: '多选组',
    description: '一组独立选项，value 存进 Set 管理。',
    builder: (_) => const CheckboxGroupDemo(),
  ),
  DemoCase(
    id: 'checkbox-tristate',
    title: '三态与全选联动',
    description: 'tristate: true 允许 null（部分选中）。',
    builder: (_) => const CheckboxTristateDemo(),
  ),
  DemoCase(
    id: 'checkbox-disabled',
    title: '禁用态',
    description: 'onChanged 传 null 即禁用。',
    builder: (_) => const CheckboxDisabledDemo(),
  ),
];

// =====================================================================
// Radio 单选框
// =====================================================================

/// 示例: radio-basic —— 性别二选一
class RadioBasicDemo extends StatefulWidget {
  const RadioBasicDemo({super.key});

  @override
  State<RadioBasicDemo> createState() => _RadioBasicDemoState();
}

class _RadioBasicDemoState extends State<RadioBasicDemo> {
  String? _gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RadioGroup<String>(
        groupValue: _gender,
        onChanged: (v) => setState(() => _gender = v),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Radio<String>(value: 'male'),
            Text('男'),
            Radio<String>(value: 'female'),
            Text('女'),
          ],
        ),
      ),
    );
  }
}

/// 示例: radio-listtile —— 支付方式单选
class RadioListTileDemo extends StatefulWidget {
  const RadioListTileDemo({super.key});

  @override
  State<RadioListTileDemo> createState() => _RadioListTileDemoState();
}

class _RadioListTileDemoState extends State<RadioListTileDemo> {
  String _pay = 'wechat';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: RadioGroup<String>(
          groupValue: _pay,
          onChanged: (v) => setState(() => _pay = v!),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              RadioListTile<String>(
                title: Text('微信支付'),
                secondary: Icon(Icons.chat),
                value: 'wechat',
              ),
              RadioListTile<String>(
                title: Text('支付宝'),
                secondary: Icon(Icons.account_balance),
                value: 'alipay',
              ),
              RadioListTile<String>(
                title: Text('银行卡'),
                secondary: Icon(Icons.credit_card),
                value: 'bank',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DeliverySpeed { standard, express, sameDay }

/// 示例: radio-enum —— 用 enum 做类型安全的单选
class RadioEnumDemo extends StatefulWidget {
  const RadioEnumDemo({super.key});

  @override
  State<RadioEnumDemo> createState() => _RadioEnumDemoState();
}

class _RadioEnumDemoState extends State<RadioEnumDemo> {
  DeliverySpeed _speed = DeliverySpeed.standard;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioGroup<DeliverySpeed>(
            groupValue: _speed,
            onChanged: (v) => setState(() => _speed = v!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final (i, label) in const ['标准配送', '加急配送', '当日达'].indexed)
                  RadioListTile<DeliverySpeed>(
                    title: Text(label),
                    value: DeliverySpeed.values[i],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text('当前：${_speed.name}'),
        ],
      ),
    );
  }
}

/// 示例: radio-disabled —— enabled: false 该项不可选
class RadioDisabledDemo extends StatefulWidget {
  const RadioDisabledDemo({super.key});

  @override
  State<RadioDisabledDemo> createState() => _RadioDisabledDemoState();
}

class _RadioDisabledDemoState extends State<RadioDisabledDemo> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RadioGroup<int>(
        groupValue: _selected,
        onChanged: (v) => setState(() => _selected = v!),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            RadioListTile<int>(title: Text('可选项'), value: 0),
            RadioListTile<int>(title: Text('售罄，不可选'), value: 1, enabled: false),
          ],
        ),
      ),
    );
  }
}

/// 示例: radio-group-new-api —— RadioGroup 管理单选组
class RadioGroupNewDemo extends StatefulWidget {
  const RadioGroupNewDemo({super.key});

  @override
  State<RadioGroupNewDemo> createState() => _RadioGroupNewDemoState();
}

class _RadioGroupNewDemoState extends State<RadioGroupNewDemo> {
  String _pay = 'wechat';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: RadioGroup<String>(
          groupValue: _pay,
          onChanged: (v) => setState(() => _pay = v!),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              RadioListTile<String>(title: Text('微信支付'), value: 'wechat'),
              RadioListTile<String>(title: Text('支付宝'), value: 'alipay'),
              RadioListTile<String>(title: Text('银行卡'), value: 'bank'),
            ],
          ),
        ),
      ),
    );
  }
}

final List<DemoCase> kRadioCases = <DemoCase>[
  DemoCase(
    id: 'radio-basic',
    title: '基础单选',
    description: 'RadioGroup 接管组值，子项只写 value。',
    builder: (_) => const RadioBasicDemo(),
  ),
  DemoCase(
    id: 'radio-listtile',
    title: '整行可点（RadioListTile）',
    description: '点标题文字也能选中。',
    builder: (_) => const RadioListTileDemo(),
  ),
  DemoCase(
    id: 'radio-enum',
    title: '枚举类型驱动',
    description: '泛型用枚举而不是字符串，编译期防写错值。',
    builder: (_) => const RadioEnumDemo(),
  ),
  DemoCase(
    id: 'radio-disabled',
    title: '禁用单项',
    description: 'enabled: false 让该项不可选。',
    builder: (_) => const RadioDisabledDemo(),
  ),
  DemoCase(
    id: 'radio-group-new-api',
    title: '新写法：RadioGroup 容器',
    description: '组状态上提到祖先 RadioGroup，子项只写 value。',
    builder: (_) => const RadioGroupNewDemo(),
  ),
];

// =====================================================================
// Switch 开关
// =====================================================================

/// 示例: switch-basic —— Wi-Fi 开关即时生效
class SwitchBasicDemo extends StatefulWidget {
  const SwitchBasicDemo({super.key});

  @override
  State<SwitchBasicDemo> createState() => _SwitchBasicDemoState();
}

class _SwitchBasicDemoState extends State<SwitchBasicDemo> {
  bool _wifi = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Wi-Fi'),
          const SizedBox(width: 12),
          Switch(
            value: _wifi,
            onChanged: (bool v) => setState(() => _wifi = v),
          ),
          Text(_wifi ? '已开启' : '已关闭'),
        ],
      ),
    );
  }
}

/// 示例: switch-listtile —— 设置列表风格
class SwitchListTileDemo extends StatefulWidget {
  const SwitchListTileDemo({super.key});

  @override
  State<SwitchListTileDemo> createState() => _SwitchListTileDemoState();
}

class _SwitchListTileDemoState extends State<SwitchListTileDemo> {
  bool _notify = true;
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: const Text('消息通知'),
              subtitle: const Text('接收推送和提醒'),
              secondary: const Icon(Icons.notifications),
              value: _notify,
              onChanged: (v) => setState(() => _notify = v),
            ),
            SwitchListTile(
              title: const Text('深色模式'),
              secondary: const Icon(Icons.dark_mode),
              value: _dark,
              onChanged: (v) => setState(() => _dark = v),
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例: switch-colored —— M3 状态属性配色
class SwitchColoredDemo extends StatefulWidget {
  const SwitchColoredDemo({super.key});

  @override
  State<SwitchColoredDemo> createState() => _SwitchColoredDemoState();
}

class _SwitchColoredDemoState extends State<SwitchColoredDemo> {
  bool _on = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: _on,
            onChanged: (v) => setState(() => _on = v),
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.green,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 12),
          Switch(
            value: !_on,
            activeColor: Colors.red,
            onChanged: (v) => setState(() => _on = !v),
          ),
        ],
      ),
    );
  }
}

/// 示例: switch-async —— 拨动后异步确认，期间显示加载
class SwitchAsyncDemo extends StatefulWidget {
  const SwitchAsyncDemo({super.key});

  @override
  State<SwitchAsyncDemo> createState() => _SwitchAsyncDemoState();
}

class _SwitchAsyncDemoState extends State<SwitchAsyncDemo> {
  bool _bluetooth = false;
  bool _pending = false;

  Future<void> _toggle(bool v) async {
    setState(() => _pending = true);
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      _bluetooth = v;
      _pending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_pending ? '处理中…' : '蓝牙'),
          const SizedBox(width: 12),
          Switch(
            value: _bluetooth,
            onChanged: _pending ? null : _toggle,
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kSwitchCases = <DemoCase>[
  DemoCase(
    id: 'switch-basic',
    title: '基础开关',
    description: 'Wi-Fi 开关即时生效。',
    builder: (_) => const SwitchBasicDemo(),
  ),
  DemoCase(
    id: 'switch-listtile',
    title: '整行可点（SwitchListTile）',
    description: '设置页标准形态，点标题也能切换。',
    builder: (_) => const SwitchListTileDemo(),
  ),
  DemoCase(
    id: 'switch-colored',
    title: 'Material 3 配色定制',
    description: '按状态（选中/未选中/禁用）给色。',
    builder: (_) => const SwitchColoredDemo(),
  ),
  DemoCase(
    id: 'switch-async',
    title: '禁用与加载确认',
    description: '拨动后异步确认，期间禁用防连点。',
    builder: (_) => const SwitchAsyncDemo(),
  ),
];

// =====================================================================
// Slider 滑块
// =====================================================================

/// 示例: slider-basic —— 0-100 连续拖动
class SliderBasicDemo extends StatefulWidget {
  const SliderBasicDemo({super.key});

  @override
  State<SliderBasicDemo> createState() => _SliderBasicDemoState();
}

class _SliderBasicDemoState extends State<SliderBasicDemo> {
  double _value = 30;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              value: _value,
              min: 0,
              max: 100,
              onChanged: (v) => setState(() => _value = v),
            ),
            Text('当前值：${_value.toStringAsFixed(1)}'),
          ],
        ),
      ),
    );
  }
}

/// 示例: slider-divisions —— 5 档价格选择
class SliderDivisionsDemo extends StatefulWidget {
  const SliderDivisionsDemo({super.key});

  @override
  State<SliderDivisionsDemo> createState() => _SliderDivisionsDemoState();
}

class _SliderDivisionsDemoState extends State<SliderDivisionsDemo> {
  double _price = 50;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              value: _price,
              min: 10,
              max: 90,
              divisions: 4,
              label: '¥${_price.round()}',
              onChanged: (v) => setState(() => _price = v),
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例: slider-range —— RangeSlider 双端选择
class SliderRangeDemo extends StatefulWidget {
  const SliderRangeDemo({super.key});

  @override
  State<SliderRangeDemo> createState() => _SliderRangeDemoState();
}

class _SliderRangeDemoState extends State<SliderRangeDemo> {
  RangeValues _range = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RangeSlider(
              values: _range,
              min: 0,
              max: 100,
              divisions: 10,
              labels: RangeLabels(
                '¥${_range.start.round()}',
                '¥${_range.end.round()}',
              ),
              onChanged: (v) => setState(() => _range = v),
            ),
            Text('区间：¥${_range.start.round()} - ¥${_range.end.round()}'),
          ],
        ),
      ),
    );
  }
}

/// 示例: slider-commit —— 松手时才真正应用
class SliderCommitDemo extends StatefulWidget {
  const SliderCommitDemo({super.key});

  @override
  State<SliderCommitDemo> createState() => _SliderCommitDemoState();
}

class _SliderCommitDemoState extends State<SliderCommitDemo> {
  double _dragging = 40;
  double _applied = 40;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              value: _dragging,
              min: 0,
              max: 100,
              onChanged: (v) => setState(() => _dragging = v),
              onChangeEnd: (v) {
                setState(() => _applied = v);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('已应用：$v'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            Text('拖动中：${_dragging.round()}　已提交：${_applied.round()}'),
          ],
        ),
      ),
    );
  }
}

/// 示例: slider-m3-icons —— 两端图标 + 主题色
class SliderM3IconsDemo extends StatefulWidget {
  const SliderM3IconsDemo({super.key});

  @override
  State<SliderM3IconsDemo> createState() => _SliderM3IconsDemoState();
}

class _SliderM3IconsDemoState extends State<SliderM3IconsDemo> {
  double _volume = 0.6;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: Row(
          children: [
            const Icon(Icons.volume_down),
            Expanded(
              child: Slider(
                value: _volume,
                onChanged: (v) => setState(() => _volume = v),
              ),
            ),
            const Icon(Icons.volume_up),
          ],
        ),
      ),
    );
  }
}

final List<DemoCase> kSliderCases = <DemoCase>[
  DemoCase(
    id: 'slider-basic',
    title: '基础连续滑块',
    description: '0-100 连续拖动。',
    builder: (_) => const SliderBasicDemo(),
  ),
  DemoCase(
    id: 'slider-divisions',
    title: '离散档位 + 气泡标签',
    description: 'divisions 切档位，label 在拖动时显示气泡。',
    builder: (_) => const SliderDivisionsDemo(),
  ),
  DemoCase(
    id: 'slider-range',
    title: '区间滑块 RangeSlider',
    description: '一次选一段（价格区间筛选）。',
    builder: (_) => const SliderRangeDemo(),
  ),
  DemoCase(
    id: 'slider-commit',
    title: '松手才提交',
    description: 'onChanged 更新 UI，onChangeEnd 才发请求。',
    builder: (_) => const SliderCommitDemo(),
  ),
  DemoCase(
    id: 'slider-m3-icons',
    title: 'M3 样式（带图标）',
    description: '两端图标 + 主题色。',
    builder: (_) => const SliderM3IconsDemo(),
  ),
];

// =====================================================================
// DropdownButton 下拉选择
// =====================================================================

/// 示例: dropdown-basic —— 城市单选下拉
class DropdownBasicDemo extends StatefulWidget {
  const DropdownBasicDemo({super.key});

  @override
  State<DropdownBasicDemo> createState() => _DropdownBasicDemoState();
}

class _DropdownBasicDemoState extends State<DropdownBasicDemo> {
  String? _city = '北京';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: _city,
        hint: const Text('请选择城市'),
        items: const [
          DropdownMenuItem(value: '北京', child: Text('北京')),
          DropdownMenuItem(value: '上海', child: Text('上海')),
          DropdownMenuItem(value: '广州', child: Text('广州')),
          DropdownMenuItem(value: '深圳', child: Text('深圳')),
        ],
        onChanged: (v) => setState(() => _city = v),
      ),
    );
  }
}

/// 示例: dropdown-form-field —— 带描边和标签的下拉
class DropdownFormFieldDemo extends StatefulWidget {
  const DropdownFormFieldDemo({super.key});

  @override
  State<DropdownFormFieldDemo> createState() => _DropdownFormFieldDemoState();
}

class _DropdownFormFieldDemoState extends State<DropdownFormFieldDemo> {
  String? _category;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: DropdownButtonFormField<String>(
          initialValue: _category,
          decoration: const InputDecoration(
            labelText: '分类',
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(value: 'food', child: Text('美食')),
            DropdownMenuItem(value: 'travel', child: Text('旅行')),
            DropdownMenuItem(value: 'tech', child: Text('科技')),
          ],
          onChanged: (v) => setState(() => _category = v),
        ),
      ),
    );
  }
}

/// 示例: dropdown-rich —— 带图标的选项
class DropdownRichDemo extends StatefulWidget {
  const DropdownRichDemo({super.key});

  @override
  State<DropdownRichDemo> createState() => _DropdownRichDemoState();
}

class _DropdownRichDemoState extends State<DropdownRichDemo> {
  int _priority = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<int>(
        value: _priority,
        items: const [
          DropdownMenuItem(
            value: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.flag, color: Colors.grey), Text(' 低')],
            ),
          ),
          DropdownMenuItem(
            value: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.flag, color: Colors.orange), Text(' 中')],
            ),
          ),
          DropdownMenuItem(
            value: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.flag, color: Colors.red), Text(' 高')],
            ),
          ),
        ],
        onChanged: (v) => setState(() => _priority = v ?? 1),
      ),
    );
  }
}

/// 示例: dropdown-bottom-sheet —— 长列表走底部选择器
class DropdownBottomSheetDemo extends StatefulWidget {
  const DropdownBottomSheetDemo({super.key});

  @override
  State<DropdownBottomSheetDemo> createState() =>
      _DropdownBottomSheetDemoState();
}

class _DropdownBottomSheetDemoState extends State<DropdownBottomSheetDemo> {
  String _bank = '工商银行';
  final _banks = [
    '工商银行',
    '建设银行',
    '农业银行',
    '中国银行',
    '招商银行',
    '交通银行',
    '邮储银行',
    '中信银行',
  ];

  Future<void> _pick() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            for (final b in _banks)
              ListTile(
                title: Text(b),
                trailing: b == _bank ? const Icon(Icons.check) : null,
                onTap: () => Navigator.pop(context, b),
              ),
          ],
        ),
      ),
    );
    if (result != null) setState(() => _bank = result);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: OutlinedButton.icon(
          onPressed: _pick,
          icon: const Icon(Icons.account_balance),
          label: Text(_bank),
        ),
      ),
    );
  }
}

final List<DemoCase> kDropdownButtonCases = <DemoCase>[
  DemoCase(
    id: 'dropdown-basic',
    title: '基础用法',
    description: '点击弹出选项菜单，选中后收起。',
    builder: (_) => const DropdownBasicDemo(),
  ),
  DemoCase(
    id: 'dropdown-form-field',
    title: '表单风格（带边框标签）',
    description: 'DropdownButtonFormField 直接获得 InputDecoration。',
    builder: (_) => const DropdownFormFieldDemo(),
  ),
  DemoCase(
    id: 'dropdown-rich',
    title: '富内容选项',
    description: '菜单项可放图标、颜色等任意 widget。',
    builder: (_) => const DropdownRichDemo(),
  ),
  DemoCase(
    id: 'dropdown-bottom-sheet',
    title: '选项过多：升级选择器',
    description: '长列表改用底部弹层 showModalBottomSheet。',
    builder: (_) => const DropdownBottomSheetDemo(),
  ),
];

// =====================================================================
// DatePicker 日期选择器
// =====================================================================

/// 示例: datepicker-basic —— 点按钮弹日历选日期
class DatePickerBasicDemo extends StatefulWidget {
  const DatePickerBasicDemo({super.key});

  @override
  State<DatePickerBasicDemo> createState() => _DatePickerBasicDemoState();
}

class _DatePickerBasicDemoState extends State<DatePickerBasicDemo> {
  DateTime? _date;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _date = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _date == null ? '尚未选择日期' : '已选：${_date!.toLocal()}'.split('.')[0],
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: _pickDate,
            icon: const Icon(Icons.calendar_today),
            label: const Text('选择日期'),
          ),
        ],
      ),
    );
  }
}

/// 示例: datepicker-time —— TimePicker 24/12 小时制
class TimePickerDemo extends StatefulWidget {
  const TimePickerDemo({super.key});

  @override
  State<TimePickerDemo> createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {
  TimeOfDay? _time;

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _time ?? TimeOfDay.now(),
      helpText: '选择提醒时间',
    );
    if (picked != null) setState(() => _time = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_time == null ? '尚未选择时间' : '已选：$_time'),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _pickTime,
            icon: const Icon(Icons.access_time),
            label: const Text('选择时间'),
          ),
        ],
      ),
    );
  }
}

/// 示例: datepicker-restrict —— 只允许选今天起 7 天内
class DatePickerRestrictDemo extends StatefulWidget {
  const DatePickerRestrictDemo({super.key});

  @override
  State<DatePickerRestrictDemo> createState() =>
      _DatePickerRestrictDemoState();
}

class _DatePickerRestrictDemoState extends State<DatePickerRestrictDemo> {
  DateTime? _date;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final last = now.add(const Duration(days: 7));
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? now,
      firstDate: now,
      lastDate: last,
      selectableDayPredicate: (day) {
        return day.weekday != DateTime.saturday &&
            day.weekday != DateTime.sunday;
      },
    );
    if (picked != null) setState(() => _date = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _date == null ? '只能选 7 天内的非周末' : '已选：${_date!.toLocal()}'.split('.')[0],
          ),
          const SizedBox(height: 12),
          FilledButton.tonalIcon(
            onPressed: _pickDate,
            icon: const Icon(Icons.event),
            label: const Text('预约日期'),
          ),
        ],
      ),
    );
  }
}

/// 示例: datepicker-styled —— 定制确认/取消按钮文案
class DatePickerStyledDemo extends StatefulWidget {
  const DatePickerStyledDemo({super.key});

  @override
  State<DatePickerStyledDemo> createState() => _DatePickerStyledDemoState();
}

class _DatePickerStyledDemoState extends State<DatePickerStyledDemo> {
  DateTime? _date;

  Future<void> _pick() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      cancelText: '关闭',
      confirmText: '就这天',
      errorFormatText: '日期格式不对',
    );
    if (picked != null) setState(() => _date = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _date == null ? '自定义按钮文案' : '已选：${_date!.toLocal()}'.split('.')[0],
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _pick,
            icon: const Icon(Icons.edit_calendar),
            label: const Text('选择日期'),
          ),
        ],
      ),
    );
  }
}

final List<DemoCase> kDatePickerCases = <DemoCase>[
  DemoCase(
    id: 'datepicker-basic',
    title: '选择日期',
    description: '点按钮弹日历选日期。',
    builder: (_) => const DatePickerBasicDemo(),
  ),
  DemoCase(
    id: 'datepicker-time',
    title: '选择时间',
    description: 'showTimePicker，返回 TimeOfDay。',
    builder: (_) => const TimePickerDemo(),
  ),
  DemoCase(
    id: 'datepicker-restrict',
    title: '限制可选范围与高亮日',
    description: 'selectableDayPredicate 精确控制哪些天可点。',
    builder: (_) => const DatePickerRestrictDemo(),
  ),
  DemoCase(
    id: 'datepicker-styled',
    title: '中文化与外观',
    description: '定制确认 / 取消按钮文案。',
    builder: (_) => const DatePickerStyledDemo(),
  ),
];

// =====================================================================
// 分组装配
// =====================================================================

final ComponentGroup kFormGroup = ComponentGroup(
  title: '表单输入',
  icon: Icons.edit_note_outlined,
  items: <ComponentInfo>[
    ComponentInfo(
      name: 'TextField 输入框',
      route: '/components/textfield',
      kind: 'StatefulWidget',
      intro: 'TextField 是文本输入的核心组件，TextFormField 用于放进 Form 做校验。',
      cases: kTextFieldCases,
    ),
    ComponentInfo(
      name: 'Form 表单校验',
      route: '/components/form',
      kind: 'StatefulWidget',
      intro: 'Form 把一组输入项聚合成整体，统一校验、统一重置。',
      cases: kFormCases,
    ),
    ComponentInfo(
      name: 'Checkbox 复选框',
      route: '/components/checkbox',
      kind: 'StatefulWidget',
      intro: 'Checkbox 表示开/关二态选择，是受控组件，由外部 value + onChanged 决定。',
      cases: kCheckboxCases,
    ),
    ComponentInfo(
      name: 'Radio 单选框',
      route: '/components/radio',
      kind: 'StatefulWidget',
      intro: 'Radio 用于一组互斥选项里选一个，Flutter 3.32+ 用祖先 RadioGroup 统一接管组状态。',
      cases: kRadioCases,
    ),
    ComponentInfo(
      name: 'Switch 开关',
      route: '/components/switch',
      kind: 'StatefulWidget',
      intro: 'Switch 表示即时生效的开/关切换，带滑动动画。',
      cases: kSwitchCases,
    ),
    ComponentInfo(
      name: 'Slider 滑块',
      route: '/components/slider',
      kind: 'StatefulWidget',
      intro: 'Slider 让用户在一段区间内拖动选择数值。',
      cases: kSliderCases,
    ),
    ComponentInfo(
      name: 'DropdownButton 下拉选择',
      route: '/components/dropdownbutton',
      kind: 'StatefulWidget',
      intro: 'DropdownButton 点击弹出选项菜单，选中后收起。',
      cases: kDropdownButtonCases,
    ),
    ComponentInfo(
      name: 'DatePicker 日期选择器',
      route: '/components/datepicker',
      kind: 'StatefulWidget',
      intro: '日期选择通过 showDatePicker 弹出对话框，时间用 showTimePicker。',
      cases: kDatePickerCases,
    ),
  ],
);
