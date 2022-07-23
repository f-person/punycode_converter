import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:punycode_converter/application/punycode/punycode_converter_cubit/punycode_converter_cubit.dart';
import 'package:punycode_converter/dependency_injection/dependencies/punycode_dependencies.dart';
import 'package:punycode_converter/gen/l10n.dart';

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
        ),
        body: BlocProvider<PunycodeConverterCubit>(
          create: constF(punycodeConverterCubitLocator()),
          child: BlocListener<PunycodeConverterCubit, PunycodeConverterState>(
            listener: _createPunycodeConverterListener(
              textController: textController,
              punycodeController: punycodeController,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      TextField(
                        controller: textController,
                        onChanged: context.read<PunycodeConverterCubit>().updateText,
                        decoration: InputDecoration(
                          labelText: localization.textInputLabel,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: punycodeController,
                        onChanged: context.read<PunycodeConverterCubit>().updatePunycode,
                        decoration: InputDecoration(
                          labelText: localization.punycodeInputLabel,
                        ),
                      ),
                    ],
                  );
                },
              ),
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
