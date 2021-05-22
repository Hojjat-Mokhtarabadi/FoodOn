import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/domain/usecases/get_user_info.dart';

import '../../../../../../../constants.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final GetUserInfo getUserInfo;
  UserInfoBloc({this.getUserInfo}) : super(UserInfoInitial()) {
    add(GetUserInfoEvent());
  }

  @override
  Stream<UserInfoState> mapEventToState(
    UserInfoEvent event,
  ) async* {
    if (event is GetUserInfoEvent) {
      yield UserInfoLoading();
      final result = await getUserInfo.call(event.userId);
      yield* result.fold((failure) async* {
        if (failure is ServerFailure) {
          yield UserInfoError(msg: kServerErrorMsg);
        } else {
          yield UserInfoError(msg: kNoConnectionMsg);
        }
      }, (success) async* {
        yield UserInfoLoaded(user: success);
      });
    }
  }
}
