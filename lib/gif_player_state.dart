part of 'gif_player_bloc.dart';

abstract class GifPlayerState extends Equatable {
  final String gifName;
  final String task;

  const GifPlayerState(this.task, this.gifName);

  @override
  List<Object> get props => [gifName];
}

class SleepingState extends GifPlayerState {
  SleepingState(String gifName, String task) : super(gifName, task);
}

class DancingState extends GifPlayerState {
  DancingState(String gifName, String task) : super(gifName, task);
}

class CryingState extends GifPlayerState {
  CryingState(String gifName, String task) : super(gifName, task);
}

class EatingState extends GifPlayerState {
  EatingState(String gifName, String task) : super(gifName, task);
}
