import "package:flutter_bloc/flutter_bloc.dart";
import "package:fpdart/fpdart.dart";

import "../../../../core/cubit_states/state_mixin.dart";
import "../../../../core/errors/failure.dart";
import "../../../../core/extensions/cubit_extension.dart";

/// Base cubit for getting information from a use case
abstract class GetInfoCubit<T> extends Cubit<StateMixin<T>> {
  /// Base cubit for getting information from a use case
  GetInfoCubit() : super(StateMixin.loading()) {
    getInfo();
  }

  /// Fetch the information from a use case
  Future<T?> getInfo() async {
    try {
      safeEmit(StateMixin.loading());
      final response = await callUseCase();
      final data = response.fold(
        (failure) {
          safeEmit(StateMixin.failure(failure));

          return null;
        },
        (data) {
          safeEmit(StateMixin.success(data));

          return data;
        },
      );

      return data;
    } catch (e) {
      safeEmit(
        StateMixin.failure(
          AppFailure.unexpected(
            e.toString(),
          ),
        ),
      );

      return null;
    }
  }

  /// Use case to call
  Future<Either<Failure, T>> callUseCase();
}
