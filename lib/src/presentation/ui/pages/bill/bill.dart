import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/presentation/ui/pages/bill/bill_body.dart';
import 'package:foodon/src/presentation/ui/pages/bill/bloc/bill_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/background_cntr.dart';
import 'package:foodon/src/presentation/ui/widgets/top_header.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:provider/provider.dart';

class BillPage extends StatelessWidget {
  final billId;
  BillPage({this.billId});
  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    final userInfoProv = Provider.of<UserInfoProvider>(context);
    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                TopHeader(headerName: 'تکمیل سفارش'),
                SizedBox(height: 25.0),
                Expanded(
                  child: BlocBuilder(
                    bloc: BlocProvider.of<BillDetailsBloc>(context)
                      ..add(GetBillDetailsEvent(billId: billId)),
                    builder: (context, state) {
                      if (state is BillDetailsLoaded)
                        return Container(
                          child: BillBody(bill: state.billDetails),
                        );
                      else if (state is BillDetailsLoading)
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
