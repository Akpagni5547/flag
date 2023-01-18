

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class CounterPressedIncrement extends CounterEvent {}

class CounterPressedDecrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc() : super(0) {
    on<CounterPressedIncrement>((event, emit) {
      emit(state + 1);
    });
    on<CounterPressedDecrement>((event, emit) {
      emit(state - 1);
    });
  }



}