part of 'on_boarding_screens_bloc.dart';

abstract class OnBoardingScreensEvent extends Equatable {
  const OnBoardingScreensEvent();
}

class CompleteOnBoardingEvent extends OnBoardingScreensEvent {
  final bool isCompleted;
  const CompleteOnBoardingEvent(this.isCompleted);

  @override
  List<Object> get props => [isCompleted];
}

class NextScreenEvent extends OnBoardingScreensEvent {
  final int currentPage;
  const NextScreenEvent(this.currentPage);
  @override
  List<Object> get props => [];
}
