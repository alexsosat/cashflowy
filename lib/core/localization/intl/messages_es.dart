// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m0(action, packageName) =>
      "¿Estás seguro que deseas ${action} las notificaciones para la aplicación ${packageName}?";

  static String m1(packageName) =>
      "Esta acción eliminará todas las notificaciones de ${packageName}";

  static String m2(deletedNotifications) =>
      "Se eliminaron ${deletedNotifications} notificaciones";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appList":
            MessageLookupByLibrary.simpleMessage("Listado de aplicaciones"),
        "appNotificationEnableQuestion": m0,
        "appNotificationsEnabledMessage": MessageLookupByLibrary.simpleMessage(
            "Notificaciones de la aplicación habilitadas"),
        "cancel": MessageLookupByLibrary.simpleMessage("cancelar"),
        "cannotGetFailureFromLeft": MessageLookupByLibrary.simpleMessage(
            "No se pudo obtener el error de Left"),
        "cannotGetFailureFromRight": MessageLookupByLibrary.simpleMessage(
            "No se pudo obtener el error de Right"),
        "cannotGetValueFromLeft": MessageLookupByLibrary.simpleMessage(
            "No se pudo obtener el valor de Left"),
        "cannotGetValueFromRight": MessageLookupByLibrary.simpleMessage(
            "No se pudo obtener el valor de Right"),
        "changeSaveNotificationExceptionMessage":
            MessageLookupByLibrary.simpleMessage(
                "Ocurrió un error al cambiar la notificación de guardado"),
        "confirm": MessageLookupByLibrary.simpleMessage("confirmar"),
        "deleteAppNotificationsWarningMessage": m1,
        "deleteNotificationsExceptionMessage":
            MessageLookupByLibrary.simpleMessage(
                "Ocurrió un error al eliminar las notificaciones"),
        "deletedNotificationsCountMessage": m2,
        "disable": MessageLookupByLibrary.simpleMessage("deshabilitar"),
        "disablingAppNotificationsLoadingMessage":
            MessageLookupByLibrary.simpleMessage(
                "Deshabilitando notificaciones para la aplicación"),
        "enable": MessageLookupByLibrary.simpleMessage("habilitar"),
        "enableAppNotificationsWarningMessage":
            MessageLookupByLibrary.simpleMessage(
                "Esta acción guardará todas las notificaciones provenientes de esta aplicación"),
        "enablingAppNotificationsLoadingMessage":
            MessageLookupByLibrary.simpleMessage(
                "Habilitando notificaciones para la aplicación"),
        "getAppExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Ocurrió un error al obtener la aplicación"),
        "getAppRegexExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Ocurrió un error al obtener las expresiones regulares de la aplicación"),
        "getAppsExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Ocurrió un error al obtener las aplicaciones"),
        "getNotificationsExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Ocurrío un error al obtener las notificaciones de la aplicación"),
        "loading": MessageLookupByLibrary.simpleMessage("cargando"),
        "noAppsFound": MessageLookupByLibrary.simpleMessage(
            "No se encontraron aplicaciones"),
        "noInfoAvailable": MessageLookupByLibrary.simpleMessage(
            "No hay información disponible"),
        "saveAppExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Ocurrió un error al guardar la aplicación"),
        "saveNotificationExceptionMessage":
            MessageLookupByLibrary.simpleMessage(
                "Ocurrió un error al guardar la notificación"),
        "successOperation":
            MessageLookupByLibrary.simpleMessage("Operación exitosa"),
        "unexpectedError":
            MessageLookupByLibrary.simpleMessage("Ocurrió un error inesperado")
      };
}
