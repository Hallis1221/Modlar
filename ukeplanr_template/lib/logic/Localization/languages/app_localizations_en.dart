import '../app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get pageNotFound => 'This isn\'t the calender you\'re looking for...';

  @override
  String get changeBackgroundColor => 'Change background color';
}
