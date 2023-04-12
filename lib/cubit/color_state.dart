part of 'color_cubit.dart';

///Will handle the different states of color data
abstract class ColorState extends Equatable {
  @override
  List<Object> get props => [];
}

/// initial state of color data
class ColorInitial extends ColorState {}

/// used for when the color data is being set
class ColorLoading extends ColorState {}

/// takes in a Color through it's constructor and be emitted when color needs to
///  change
class ColorUpdated extends ColorState {
  ///value that will store the color data in the ColorUpdated state
  final Color loadedColor;

  ///constructor for initialization
  ColorUpdated({required this.loadedColor});
}
