part of 'scores_bloc.dart';

@immutable
sealed class ScoresState {}

final class ScoresInitial extends ScoresState {}

final class UpdateScoresState extends ScoresState {
  final int coins;
  final int hearts;

  UpdateScoresState({required this.coins, required this.hearts});
}