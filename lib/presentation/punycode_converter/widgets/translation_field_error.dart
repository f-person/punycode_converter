part of '../punycode_converter_screen.dart';

class _TranslationFieldError extends StatefulWidget {
  const _TranslationFieldError({required this.conversionFailure, super.key});

  final Option<PunycodeConversionFailure> conversionFailure;

  @override
  State<_TranslationFieldError> createState() => _TranslationFieldErrorState();
}

class _TranslationFieldErrorState extends State<_TranslationFieldError> {
  late bool _hasError = widget.conversionFailure.isSome();

  @override
  void didUpdateWidget(_TranslationFieldError oldWidget) {
    final updatedWidgetHasError = widget.conversionFailure.isSome();

    if (updatedWidgetHasError != _hasError) {
      setState(() {
        _hasError = updatedWidgetHasError;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.only(
        left: 16,
        top: _hasError ? 10 : 5,
        bottom: _hasError ? 10 : 5,
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _hasError ? 1 : 0,
        child: Text(
          localization.invalidPunycodeError,
          style: const TextStyle(
            color: AppColors.error,
          ),
        ),
      ),
    );
  }
}
