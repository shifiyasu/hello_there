import 'dart:math' as math;
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'color_state.dart';

///Cubit that handles changing states of Color
class ColorCubit extends Cubit<ColorState> {
  /// initialization
  ColorCubit() : super(ColorInitial());

  ///simple function that returns a new color every time its called
  Color generateRandomColor() {
    const baseColor = 0xFFFFFF;

    return Color((math.Random().nextDouble() * baseColor).toInt())
        .withOpacity(1);
  }

  /// function used to rebuild the UI with the appropriate color
  void updateBackgroundColor() {
    emit(ColorLoading());

    emit(ColorUpdated(loadedColor: generateRandomColor()));
  }
}
