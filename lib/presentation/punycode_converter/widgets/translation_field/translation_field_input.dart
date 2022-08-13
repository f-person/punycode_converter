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
    return GestureDetector(
      onTap: () {
        widget.focusNode.requestFocus();
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: AppColors.secondary30,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 16),
                child: TextField(
                  controller: widget.controller,
                  onChanged: widget.onChanged,
                  focusNode: widget.focusNode,
                  textInputAction: TextInputAction.newline,
                  autocorrect: false,
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
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
                      ? const SizedBox.square(dimension: AppIconButton.dimension)
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
