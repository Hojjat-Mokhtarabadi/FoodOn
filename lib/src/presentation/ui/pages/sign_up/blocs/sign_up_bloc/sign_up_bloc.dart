import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/domain/usecases/post_new_user.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final PostNewUser postNewUser;
  SignUpBloc({@required this.postNewUser}) : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpUserEvent) {
      yield SignUpLoading();
      final result = await postNewUser.call(event.customer);
      yield* result.fold((failure) async* {
        if (failure is AlreadyRegisteredFailure) {
          yield SignUpError(message: 'این حساب قبلا وارد شده');
        } else if (failure is ServerFailure) {
          yield SignUpError(message: kServerErrorMsg);
        } else if (failure is NoConnectionFailure) {
          yield SignUpError(message: kNoConnectionMsg);
        }
      }, (success) async* {
        print('here');
        yield SignUpSuccess();
      });
    }
  }
}
