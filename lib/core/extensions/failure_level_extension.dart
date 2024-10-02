import "../../features/shared/presentation/widgets/overlays/dialog/base/confirmation_dialog.dart";
import "../errors/failure.dart";

/// Extension to parse the level of a failure to other data
extension FailureLevelExtension on FailureLevel {
  /// Converts the failure level to a dialog type enum
  DialogType toDialogType() => switch (this) {
        FailureLevel.info => DialogType.info,
        FailureLevel.warning => DialogType.warning,
        FailureLevel.error => DialogType.error,
      };
}
