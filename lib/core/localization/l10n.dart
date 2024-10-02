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
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Listado de aplicaciones`
  String get appList {
    return Intl.message(
      'Listado de aplicaciones',
      name: 'appList',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro que deseas {action} las notificaciones para la aplicación {packageName}?`
  String appNotificationEnableQuestion(Object action, Object packageName) {
    return Intl.message(
      '¿Estás seguro que deseas $action las notificaciones para la aplicación $packageName?',
      name: 'appNotificationEnableQuestion',
      desc: '',
      args: [action, packageName],
    );
  }

  /// `Notificaciones de la aplicación habilitadas`
  String get appNotificationsEnabledMessage {
    return Intl.message(
      'Notificaciones de la aplicación habilitadas',
      name: 'appNotificationsEnabledMessage',
      desc: '',
      args: [],
    );
  }

  /// `cancelar`
  String get cancel {
    return Intl.message(
      'cancelar',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo obtener el error de Left`
  String get cannotGetFailureFromLeft {
    return Intl.message(
      'No se pudo obtener el error de Left',
      name: 'cannotGetFailureFromLeft',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo obtener el error de Right`
  String get cannotGetFailureFromRight {
    return Intl.message(
      'No se pudo obtener el error de Right',
      name: 'cannotGetFailureFromRight',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo obtener el valor de Left`
  String get cannotGetValueFromLeft {
    return Intl.message(
      'No se pudo obtener el valor de Left',
      name: 'cannotGetValueFromLeft',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo obtener el valor de Right`
  String get cannotGetValueFromRight {
    return Intl.message(
      'No se pudo obtener el valor de Right',
      name: 'cannotGetValueFromRight',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error al cambiar la notificación de guardado`
  String get changeSaveNotificationExceptionMessage {
    return Intl.message(
      'Ocurrió un error al cambiar la notificación de guardado',
      name: 'changeSaveNotificationExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `confirmar`
  String get confirm {
    return Intl.message(
      'confirmar',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Esta acción eliminará todas las notificaciones de {packageName}`
  String deleteAppNotificationsWarningMessage(Object packageName) {
    return Intl.message(
      'Esta acción eliminará todas las notificaciones de $packageName',
      name: 'deleteAppNotificationsWarningMessage',
      desc: '',
      args: [packageName],
    );
  }

  /// `Se eliminaron {deletedNotifications} notificaciones`
  String deletedNotificationsCountMessage(Object deletedNotifications) {
    return Intl.message(
      'Se eliminaron $deletedNotifications notificaciones',
      name: 'deletedNotificationsCountMessage',
      desc: '',
      args: [deletedNotifications],
    );
  }

  /// `Ocurrió un error al eliminar las notificaciones`
  String get deleteNotificationsExceptionMessage {
    return Intl.message(
      'Ocurrió un error al eliminar las notificaciones',
      name: 'deleteNotificationsExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `deshabilitar`
  String get disable {
    return Intl.message(
      'deshabilitar',
      name: 'disable',
      desc: '',
      args: [],
    );
  }

  /// `Deshabilitando notificaciones para la aplicación`
  String get disablingAppNotificationsLoadingMessage {
    return Intl.message(
      'Deshabilitando notificaciones para la aplicación',
      name: 'disablingAppNotificationsLoadingMessage',
      desc: '',
      args: [],
    );
  }

  /// `habilitar`
  String get enable {
    return Intl.message(
      'habilitar',
      name: 'enable',
      desc: '',
      args: [],
    );
  }

  /// `Esta acción guardará todas las notificaciones provenientes de esta aplicación`
  String get enableAppNotificationsWarningMessage {
    return Intl.message(
      'Esta acción guardará todas las notificaciones provenientes de esta aplicación',
      name: 'enableAppNotificationsWarningMessage',
      desc: '',
      args: [],
    );
  }

  /// `Habilitando notificaciones para la aplicación`
  String get enablingAppNotificationsLoadingMessage {
    return Intl.message(
      'Habilitando notificaciones para la aplicación',
      name: 'enablingAppNotificationsLoadingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error al obtener la aplicación`
  String get getAppExceptionMessage {
    return Intl.message(
      'Ocurrió un error al obtener la aplicación',
      name: 'getAppExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error al obtener las expresiones regulares de la aplicación`
  String get getAppRegexExceptionMessage {
    return Intl.message(
      'Ocurrió un error al obtener las expresiones regulares de la aplicación',
      name: 'getAppRegexExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error al obtener las aplicaciones`
  String get getAppsExceptionMessage {
    return Intl.message(
      'Ocurrió un error al obtener las aplicaciones',
      name: 'getAppsExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrío un error al obtener las notificaciones de la aplicación`
  String get getNotificationsExceptionMessage {
    return Intl.message(
      'Ocurrío un error al obtener las notificaciones de la aplicación',
      name: 'getNotificationsExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `cargando`
  String get loading {
    return Intl.message(
      'cargando',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `No se encontraron aplicaciones`
  String get noAppsFound {
    return Intl.message(
      'No se encontraron aplicaciones',
      name: 'noAppsFound',
      desc: '',
      args: [],
    );
  }

  /// `No hay información disponible`
  String get noInfoAvailable {
    return Intl.message(
      'No hay información disponible',
      name: 'noInfoAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error al guardar la aplicación`
  String get saveAppExceptionMessage {
    return Intl.message(
      'Ocurrió un error al guardar la aplicación',
      name: 'saveAppExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error al guardar la notificación`
  String get saveNotificationExceptionMessage {
    return Intl.message(
      'Ocurrió un error al guardar la notificación',
      name: 'saveNotificationExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Operación exitosa`
  String get successOperation {
    return Intl.message(
      'Operación exitosa',
      name: 'successOperation',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error inesperado`
  String get unexpectedError {
    return Intl.message(
      'Ocurrió un error inesperado',
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
