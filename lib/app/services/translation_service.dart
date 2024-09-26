import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static final TranslationService _instance = TranslationService._internal();
  factory TranslationService() => _instance;

  TranslationService._internal();

  final Map<String, Map<String, String>> _translations = {};

  Future<void> loadTranslations() async {
    // final enUs = await rootBundle.loadString('assets/lang/en_US.json');
    final esEs = await rootBundle.loadString('assets/lang/es_ES.json');

    // _translations['en_US'] = Map<String, String>.from(json.decode(enUs));
    _translations['es_ES'] = Map<String, String>.from(json.decode(esEs));
  }

  static Locale get locale => Get.deviceLocale ?? const Locale('es', 'ES');

  @override
  Map<String, Map<String, String>> get keys => _translations;
}
