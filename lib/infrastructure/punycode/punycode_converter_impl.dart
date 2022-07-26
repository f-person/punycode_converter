import 'package:basic_utils/basic_utils.dart';
import 'package:fpdart/fpdart.dart';
import 'package:punycode_converter/domain/punycode/i_punycode_converter.dart';

class PunycodeConverterImpl implements IPunycodeConverter {
  @override
  String convertTextToPunycode(String text) {
    return DomainUtils.toIDN(text);
  }

  @override
  Either<PunycodeConversionFailure, String> convertPunycodeToText(String punycode) {
    try {
      final text = DomainUtils.fromIDN(punycode);
      return Right(text);
    } on Exception catch (_) {
      return const Left(PunycodeConversionFailure.invalidPunycode);
    }
  }
}
