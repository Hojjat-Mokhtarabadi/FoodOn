import 'package:flutter/material.dart';
import 'package:foodon/constants.dart';

import 'file:///C:/Users/Hojjat/FlutterProjects/foodon/foodon/lib/src/presentation/utils/dummy%20data.dart';

class FoodsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 28.0, bottom: 15.0, left: 15.0, right: 15.0),
                    child: Text(
                      ' غذا و نوشیدنی',
                      style: kHeadingTextStyle.copyWith(fontSize: 18.0),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5.0,
                          crossAxisSpacing: 5.0,
                          childAspectRatio: 10 / 11,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        itemCount: Dummydata().foodsList.length,
                        itemBuilder: (context, index) {
                          return Dummydata().foodsList[index];
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
