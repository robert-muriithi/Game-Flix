import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repository/onboarding_screens_repository.dart';

part 'on_boarding_screens_event.dart';
part 'on_boarding_screens_state.dart';

class OnBoardingScreensBloc extends Bloc<OnBoardingScreensEvent, OnBoardingScreensState> {
  final OnBoardingScreensRepository onBoardingScreensRepository;
  OnBoardingScreensBloc(this.onBoardingScreensRepository) : super(OnBoardingScreensInitial()) {
    on<OnBoardingScreensEvent>(handleOnboardingScreensEvent);
  }

  FutureOr<void> handleOnboardingScreensEvent(OnBoardingScreensEvent event, Emitter<OnBoardingScreensState> emit) async {
    if (event is CompleteOnBoardingEvent) {
      try {
        await onBoardingScreensRepository.setOnBoardingStatus(event.isCompleted);
        emit(OnBoardingScreensCompletedState());
      } catch (e) {
        emit(OnBoardingScreensErrorState(e.toString()));
      }
    }
  }


}
