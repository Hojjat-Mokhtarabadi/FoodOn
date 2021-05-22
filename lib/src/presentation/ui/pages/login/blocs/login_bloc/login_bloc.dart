import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetUserAuthentication getUserAuthentication;
  LoginBloc({@required this.getUserAuthentication}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is GetUserAuthenticationEvent) {
      yield LoginLoading();
      final result = await getUserAuthentication.call(event.user);
      yield* result.fold((failure) async* {
        if (failure is AuthenticationFailed) {
          yield LoginError(message: 'نام کاربری یا رمز عبور اشتباه است');
        } else if (failure is ServerFailure) {
          LoginError(message: kServerErrorMsg);
        } else if (failure is NoConnectionFailure) {
          LoginError(message: kNoConnectionMsg);
        }
      }, (success) async* {
        yield LoginSuccess(customer: success);
      });
    }
  }
}
