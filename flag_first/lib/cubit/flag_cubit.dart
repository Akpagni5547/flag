import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_exo/models/flag.dart';

part 'flag_state.dart';

class FlagCubit extends Cubit<FlagState> {
  FlagCubit() : super(FlagInitial());

  void loadFlag(){
    emit(FlagLoaded(flag: Flag.defaultFlag, count: 0));
  }

  void addColor(){
    Random random = Random();
    final colors = Flag.colors;
    final state = this.state as FlagLoaded;
    int randomNumber = random.nextInt(colors.length);
    emit(FlagLoaded(flag : state.count == 0 ? colors[randomNumber] : state.flag, count: state.count == 3 ? state.count : state.count + 1, ));

  }

  void removeColor(){
    final state = this.state as FlagLoaded;
    emit(FlagLoaded(flag : state.flag, count: state.count == 0 ? state.count : state.count - 1, ));

  }

  void resetColor(){
    emit(FlagLoaded(flag: Flag.defaultFlag, count: 0));
  }
}
