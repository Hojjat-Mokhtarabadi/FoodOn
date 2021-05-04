import 'package:flutter/material.dart';
import 'package:foodon/src/presentation/ui/pages/home/dummy%20data.dart';

class FoodsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: Dummydata().foodsList.length,
              itemBuilder: (context, index) {
                return Dummydata().foodsList[index];
              }),
        ),
      ),
    );
  }
}
