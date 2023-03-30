import 'package:flutter/cupertino.dart';

abstract class LanguageStates {}

class LanguageInitial extends LanguageStates {}

class ChangeLanguageState extends LanguageStates {
  final Locale locale;
  ChangeLanguageState({required this.locale});
}
