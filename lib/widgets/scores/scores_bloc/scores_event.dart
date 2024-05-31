part of 'scores_bloc.dart';

@immutable
sealed class ScoresEvent {}

class GetScoresEvent extends ScoresEvent {}

class AddCoinsEvent extends ScoresEvent {
  final int value;

  AddCoinsEvent({required this.value});
}

class AddHeartsEvent extends ScoresEvent {
  final int value;

  AddHeartsEvent({required this.value});
}