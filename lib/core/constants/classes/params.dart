/// Base class for all params classes
abstract class Params<T> {
  /// Base class for all params classes
  const Params();

  /// Converts the params to a map
  T toCompanion() {
    throw UnimplementedError();
  }
}
