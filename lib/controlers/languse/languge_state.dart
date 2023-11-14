part of 'languge_cubit.dart';

@immutable
abstract class LangugeStatee {}

class LanguageState  extends LangugeStatee{
  final Locale locale;

  LanguageState(this.locale);
}