import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'languge_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences _prefs;

  LanguageCubit(this._prefs) : super(LanguageState(_getLocaleFromPrefs(_prefs)));

  static Locale _getLocaleFromPrefs(SharedPreferences prefs) {
    final languageCode = prefs.getString('language') ?? 'en';
    return Locale(languageCode);
  }

  Future<void> changeLanguage(Locale newLocale) async {
    await _prefs.setString('language', newLocale.languageCode);
    emit(LanguageState(newLocale));
  }
}