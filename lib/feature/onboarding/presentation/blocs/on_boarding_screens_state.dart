part of 'on_boarding_screens_bloc.dart';

abstract class OnBoardingScreensState extends Equatable {
  const OnBoardingScreensState();
}

class OnBoardingScreensInitial extends OnBoardingScreensState {
  @override
  List<Object> get props => [];
}

class OnBoardingScreensCompletedState extends OnBoardingScreensState {
  @override
  List<Object> get props => [];
}

class OnBoardingScreensErrorState extends OnBoardingScreensState {
  final String message;

  const OnBoardingScreensErrorState(this.message);

  @override
  List<Object> get props => [message];
}

