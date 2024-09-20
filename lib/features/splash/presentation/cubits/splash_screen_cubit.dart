import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../core/config/dependency_injection.dart";
import "../../../../core/errors/failure.dart";
import "../../../../core/extensions/cubit_extension.dart";

part "splash_screen_state.dart";

/// Cubit in charge of managing the splash screen state.
class SplashScreenCubit extends Cubit<SplashScreenState> {
  /// Constructor for the cubit.
  SplashScreenCubit() : super(const SplashScreenLoading()) {
    _startApp();
  }

  bool _isAnimationFinished = false;
  bool _areServicesReady = false;
  bool _anErrorOccurred = false;

  /// Entry point of the application.
  Future<void> _startApp() async {
    await _injectDependencies();
    if (state is SplashScreenFailure) {
      return;
    }
    _markServicesReady();
  }

  /// Method to be called when the animation has finished.
  ///
  /// If the services are ready, it will emit a [SplashScreenSuccess] state.
  /// If the services are not ready, it will emit a
  /// [SplashScreenAnimationFinished] state.
  void markAnimationFinished() {
    if (_anErrorOccurred) {
      return;
    }
    _isAnimationFinished = true;

    if (_areServicesReady) {
      safeEmit(
        const SplashScreenSuccess(),
      );
    } else {
      safeEmit(const SplashScreenAnimationFinished());
    }
  }

  void _markServicesReady() {
    _areServicesReady = true;

    if (_isAnimationFinished) {
      safeEmit(
        const SplashScreenSuccess(),
      );
    }
  }

  Future _injectDependencies() async {
    try {
      await DependencyInjection.injectServices();
      DependencyInjection.injectRepositories();
    } catch (e) {
      _anErrorOccurred = true;
      safeEmit(
        SplashScreenFailure(
          failure: AppFailure.unexpected(
            e.toString(),
          ),
        ),
      );
    }
  }
}
