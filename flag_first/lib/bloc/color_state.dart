part of 'color_bloc.dart';


abstract class ColorState extends Equatable {
  const ColorState();
}

class ColorInitial extends ColorState {
  @override
  List<Object> get props => [];
}


class ColorLoaded extends ColorState {
  final Flag drapeauSelected;
  final int count;
  const ColorLoaded(this.drapeauSelected, this.count);

  @override
  List<Object> get props => [drapeauSelected, count];
}
