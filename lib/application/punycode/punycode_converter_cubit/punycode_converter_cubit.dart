import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:punycode_converter/application/core/functions/function_utils.dart';
import 'package:punycode_converter/domain/punycode/i_punycode_converter.dart';

part 'punycode_converter_state.dart';

class PunycodeConverterCubit extends Cubit<PunycodeConverterState> {
  PunycodeConverterCubit({required IPunycodeConverter converter})
      : _converter = converter,
        super(PunycodeConverterState.initial());

  final IPunycodeConverter _converter;

  void updateText(String text) {
    final punycode = _converter.convertTextToPunycode(text);

    emit(
      PunycodeConverterState(
        punycode: punycode,
        text: text,
        punycodeConversionFailure: const None(),
      ),
    );
  }

  void updatePunycode(String punycode) {
    final textConversionResult = _converter.convertPunycodeToText(punycode);

    emit(
      PunycodeConverterState(
        punycode: punycode,
        text: textConversionResult.toOption().match(id, constF0(state.text)),
        punycodeConversionFailure: textConversionResult.swap().toOption(),
      ),
    );
  }
}
