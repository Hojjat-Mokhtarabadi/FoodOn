import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/foods_list.dart';
import 'package:foodon/src/presentation/ui/pages/home/blocs/home_bloc/home_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/top_search_bar.dart';
import 'package:foodon/src/presentation/ui/widgets/food_card.dart';
import 'package:foodon/src/presentation/utils/dummy%20data.dart';

import '../../../../../constants.dart';
import 'home_body_sliver.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Container(
            //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TopSearchBar(),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Expanded(
                    child: CustomScrollView(
                      //shrinkWrap: true,
                      //physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Center(
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 15.0,
                                  children: Dummydata().categoryList),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: _buildShowMore(
                                'غذاهای محبوب', GetPopularFoodsListEvent())),
                        _buildFoodsList(foods: state.popularFoodsList),
                        SliverPadding(
                          padding:
                              EdgeInsets.only(top: kSliverListTopDownPadding),
                          sliver: SliverToBoxAdapter(
                            child: Divider(
                              color: Colors.black,
                              thickness: 0.5,
                              indent: 30.0,
                              endIndent: 30.0,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: _buildShowMore(
                                'پیشنهاد ویژه', GetSpecialFoodsListEvent())),
                        _buildFoodsList(foods: state.specialFoodsList),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 20.0,
                  // )
                ],
              ),
            ),
          );
        } else if (state is HomeLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is HomeError) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(state.message),
                actions: <Widget>[
                  TextButton(
                    child: Text('تلاش دوباره'),
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(GetHomeItemsEvent());
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

  Widget _buildShowMore(String txt, FoodsListEvent bloc) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20.0, right: 20.0, top: kSliverListTopDownPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodsListPage(
                blocEvent: bloc,
              ),
            ),
          );
          BlocProvider.of<FoodsListBloc>(context).add(bloc);
        },
        child: Row(
          children: [
            Text(
              txt,
              style: kHeadingTextStyle,
            ),
            Spacer(),
            Text('مشاهده همه', style: kFirstGreenTextStyle),
            Icon(Icons.keyboard_arrow_left)
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildFoodsList({List<Food> foods}) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        //padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView.builder(
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          //physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          itemCount: foods.length < 5 ? foods.length : 5,
          itemBuilder: (context, index) {
            return FoodCard(
              food: foods[index],
              foodPic: 'assets/images/food_images/pizza3.jpg',
            );
          },
        ),
      ),
    );
  }
}
