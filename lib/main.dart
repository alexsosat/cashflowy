import "package:flutter/material.dart";

import "cashflowy_app.dart";
import "core/config/dependency_injection.dart";

void main() async {
  await DependencyInjection.injectCriticalServices();

  runApp(const CashflowyApp());
}
