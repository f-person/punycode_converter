import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';
import 'package:punycode_converter/presentation/core/gestures/tappable.dart';
import 'package:punycode_converter/presentation/core/widgets/app_text_button.dart';
import 'package:punycode_converter/presentation/core/wrappers/animated_switcher_wrapper.dart';

part 'translation_field_copy_button.dart';
part 'translation_field_input.dart';
part 'translation_field_suffix.dart';

class TranslationField extends StatelessWidget {
  const TranslationField({
    required this.title,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.focusNode,
    required this.canDisplayCopyButton,
    super.key,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;
  final bool canDisplayCopyButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFFF4F4F6),
              ),
            ),
            const Spacer(),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, _) {
                final shouldDisplayCopyButton = canDisplayCopyButton && value.text.isNotEmpty;

                return AnimatedSwitcherWrapper(
                  transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
                  child: shouldDisplayCopyButton
                      ? SizedBox(
                          height: 48,
                          child: _TranslationFieldCopyButton(controller: controller),
                        )
                      : const SizedBox(height: 48),
                );
              },
            ),
          ],
        ),
        _TranslationFieldInput(
          controller: controller,
          onChanged: onChanged,
          hintText: hintText,
          focusNode: focusNode,
        ),
      ],
    );
  }
}
