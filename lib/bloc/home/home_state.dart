part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class ScrollUpdateState extends HomeState {
  final bool scroll;
  ScrollUpdateState({required this.scroll});
}
