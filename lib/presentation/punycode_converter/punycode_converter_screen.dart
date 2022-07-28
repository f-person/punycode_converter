import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:punycode_converter/application/punycode/punycode_converter_cubit/punycode_converter_cubit.dart';
import 'package:punycode_converter/dependency_injection/dependencies/punycode_dependencies.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';
import 'package:punycode_converter/presentation/core/layout/scrollable_flexible_view.dart';
import 'package:punycode_converter/presentation/punycode_converter/widgets/translation_field/translation_field.dart';

class PunycodeConverterScreen extends StatefulHookWidget {
  const PunycodeConverterScreen({super.key});

  @override
  State<PunycodeConverterScreen> createState() => _PunycodeConverterScreenState();
}

class _PunycodeConverterScreenState extends State<PunycodeConverterScreen> {
  late final _textFocus = FocusNode()..addListener(_focusChangeListener);
  late final _punycodeFocus = FocusNode()..addListener(_focusChangeListener);

  final _canDisplayCopyForTextNotifier = ValueNotifier<bool>(false);
  final _canDisplayCopyForPunycodeNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _textFocus.dispose();
    _punycodeFocus.dispose();

    _canDisplayCopyForTextNotifier.dispose();
    _canDisplayCopyForPunycodeNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    final textController = useTextEditingController();
    final punycodeController = useTextEditingController();

    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Punycode converter'),
          backgroundColor: AppColors.secondary.withOpacity(0.3),
        ),
        backgroundColor: AppColors.primary,
        body: BlocProvider<PunycodeConverterCubit>(
          create: constF(punycodeConverterCubitLocator()),
          child: BlocListener<PunycodeConverterCubit, PunycodeConverterState>(
            listener: _createPunycodeConverterListener(
              textController: textController,
              punycodeController: punycodeController,
            ),
            child: ScrollableFlexibleView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _canDisplayCopyForTextNotifier,
                          builder: (context, canDisplayCopyButton, _) {
                            return TranslationField(
                              controller: textController,
                              focusNode: _textFocus,
                              onChanged: context.read<PunycodeConverterCubit>().updateText,
                              hintText: localization.textExample,
                              title: localization.textInputLabel,
                              canDisplayCopyButton: canDisplayCopyButton,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _canDisplayCopyForPunycodeNotifier,
                          builder: (context, canDisplayCopyButton, _) {
                            return TranslationField(
                              controller: punycodeController,
                              focusNode: _punycodeFocus,
                              hintText: localization.punycodeExample,
                              title: localization.punycodeInputLabel,
                              onChanged: context.read<PunycodeConverterCubit>().updatePunycode,
                              canDisplayCopyButton: canDisplayCopyButton,
                            );
                          },
                        ),
                      ),
                      const Divider(height: 40),
                      Text(
                        localization.whatIsPunycodeLabel,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(localization.whatIsPunycodeDescription),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _focusChangeListener() {
    if (_textFocus.hasFocus) {
      _canDisplayCopyForTextNotifier.value = false;
      _canDisplayCopyForPunycodeNotifier.value = true;
    } else if (_punycodeFocus.hasFocus) {
      _canDisplayCopyForTextNotifier.value = true;
      _canDisplayCopyForPunycodeNotifier.value = false;
    } else {
      _canDisplayCopyForTextNotifier.value = false;
      _canDisplayCopyForPunycodeNotifier.value = false;
    }
  }

  BlocWidgetListener<PunycodeConverterState> _createPunycodeConverterListener({
    required TextEditingController textController,
    required TextEditingController punycodeController,
  }) {
    return (context, state) {
      if (textController.text != state.text) {
        textController.text = state.text;
      }

      if (punycodeController.text != state.punycode) {
        punycodeController.text = state.punycode;
      }
    };
  }
}
