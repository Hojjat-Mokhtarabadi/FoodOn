part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckoutOrdersEvent extends CheckoutEvent {
  final Bill bill;
  final List<CartOrdersView> cartOrdersList;
  final ClearCartReqModel cartInfo;

  CheckoutOrdersEvent({
    this.bill,
    this.cartOrdersList,
    this.cartInfo,
  });
  @override
  List<Object> get props => [bill];
}
