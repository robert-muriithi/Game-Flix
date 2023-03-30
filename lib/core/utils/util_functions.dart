import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';

String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure: return Constants.SERVER_FAILURE_MESSAGE;
      case DatabaseFailure: return Constants.DATABASE_FAILURE_MESSAGE;
      default: return Constants.UNEXPECTED_FAILURE_MESSAGE;
    }
  }