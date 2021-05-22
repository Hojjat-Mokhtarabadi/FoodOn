import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/errors_alert.dart';
import 'package:foodon/src/presentation/ui/widgets/order_count_row.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _foodId;
  int _orderNum;
  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        decoration: kBackgroundImageBox,
        child: SafeArea(
          child: BlocConsumer(
            bloc: BlocProvider.of<FoodDetailsBloc>(context),
            builder: (context, state) {
              if (state is FoodDetailsLoaded) {
                _foodId = state.food.id;
                return Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView(
                        // shrinkWrap: true,
                        padding:
                            EdgeInsets.only(left: 35.0, right: 35.0, top: 35.0),
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/images/food_images/burger.jpg',
                              fit: BoxFit.cover,
                              width: SizeConfig.width * 0.8,
                              height: SizeConfig.height * 0.29,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Row(
                            children: [
                              Text(
                                state.food.name,
                                style: kHeadingTextStyle.copyWith(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w800),
                              ),
                              Spacer(),
                              Text(
                                '${state.food.score}',
                                style: kHeadingTextStyle.copyWith(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w800),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            children: [
                              OrdersCountRow(
                                foodId: state.food.id,
                                orderNumFunction: (num) {
                                  _orderNum = num;
                                },
                              ),
                              Spacer(),
                              Text(
                                '${state.food.price}',
                                style: kHeadingTextStyle.copyWith(
                                    color: kPrimaryColor),
                              ),
                              Text(
                                ' تومان',
                                style: kHeadingTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 0.4,
                          ),
                          SizedBox(height: 10.0),
                          Text('${state.food.detail}'),
                          // Spacer(
                          //   flex: 2,
                          // ),
                          SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ),
                    ),
                    //Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                          onPressed: () {
                            //BlocProvider.of<PostOrderBloc>(context).add(PostNewOrderEvent(order: new Order()));
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 8.0),
                            backgroundColor: kDarkerPrimaryColor,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          child: Text(
                            'افزودن به سبد خرید ',
                            style:
                                kHeadingTextStyle.copyWith(color: Colors.white),
                          )),
                    ),
                    SizedBox(height: 20.0)
                  ],
                );
              } else if (state is FoodDetailsLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Container();
            },
            listener: (BuildContext context, state) {
              if (state is FoodDetailsError) {
                print('here');
                showAlertDialog(
                  context: context,
                  msg: state.msg,
                  bloc: (c) {
                    BlocProvider.of<FoodDetailsBloc>(c)
                        .add(GetFoodDetailsEvent(foodId: _foodId));
                    Navigator.of(c).pop();
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
