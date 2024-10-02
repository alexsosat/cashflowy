// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(action, packageName) =>
      "Are you sure you want to ${action} notifications for the ${packageName} application?";

  static String m1(packageName) =>
      "This action will delete all ${packageName} notifications.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appList": MessageLookupByLibrary.simpleMessage("App list"),
        "appNotificationEnableQuestion": m0,
        "cancel": MessageLookupByLibrary.simpleMessage("cancel"),
        "cannotGetFailureFromLeft": MessageLookupByLibrary.simpleMessage(
            "Cannot get failure from Left"),
        "cannotGetFailureFromRight": MessageLookupByLibrary.simpleMessage(
            "Cannot get failure from Right"),
        "cannotGetValueFromLeft":
            MessageLookupByLibrary.simpleMessage("Cannot get value from Left"),
        "cannotGetValueFromRight":
            MessageLookupByLibrary.simpleMessage("Cannot get value from Right"),
        "changeSaveNotificationExceptionMessage":
            MessageLookupByLibrary.simpleMessage(
                "An error occurred while changing the save notification value"),
        "confirm": MessageLookupByLibrary.simpleMessage("confirm"),
        "deleteAppNotificationsWarningMessage": m1,
        "deleteNotificationsExceptionMessage":
            MessageLookupByLibrary.simpleMessage(
                "An error occurred while deleting notifications"),
        "disable": MessageLookupByLibrary.simpleMessage("disable"),
        "enable": MessageLookupByLibrary.simpleMessage("enable"),
        "enableAppNotificationsWarningMessage":
            MessageLookupByLibrary.simpleMessage(
                "This action will save all incoming notifications from this app."),
        "getAppExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "An error occurred while getting the application"),
        "getAppRegexExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "An error occurred when obtaining the regular expressions from the application"),
        "getAppsExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "An error occurred when obtaining the applications"),
        "getNotificationsExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "An error occurred when getting notifications from the application"),
        "loading": MessageLookupByLibrary.simpleMessage("loading"),
        "noAppsFound": MessageLookupByLibrary.simpleMessage("No apps found"),
        "noInfoAvailable":
            MessageLookupByLibrary.simpleMessage("No info available"),
        "saveAppExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "An error occurred while saving the application"),
        "saveNotificationExceptionMessage":
            MessageLookupByLibrary.simpleMessage(
                "An error occurred while saving the notification"),
        "unexpectedError":
            MessageLookupByLibrary.simpleMessage("unexpected error")
      };
}
