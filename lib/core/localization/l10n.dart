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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(
      _current != null,
      'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `selecciona un tipo de cuenta`
  String get accountTypeSelect {
    return Intl.message(
      'selecciona un tipo de cuenta',
      name: 'accountTypeSelect',
      desc: '',
      args: [],
    );
  }

  /// `Ruta de directorio no encontrada`
  String get appDirectoryNotFound {
    return Intl.message(
      'Ruta de directorio no encontrada',
      name: 'appDirectoryNotFound',
      desc: '',
      args: [],
    );
  }

  /// `selecciona el tipo de tarjeta`
  String get bankCardTypeSelect {
    return Intl.message(
      'selecciona el tipo de tarjeta',
      name: 'bankCardTypeSelect',
      desc: '',
      args: [],
    );
  }

  /// `cancelar`
  String get cancel {
    return Intl.message('cancelar', name: 'cancel', desc: '', args: []);
  }

  /// `selecciona un color`
  String get colorSelect {
    return Intl.message(
      'selecciona un color',
      name: 'colorSelect',
      desc: '',
      args: [],
    );
  }

  /// `confirmar`
  String get confirm {
    return Intl.message('confirmar', name: 'confirm', desc: '', args: []);
  }

  /// `Ocurrío un error al crear el logo`
  String get createLogoErrorTitle {
    return Intl.message(
      'Ocurrío un error al crear el logo',
      name: 'createLogoErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Límite de crédito`
  String get creditCardAmountLimit {
    return Intl.message(
      'Límite de crédito',
      name: 'creditCardAmountLimit',
      desc: '',
      args: [],
    );
  }

  /// `selecciona una moneda`
  String get currencySelect {
    return Intl.message(
      'selecciona una moneda',
      name: 'currencySelect',
      desc: '',
      args: [],
    );
  }

  /// `cargando`
  String get loading {
    return Intl.message('cargando', name: 'loading', desc: '', args: []);
  }

  /// `Ocurrió un error al obtener el directorio de logos`
  String get logoDirectoryErrorTitle {
    return Intl.message(
      'Ocurrió un error al obtener el directorio de logos',
      name: 'logoDirectoryErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `selecciona un logo`
  String get logoSelect {
    return Intl.message(
      'selecciona un logo',
      name: 'logoSelect',
      desc: '',
      args: [],
    );
  }

  /// `Error al obtener los logos`
  String get logosRetrieveAllError {
    return Intl.message(
      'Error al obtener los logos',
      name: 'logosRetrieveAllError',
      desc: '',
      args: [],
    );
  }

  /// `nombre`
  String get name {
    return Intl.message('nombre', name: 'name', desc: '', args: []);
  }

  /// `no hay información disponible`
  String get noInfoAvailable {
    return Intl.message(
      'no hay información disponible',
      name: 'noInfoAvailable',
      desc: '',
      args: [],
    );
  }

  /// `no se encontraron elementos`
  String get noItemsFound {
    return Intl.message(
      'no se encontraron elementos',
      name: 'noItemsFound',
      desc: '',
      args: [],
    );
  }

  /// `reintentar`
  String get refreshPage {
    return Intl.message('reintentar', name: 'refreshPage', desc: '', args: []);
  }

  /// `buscar`
  String get search {
    return Intl.message('buscar', name: 'search', desc: '', args: []);
  }

  /// `ocurrió un error inesperado`
  String get unexpectedError {
    return Intl.message(
      'ocurrió un error inesperado',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
