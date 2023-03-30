import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/languages/language_cache_helper.dart';
import 'language_state.dart';




class LanguageCubit extends Cubit<LanguageStates> {
  LanguageCubit() : super(LanguageInitial());

  Future<void> getSavedLanguage() async {
    final String languageCode = LanguageCacheHelper.getLanguageCode();
    emit(ChangeLanguageState(locale: Locale(languageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper.saveLanguageCode(languageCode);
    emit(ChangeLanguageState(locale: Locale(languageCode)));
  }
}
