import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetUserBills extends UsecaseBase<List<Bill>, BillReqModel> {
  final RemoteDataSourceRepository repository;
  GetUserBills({this.repository});
  @override
  Future<Either<Failure, List<Bill>>> call(BillReqModel billReq) async {
    return await repository.getUserBills(billReq);
  }
}

class BillReqModel extends Equatable {
  final int userId;
  final int billId;
  BillReqModel({this.userId, this.billId});
  @override
  List<Object> get props => [userId, billId];
}
