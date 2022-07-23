import 'package:punycode_converter/application/punycode/punycode_converter_cubit/punycode_converter_cubit.dart';
import 'package:punycode_converter/dependency_injection/toor.dart';
import 'package:punycode_converter/domain/punycode/i_punycode_converter.dart';
import 'package:punycode_converter/infrastructure/punycode/punycode_converter_impl.dart';

final punycodeConverterLocator = toor.registerFactory<IPunycodeConverter>(
  PunycodeConverterImpl.new,
);

final punycodeConverterCubitLocator = toor.registerFactory(
  () => PunycodeConverterCubit(converter: punycodeConverterLocator()),
);
