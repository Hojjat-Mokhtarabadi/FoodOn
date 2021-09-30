import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/domain/usecases/get_food_image_by_id.dart';
import 'package:foodon/src/presentation/ui/pages/bill/bill.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/check_out_bloc/checkout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/delete_cart_order/delete_cart_order_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/get_orders_bloc/orderslist_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/cart_body.dart';
import 'package:foodon/src/presentation/ui/widgets/errors_alert.dart';
import 'package:foodon/src/presentation/ui/widgets/top_header.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:provider/provider.dart';

import '../../../../../locator.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _dialogKey = GlobalKey<State>();
  OrdersListBloc ordersBloc;
  GetFoodImageById foodImageById;
  @override
  void initState() {
    super.initState();
    ordersBloc = locator<OrdersListBloc>();
    foodImageById = locator<GetFoodImageById>();
  }

  @override
  Widget build(BuildContext context) {
    final userInfoProv = Provider.of<UserInfoProvider>(context);
    SizeConfig(context: context);
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 30.0),
        decoration: kBackgroundImageBox,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<OrdersListBloc>(context)
                  .add(GetOrdersListEvent(userId: userInfoProv.id));
            },
            child: Stack(
              children: [
                ListView(),
                Column(
                  children: [
                    TopHeader(
                      headerName: 'سبد خرید',
                    ),
                    SizedBox(height: 25.0),
                    Expanded(
                      child: BlocConsumer(
                        bloc: BlocProvider.of<CheckoutBloc>(context),
                        builder: (context, checkoutState) {
                          if (checkoutState is CheckoutLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return BlocBuilder(
                            bloc: BlocProvider.of<DeleteCartOrderBloc>(context),
                            builder: (context, state) => BlocConsumer(
                              bloc: BlocProvider.of<OrdersListBloc>(context)
                                ..add(GetOrdersListEvent(
                                    userId: userInfoProv.id)),
                              builder: (context, state) {
                                if (state is OrdersListLoaded) {
                                  List<int> ids = state.orders
                                      .map((e) => e.foodId)
                                      .toList();
                                  return FutureBuilder(
                                      future: foodImageById.getFoodImageById(
                                          'foodImages/', ids),
                                      builder: (context, snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());

                                          default:
                                            if (snapshot.hasError) {
                                              return Center(
                                                child: Text(
                                                    'Some error occurred!'),
                                              );
                                            } else {
                                              final files = snapshot.data;
                                              return CartBody(
                                                orders: state.orders,
                                                images: files,
                                              );
                                            }
                                        }
                                      });
                                } else if (state is OrdersListNotFound) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 30.0),
                                        child:
                                            Text('سـبد خریـد شـما خـالی اسـت'),
                                      ),
                                    ],
                                  );
                                } else if (state is OrdersListLoading ||
                                    state is DeleteCartOrderLoading) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.h * 0.01),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                                return Container();
                              },
                              listener: (context, state) {
                                if (state is OrdersListError) {
                                  showAlertDialog(
                                      context: context,
                                      msg: state.msg,
                                      bloc: (c) {
                                        //BlocProvider.of<HomeBloc>(c).add(GetHomeItemsEvent());
                                        Navigator.of(c).pop();
                                      });
                                }
                              },
                            ),
                          );
                        },
                        listener: (context, checkoutState) {
                          if (checkoutState is CheckoutSuccess) {
                            print('success checkout');
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => BillPage(
                                  billId: checkoutState.billId,
                                ),
                              ),
                            );
                          }
                          if (checkoutState is CheckoutError) {
                            print('errror checkout');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTopRow() {
    List<String> topRow = [
      'محصول',
      'تعداد',
      'فی',
      'مجموع',
    ];

    return topRow
        .map(
          (item) => Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Text(
                item,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
        .toList();
  }
}
