import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/domain/usecases/put_user_info.dart';

part 'update_user_info_event.dart';
part 'update_user_info_state.dart';

class UpdateUserInfoBloc
    extends Bloc<UpdateUserInfoEvent, UpdateUserInfoState> {
  final PutUserInfo putUserInfo;
  UpdateUserInfoBloc({this.putUserInfo}) : super(UpdateUserInfoInitial());

  @override
  Stream<UpdateUserInfoState> mapEventToState(
    UpdateUserInfoEvent event,
  ) async* {
    if (event is UpdateCurrentUserInfoEvent) {
      yield UpdateUserInfoLoading();
      final response = await putUserInfo.call(event.customer);
      yield* response.fold((failure) async* {
        if (failure is ServerFailure) {
          yield UpdateUserInfoError(msg: kServerErrorMsg);
        } else if (failure is NoConnectionFailure) {
          yield UpdateUserInfoError(msg: kNoConnectionMsg);
        }
      }, (success) async* {
        yield UpdateUserInfoSuccess();
      });
    }
  }
}
