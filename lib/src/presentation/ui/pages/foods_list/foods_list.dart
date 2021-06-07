import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/domain/usecases/get_food_images.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/food_card.dart';
import 'package:foodon/src/presentation/ui/widgets/top_header.dart';

import '../../../../../locator.dart';

class FoodsListPage extends StatefulWidget {
  final blocEvent;
  final String topHeaderName;
  final String path;
  FoodsListPage({
    @required this.blocEvent,
    @required this.topHeaderName,
    @required this.path,
  });

  @override
  _FoodsListPageState createState() => _FoodsListPageState();
}

class _FoodsListPageState extends State<FoodsListPage> {
  GetFoodImages images;
  @override
  void initState() {
    super.initState();
    images = locator<GetFoodImages>();
  }

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
                headerName: this.widget.topHeaderName,
              ),
              SizedBox(height: 10.0),
              FutureBuilder(
                  future: images.getFoodImages(widget.path),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        {
                          return Padding(
                            padding: EdgeInsets.only(top: SizeConfig.h / 3),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      default:
                        if (snapshot.hasError) {
                          return Center(child: Text('Some error occurred!'));
                        } else {
                          final files = snapshot.data;
                          return BlocConsumer(
                            bloc: BlocProvider.of<FoodsListBloc>(context),
                            builder: (context, state) {
                              if (state is FoodsListLoading) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: SizeConfig.h / 3),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else if (state is FoodsListLoaded) {
                                return Expanded(
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 7.0,
                                        crossAxisSpacing: 7.0,
                                        childAspectRatio: 10 / 11,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 19.0, vertical: 2.0),
                                      itemCount: state.foodsList.length,
                                      itemBuilder: (context, index) {
                                        // return Container();
                                        return FoodCard(
                                          food: state.foodsList[index],
                                          foodPic: files[index],
                                        );
                                      }),
                                );
                              } else if (state is FoodsListNotFound) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: SizeConfig.h / 3),
                                  child: Center(
                                    child: Text('لیست غذای مورد نظر یافت نشد'),
                                  ),
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
                                            BlocProvider.of<FoodsListBloc>(
                                                    context)
                                                .add(widget.blocEvent);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          );
                        }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
