part of 'translation_field.dart';

class _TranslationFieldCopyButton extends StatelessWidget {
  const _TranslationFieldCopyButton({required this.controller, super.key});

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
