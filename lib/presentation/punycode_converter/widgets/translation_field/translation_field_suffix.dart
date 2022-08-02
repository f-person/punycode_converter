part of 'translation_field.dart';

class _TranslationFieldSuffix extends StatelessWidget {
  const _TranslationFieldSuffix({
    required this.controller,
    required this.valueChangedCallback,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> valueChangedCallback;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        const pasteIcon = Icon(Icons.paste_rounded);
        const clearIcon = Icon(Icons.clear_rounded);

        final shouldClear = value.text.isNotEmpty;

        return AnimatedSwitcherWrapper(
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          child: AppIconButton(
            key: Key(
              shouldClear ? 'translation_field_clear' : 'translation_field_paste',
            ),
            onTap: shouldClear ? _clearInput : _pasteTextIntoInput,
            icon: shouldClear ? clearIcon : pasteIcon,
          ),
        );
      },
    );
  }

  void _clearInput() {
    controller.clear();
    valueChangedCallback('');
  }

  Future<void> _pasteTextIntoInput() async {
    final data = await Clipboard.getData('text/plain');
    final text = data?.text;

    if (text != null) {
      controller.value = TextEditingValue(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
      );
      valueChangedCallback(text);
    }
  }
}
