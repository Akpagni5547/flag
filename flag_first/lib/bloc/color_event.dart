part of 'color_bloc.dart';

abstract class ColorEvent extends Equatable {
  const ColorEvent();
}

class LoadColorEvent extends ColorEvent {
  @override
  List<Object> get props => [];
}

class ColorRandomEvent extends ColorEvent {
  @override
  List<Object> get props => [];
}

class ColorRemoveEvent extends ColorEvent {
  @override
  List<Object> get props => [];
}

class ColorResetEvent extends ColorEvent {
  @override
  List<Object> get props => [];
}

