import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/food_card.dart';
import 'package:foodon/src/presentation/ui/widgets/top_header.dart';

class FoodsListPage extends StatelessWidget {
  final blocEvent;
  final String topHeaderName;
  FoodsListPage({@required this.blocEvent, @required this.topHeaderName});
  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kBackgroundImageBox,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopHeader(
                headerName: this.topHeaderName,
              ),
              SizedBox(height: 10.0),
              BlocConsumer(
                bloc: BlocProvider.of<FoodsListBloc>(context),
                builder: (context, state) {
                  if (state is FoodsListLoading) {
                    return Padding(
                      padding: EdgeInsets.only(top: SizeConfig.height / 3),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is FoodsListLoaded) {
                    return Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0,
                            childAspectRatio: 10 / 11,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          itemCount: state.foodsList.length,
                          itemBuilder: (context, index) {
                            // return Container();
                            return FoodCard(
                              food: state.foodsList[index],
                              foodPic: 'assets/images/food_images/pizza3.jpg',
                            );
                          }),
                    );
                  }
                  return Container();
                },
                listener: (context, state) {
                  if (state is FoodsListError) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(state.message),
                          actions: <Widget>[
                            TextButton(
                              child: Text('تلاش دوباره'),
                              onPressed: () {
                                BlocProvider.of<FoodsListBloc>(context)
                                    .add(blocEvent);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
