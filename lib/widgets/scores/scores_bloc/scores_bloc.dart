import 'package:bloc/bloc.dart';
import 'package:gate_of_olympus_app/services/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'scores_event.dart';
part 'scores_state.dart';

class ScoresBloc extends Bloc<ScoresEvent, ScoresState> {
  ScoresBloc() : super(ScoresInitial()) {
    on<GetScoresEvent>(_getScoresHandler);
    on<AddCoinsEvent>(_addCoinsHandler);
    on<AddHeartsEvent>(_addHeartsHandler);
  }

  void _getScoresHandler(
      GetScoresEvent event, Emitter<ScoresState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    emit(UpdateScoresState(
        coins: storage.coins,
        hearts: storage.hearts
    ));
  }

  void _addCoinsHandler(
      AddCoinsEvent event, Emitter<ScoresState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    storage.coins += event.value;

  }

  void _addHeartsHandler(
      AddHeartsEvent event, Emitter<ScoresState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    storage.hearts += event.value;

  }
}