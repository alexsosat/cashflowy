import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit in charge of handling the horizontal scrolling behaviour of a bottomsheet
class BottomSheetScrollCubit extends Cubit<int> {
  /// Cubit in charge of handling the horizontal scrolling behaviour of a bottomsheet
  BottomSheetScrollCubit() : super(0);

  /// Controller for the bottomsheet
  PageController? pageController;

  /// Duration for the page transition
  final Duration _duration = const Duration(milliseconds: 300);

  /// Curve for the page transition
  final Curve _curve = Curves.easeInOut;

  /// Moves the bottomsheet to a specific page
  void moveTo(int index) => pageController?.animateToPage(
        index,
        duration: _duration,
        curve: _curve,
      );

  /// Disposes the page controller
  void dispose() {
    pageController?.dispose();
    pageController = null;
  }
}
