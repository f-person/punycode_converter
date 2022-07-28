import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:punycode_converter/application/punycode/punycode_converter_cubit/punycode_converter_cubit.dart';
import 'package:punycode_converter/dependency_injection/dependencies/punycode_dependencies.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';
import 'package:punycode_converter/presentation/core/layout/scrollable_flexible_view.dart';
import 'package:punycode_converter/presentation/punycode_converter/widgets/translation_field.dart';

class PunycodeConverterScreen extends HookWidget {
  const PunycodeConverterScreen({super.key});

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
            child: Builder(
              builder: (context) {
                return ScrollableFlexibleView(
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
                            child: TranslationField(
                              controller: textController,
                              onChanged: context.read<PunycodeConverterCubit>().updateText,
                              hintText: localization.textExample,
                              title: localization.textInputLabel,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: TranslationField(
                              controller: punycodeController,
                              hintText: localization.punycodeExample,
                              title: localization.punycodeInputLabel,
                              onChanged: context.read<PunycodeConverterCubit>().updatePunycode,
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
                );
              },
            ),
          ),
        ),
      ),
    );
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
