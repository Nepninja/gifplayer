import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gif_player_event.dart';

part 'gif_player_state.dart';

class GifPlayerBloc extends Bloc<GifPlayerEvent, GifPlayerState> {
  GifPlayerBloc() : super(SleepingState("Sleeping", "sleeping.gif"));

  @override
  Stream<GifPlayerState> mapEventToState(
    GifPlayerEvent event,
  ) async* {
    if (event is DanceEvent) {
      yield DancingState("Dancing", "dancing.gif");
    } else if (event is CryEvent) {
      yield CryingState("Crying", "crying.gif");
    } else if (event is EatEvent) {
      yield EatingState("Eating", "eating.gif");
    } else if (event is SleepEvent) {
      yield SleepingState("Sleeping", "sleeping.gif");
    }
  }
}
