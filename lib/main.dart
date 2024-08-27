import "package:flutter/material.dart";

import "cashflowy_app.dart";
import "core/config/dependency_injection.dart";
import "core/config/environment_config.dart";

void main() async {
  EnvironmentConfig.init(
    flavor: Flavor.production,
  );

  await DependencyInjection.init();

  runApp(const CashflowyApp());
}
