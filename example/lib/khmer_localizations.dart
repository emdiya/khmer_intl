import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class KhmerLocalizations {
  KhmerLocalizations(this.locale);

  final Locale locale;

  static KhmerLocalizations of(BuildContext context) {
    final value = Localizations.of<KhmerLocalizations>(
      context,
      KhmerLocalizations,
    );
    return value ?? KhmerLocalizations(const Locale('km'));
  }

  static const delegate = _KhmerLocalizationsDelegate();

  static const supportedLocales = <Locale>[Locale('km'), Locale('en')];

  String get appTitle =>
      locale.languageCode == 'km' ? 'ឧទាហរណ៍ khmer_intl' : 'khmer_intl demo';
  String get dateFormatting =>
      locale.languageCode == 'km' ? 'ទ្រង់ទ្រាយកាលបរិច្ឆេទ' : 'Date formatting';
  String get numberFormatting =>
      locale.languageCode == 'km' ? 'ទ្រង់ទ្រាយលេខ' : 'Number formatting';
  String get relativeTime =>
      locale.languageCode == 'km' ? 'ពេលវេលាទាក់ទង' : 'Relative time';
  String get plural => locale.languageCode == 'km' ? 'ពហុវចនៈ' : 'Plural';
  String get lunar => locale.languageCode == 'km'
      ? 'ចន្ទគតិ (ប្រហាក់ប្រហែល)'
      : 'Lunar calendar';
}

class _KhmerLocalizationsDelegate
    extends LocalizationsDelegate<KhmerLocalizations> {
  const _KhmerLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return KhmerLocalizations.supportedLocales.any(
      (item) => item.languageCode == locale.languageCode,
    );
  }

  @override
  Future<KhmerLocalizations> load(Locale locale) {
    return SynchronousFuture<KhmerLocalizations>(KhmerLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<KhmerLocalizations> old) {
    return false;
  }
}
