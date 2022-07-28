part of 'translation_field.dart';

class _TranslationFieldInput extends StatefulWidget {
  const _TranslationFieldInput({
    required this.controller,
    required this.onChanged,
    required this.hintText,
    required this.focusNode,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;
  final FocusNode focusNode;

  @override
  State<_TranslationFieldInput> createState() => _TranslationFieldInputState();
}

class _TranslationFieldInputState extends State<_TranslationFieldInput> {
  final _hasFocusNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_focusChangeListener);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_focusChangeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
                  focusNode: widget.focusNode,
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
    );
  }

  void _focusChangeListener() {
    _hasFocusNotifier.value = widget.focusNode.hasFocus;
  }
}
