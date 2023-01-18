import 'dart:async';
import 'package:first_exo/models/flag.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'color_event.dart';

part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {

  ColorBloc() : super(ColorInitial()) {
    on<LoadColorEvent>((event, emit) {
      emit(ColorLoaded(Flag.defaultFlag, 0));
    });

    on<ColorRandomEvent>((event, emit) {
      Random random = Random();
      final colors = Flag.colors;
      final state = this.state as ColorLoaded;
      int randomNumber = random.nextInt(colors.length);
      emit(ColorLoaded(state.count == 0 ? colors[randomNumber] : state.drapeauSelected, state.count == 3 ? state.count : state.count + 1));
    });

    on<ColorRemoveEvent>((event, emit) {
      final state = this.state as ColorLoaded;
      emit(ColorLoaded(state.drapeauSelected, state.count == 0 ? state.count : state.count - 1));
    });

    on<ColorResetEvent>((event, emit) {
      emit(ColorLoaded(Flag.defaultFlag, 0));
    });
  }
}
