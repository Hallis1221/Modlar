import '../app_localizations.dart';

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get helloWorld => 'Hei verden!';

  @override
  String get pageNotFound => 'Dette er ikke kalenderen du ser etter...';

  @override
  String get changeBackgroundColor => 'Endre bakgrunnsfarge';
}
