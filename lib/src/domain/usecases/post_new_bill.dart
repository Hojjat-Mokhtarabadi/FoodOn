import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PostNewBill extends UsecaseBase<PostSuccess, Bill> {
  final RemoteDataSourceRepository repository;
  PostNewBill({this.repository});
  @override
  Future<Either<Failure, PostSuccess>> call(Bill bill) async {
    return await repository.postNewBill(bill);
  }
}
