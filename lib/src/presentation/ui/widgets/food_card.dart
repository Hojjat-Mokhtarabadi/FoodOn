import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/details_page.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

import '../../../../constants.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final String foodPic;

  FoodCard({
    @required this.food,
    this.foodPic,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => DetailsPage(),
            ),
          );
          BlocProvider.of<FoodDetailsBloc>(context)
              .add(GetFoodDetailsEvent(foodId: this.food.id));
        },
        // style: TextButton.styleFrom(
        //   padding: EdgeInsets.zero,
        //   elevation: 0.0,
        //   textStyle: TextStyle(color: Colors.black),
        // ),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 5.0,
          shadowColor: kShadowColor,
          borderRadius: BorderRadius.circular(8.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: 150,
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.9)
                                  ],
                                ).createShader(Rect.fromLTRB(
                                    0, 0, rect.width, rect.height));
                              },
                              blendMode: BlendMode.darken,
                              child: Image.asset(
                                foodPic,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 5.0,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.0, vertical: 2.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${this.food.score} ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800),
                                        ),
                                        SvgPicture.asset(
                                          'assets/images/icons/star.svg',
                                          height: 12.0,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 65.0,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.food.name,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SvgPicture.asset('assets/images/icons/plus.svg'),
                            Image.asset(
                              kImagesAddress[ImageAddresses.add],
                              width: 25.0,
                            ),
                            Spacer(),
                            Text(
                              '${this.food.price}',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            Text(" تومان"),
                          ],
                        ),
                      ],
                    ),
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
