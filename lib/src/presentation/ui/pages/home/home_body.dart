import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/usecases/get_food_image_by_id.dart';
import 'package:foodon/src/domain/usecases/get_food_images.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/foods_list.dart';
import 'package:foodon/src/presentation/ui/pages/home/blocs/home_bloc/home_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/category_items.dart';
import 'package:foodon/src/presentation/ui/pages/home/top_search_bar.dart';
import 'package:foodon/src/presentation/ui/widgets/errors_alert.dart';
import 'package:foodon/src/presentation/ui/widgets/food_card.dart';

import '../../../../../constants.dart';
import '../../../../../locator.dart';
import 'home_body_sliver.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  GetFoodImageById images;
  GetFoodImages fimages;
  @override
  void initState() {
    super.initState();
    images = locator<GetFoodImageById>();
    fimages = locator<GetFoodImages>();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return BlocConsumer(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (context, state) {
        if (state is HomeLoaded) {
          // List<int> ids = state.popularFoodsList.map((e) => e.id).toList();
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
                                children: state.categoriesList.map((e) {
                                  String path = '';
                                  switch (e.id) {
                                    case 1:
                                      path = 'kebab/';
                                      break;
                                    case 2:
                                      path = 'sandwich/';
                                      break;
                                    case 3:
                                      path = 'salad/';
                                      break;
                                    case 4:
                                      path = 'traditional/';
                                      break;
                                    default:
                                      path = '';
                                  }
                                  return CategoryItems(
                                    categoryText: e.categoryName,
                                    categId: e.id,
                                    path: path,
                                  );
                                }).toList(),
                              ),
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
                              color: Colors.grey.withOpacity(0.8),
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
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is HomeError) {
          //Container();
          showAlertDialog(
              context: context,
              msg: state.message,
              bloc: (c) {
                BlocProvider.of<HomeBloc>(c).add(GetHomeItemsEvent());
                Navigator.of(c).pop();
              });
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
            CupertinoPageRoute(
              builder: (context) => FoodsListPage(
                blocEvent: bloc,
                path: 'foodImages/',
                topHeaderName: txt,
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
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 3.0),
          itemCount: foods.length < 5 ? foods.length : 5,
          itemBuilder: (context, index) {
            return FoodCard(
              food: foods[index],
            );
          },
        ),
      ),
    );
  }
}

// Container(
// //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
// child: Directionality(
// textDirection: TextDirection.rtl,
// child: Column(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 25.0),
// child: TopSearchBar(),
// ),
// SizedBox(
// height: 18.0,
// ),
// Expanded(
// child: CustomScrollView(
// //shrinkWrap: true,
// //physics: BouncingScrollPhysics(),
// slivers: [
// SliverToBoxAdapter(
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 15.0),
// child: Center(
// child: Wrap(
// direction: Axis.horizontal,
// spacing: 15.0,
// children:
// state.categoriesList.map((e) {
// String path = '';
// switch (e.id) {
// case 1:
// path = 'kebab/';
// break;
// case 2:
// path = 'sandwich/';
// break;
// case 3:
// path = 'salad/';
// break;
// case 4:
// path = 'traditional/';
// break;
// default:
// path = '';
// }
// return CategoryItems(
// categoryText: e.categoryName,
// categId: e.id,
// path: path,
// );
// }).toList(),
// ),
// ),
// ),
// ),
// SliverToBoxAdapter(
// child: _buildShowMore('غذاهای محبوب',
// GetPopularFoodsListEvent())),
// _buildFoodsList(
// foods: state.popularFoodsList,
// foodImage: files),
// SliverPadding(
// padding: EdgeInsets.only(
// top: kSliverListTopDownPadding),
// sliver: SliverToBoxAdapter(
// child: Divider(
// color: Colors.grey.withOpacity(0.8),
// thickness: 0.5,
// indent: 30.0,
// endIndent: 30.0,
// ),
// ),
// ),
// SliverToBoxAdapter(
// child: _buildShowMore('پیشنهاد ویژه',
// GetSpecialFoodsListEvent())),
// _buildFoodsList(
// foods: state.specialFoodsList,
// foodImage: files),
// ],
// ),
// ),
// // SizedBox(
// //   height: 20.0,
// // )
// ],
// ),
// ),
// );
