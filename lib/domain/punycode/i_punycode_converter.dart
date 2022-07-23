import 'package:fpdart/fpdart.dart';

/// Converts punycode to text and back.
abstract class IPunycodeConverter {
  /// Convert [text] to punycode.
  String convertTextToPunycode(String text);

  /// Convert [punycode] to text.
  ///
  /// If the punycode is invalid, [Left(PunycodeConversionFailure.invalidPunycode)]
  /// will be returned.
  Either<PunycodeConversionFailure, String> convertPunycodeToText(
    String punycode,
  );
}

enum PunycodeConversionFailure { invalidPunycode }
