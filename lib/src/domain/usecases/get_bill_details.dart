import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

import 'get_user_bills.dart';

class GetBillDetails extends UsecaseBase<BillDetailsModel, BillReqModel> {
  final RemoteDataSourceRepository repository;
  GetBillDetails({this.repository});
  @override
  Future<Either<Failure, BillDetailsModel>> call(BillReqModel billReq) async {
    return await repository.getBillDetails(billReq);
  }
}
