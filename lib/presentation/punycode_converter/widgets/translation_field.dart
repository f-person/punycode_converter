import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';
import 'package:punycode_converter/presentation/core/gestures/tappable.dart';
import 'package:punycode_converter/presentation/core/wrappers/animated_switcher_wrapper.dart';

class TranslationField extends StatefulWidget {
  const TranslationField({
    required this.title,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    super.key,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  State<TranslationField> createState() => _TranslationFieldState();
}

class _TranslationFieldState extends State<TranslationField> {
  late final _focusNode = FocusNode()..addListener(_focusChangeListener);
  final _hasFocusNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hasFocusNotifier.dispose();
    _focusNode
      ..removeListener(_focusChangeListener)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFFF4F4F6),
              ),
            ),
            const Spacer(),
            ValueListenableBuilder<bool>(
              valueListenable: _hasFocusNotifier,
              builder: (context, hasFocus, _) {
                final anyFieldHasFocus = FocusScope.of(context).hasFocus;

                return AnimatedSwitcherWrapper(
                  child: anyFieldHasFocus && !hasFocus
                      ? _CopyButton(controller: widget.controller)
                      : const SizedBox(height: 48),
                );
              },
            ),
          ],
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: AppColors.secondary.withOpacity(0.3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: double.infinity,
                      child: TextField(
                        controller: widget.controller,
                        onChanged: widget.onChanged,
                        focusNode: _focusNode,
                        textInputAction: TextInputAction.newline,
                        minLines: 8,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.hintText,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _hasFocusNotifier,
                    builder: (context, hasFocus, _) {
                      return AnimatedSwitcherWrapper(
                        child: !hasFocus
                            ? const SizedBox.shrink()
                            : _TranslationFieldSuffix(
                                controller: widget.controller,
                                valueChangedCallback: widget.onChanged,
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _focusChangeListener() {
    _hasFocusNotifier.value = _focusNode.hasFocus;
  }
}

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
          child: Tappable(
            key: Key(
              shouldClear ? 'translation_field_clear' : 'translation_field_paste',
            ),
            onTap: shouldClear ? _clearInput : _pasteTextIntoInput,
            child: shouldClear ? clearIcon : pasteIcon,
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

class _CopyButton extends StatelessWidget {
  const _CopyButton({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return TextButton(
      onPressed: () {
        Clipboard.setData(ClipboardData(text: controller.text));
      },
      style: TextButton.styleFrom(
        primary: AppColors.action,
      ),
      child: Text(localization.copyButtonLabel),
    );
  }
}
