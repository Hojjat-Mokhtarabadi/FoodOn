import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/domain/usecases/delete_user.dart';

import '../../../../../../../constants.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final DeleteUser deleteUser;
  LogoutBloc({this.deleteUser}) : super(LogoutInitial());

  @override
  Stream<LogoutState> mapEventToState(
    LogoutEvent event,
  ) async* {
    if (event is LogOutUserEvent) {
      yield LogoutLoading();
      final result = await deleteUser.call(event.userId);
      yield* result.fold((failure) async* {
        if (failure is ServerFailure) {
          yield LogoutError(message: kServerErrorMsg);
        } else if (failure is NoConnectionFailure) {
          yield LogoutError(message: kNoConnectionMsg);
        }
      }, (success) async* {
        yield LogoutSuccess();
      });
    }
  }
}
