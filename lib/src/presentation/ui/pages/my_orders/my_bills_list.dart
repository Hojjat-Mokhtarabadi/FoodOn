import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/presentation/ui/pages/my_orders/bloc/bills_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/my_orders/my_bills_list_card.dart';
import 'package:foodon/src/presentation/ui/widgets/background_cntr.dart';
import 'package:foodon/src/presentation/ui/widgets/top_header.dart';

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Column(
            children: [
              TopHeader(headerName: 'سفارشات من'),
              SizedBox(height: 10.0),
              BlocConsumer(
                bloc: BlocProvider.of<BillsListBloc>(context),
                builder: (context, state) {
                  if (state is BillsListLoaded) {
                    print(state.bills);
                    final List<Bill> reversedBills =
                        state.bills.reversed.toList();
                    return Expanded(
                      child: ListView.builder(
                        //shrinkWrap: true,
                        //reverse: true,
                        itemCount: reversedBills.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: BillCard(
                            bill: reversedBills[index],
                          ),
                        ),
                      ),
                    );
                  } else if (state is BillsListLoading)
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: SizeConfig.h * 0.3),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  return Container();
                },
                listener: (context, state) {
                  if (state is BillsListError) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
