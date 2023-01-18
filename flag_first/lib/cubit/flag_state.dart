part of 'flag_cubit.dart';

abstract class FlagState extends Equatable {
  const FlagState();
}

class FlagInitial extends FlagState {
  @override
  List<Object> get props => [];
}

class FlagLoaded extends FlagState {
  final Flag flag;
  final int count;
  const FlagLoaded({required this.count, required this.flag});

  @override
  List<Object> get props => [flag, count];
}
