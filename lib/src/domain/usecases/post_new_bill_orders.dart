import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/bill/ins_orders_list.dart';
import 'package:foodon/src/data/models/bill/order.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PostNewBillOrders extends UsecaseBase<PostSuccess, List<BillOrder>> {
  final RemoteDataSourceRepository repository;
  PostNewBillOrders({this.repository});
  @override
  Future<Either<Failure, PostSuccess>> call(
      List<BillOrder> billOrdersList) async {
    return await repository.postNewBillOrders(billOrdersList);
  }
}
