import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/src/presentation/ui/widgets/top_header.dart';
import 'package:foodon/src/presentation/utils/dummy%20data.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        decoration: kBackgroundImageBox,
        child: SafeArea(
            child: Column(
          children: [
            TopHeader(
              headerName: 'سبد خرید',
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                Text('محصول'),
                //SizedBox(width: 2.0),
                Spacer(
                  flex: 3,
                ),
                Text('تعداد'),
                // SizedBox(width: 2.0),
                Spacer(
                  flex: 3,
                ),
                Text('فی'),
                //SizedBox(width: 0.5),
                Spacer(
                  flex: 2,
                ),
                Text('مجموع'),
                Spacer(),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            ListView.builder(
                shrinkWrap: true,
                //padding: EdgeInsets.symmetric(vertical: 4.0),
                itemCount: Dummydata().cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.0),
                      child: Dummydata().cartItems[index]);
                }),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
          ],
        )),
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
