import 'package:fpdart/fpdart.dart';
import 'package:punycode/punycode.dart';
import 'package:punycode_converter/domain/punycode/i_punycode_converter.dart';

class PunycodeConverterImpl implements IPunycodeConverter {
  @override
  String convertTextToPunycode(String text) {
    return punycodeEncode(text);
  }

  @override
  Either<PunycodeConversionFailure, String> convertPunycodeToText(String punycode) {
    try {
      final text = punycodeDecode(punycode);
      return Right(text);
    } on Exception catch (_) {
      return const Left(PunycodeConversionFailure.invalidPunycode);
    }
  }
}
