// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Localization {
  Localization();

  static Localization? _current;

  static Localization get current {
    assert(_current != null,
        'No instance of Localization was loaded. Try to initialize the Localization delegate before accessing Localization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Localization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Localization();
      Localization._current = instance;

      return instance;
    });
  }

  static Localization of(BuildContext context) {
    final instance = Localization.maybeOf(context);
    assert(instance != null,
        'No instance of Localization present in the widget tree. Did you add Localization.delegate in localizationsDelegates?');
    return instance!;
  }

  static Localization? maybeOf(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  /// `Text`
  String get textInputLabel {
    return Intl.message(
      'Text',
      name: 'textInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Punycode`
  String get punycodeInputLabel {
    return Intl.message(
      'Punycode',
      name: 'punycodeInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `What is Punycode?`
  String get whatIsPunycodeLabel {
    return Intl.message(
      'What is Punycode?',
      name: 'whatIsPunycodeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Punycode is a representation of Unicode with the limited ASCII character subset used for Internet hostnames. Using Punycode, host names containing Unicode characters are transcoded to a subset of ASCII consisting of letters, digits, and hyphens, which is called the letter-digit-hyphen (LDH) subset.`
  String get whatIsPunycodeDescription {
    return Intl.message(
      'Punycode is a representation of Unicode with the limited ASCII character subset used for Internet hostnames. Using Punycode, host names containing Unicode characters are transcoded to a subset of ASCII consisting of letters, digits, and hyphens, which is called the letter-digit-hyphen (LDH) subset.',
      name: 'whatIsPunycodeDescription',
      desc: '',
      args: [],
    );
  }

  /// `COPY`
  String get copyButtonLabel {
    return Intl.message(
      'COPY',
      name: 'copyButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Example: թութ.հայ`
  String get textExample {
    return Intl.message(
      'Example: թութ.հայ',
      name: 'textExample',
      desc: '',
      args: [],
    );
  }

  /// `Example: xn--69aa8bzb.xn--y9a3aq`
  String get punycodeExample {
    return Intl.message(
      'Example: xn--69aa8bzb.xn--y9a3aq',
      name: 'punycodeExample',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsScreenTitle {
    return Intl.message(
      'Settings',
      name: 'settingsScreenTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Localization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Localization> load(Locale locale) => Localization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
