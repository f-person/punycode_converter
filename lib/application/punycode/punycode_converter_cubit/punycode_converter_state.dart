part of 'punycode_converter_cubit.dart';

class PunycodeConverterState extends Equatable {
  const PunycodeConverterState({
    required this.text,
    required this.punycode,
    required this.punycodeConversionFailure,
  });

  factory PunycodeConverterState.initial() {
    return const PunycodeConverterState(
      text: '',
      punycode: '',
      punycodeConversionFailure: None(),
    );
  }

  final String text;
  final String punycode;
  final Option<PunycodeConversionFailure> punycodeConversionFailure;

  @override
  List<Object> get props => [text, punycode, punycodeConversionFailure];
}
