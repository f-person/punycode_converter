import 'package:punycode_converter/dependency_injection/toor.dart';
import 'package:punycode_converter/domain/url/i_url_launcher.dart';
import 'package:punycode_converter/infrastructure/url/url_launcher_impl.dart';

final urlLauncherLocator = toor.registerFactory<IUrlLauncher>(UrlLauncherImpl.new);
