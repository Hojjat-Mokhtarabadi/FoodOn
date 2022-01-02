import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/usecases/get_comments_scores_list.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/get_comments_bloc/get_comments_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/details_body.dart';
import 'package:foodon/src/presentation/utils/providers/food_info.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final int foodId;
  final int initialCount;
  final FirebaseFileModel firebaseFileModel;
  DetailsPage({
    @required this.foodId,
    this.initialCount = 1,
    @required this.firebaseFileModel,
  });
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _foodId;
  int _userId;
  int _orderNum;
  double _price = 0.0;
  @override
  void initState() {
    super.initState();
    _orderNum = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    final foodInfoProv = Provider.of<FoodInfoProvider>(context);
    final userInfoProv = Provider.of<UserInfoProvider>(context);
    _foodId = foodInfoProv.id;
    _price = foodInfoProv.price;
    _userId = userInfoProv.id;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        decoration: kBackgroundImageBox,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<FoodDetailsBloc>(context).add(
                GetFoodDetailsEvent(
                    fdReq:
                        FoodDetailsReqModel(userId: _userId, foodId: _foodId)),
              );
              BlocProvider.of<CommentsBloc>(context).add(GetAllCommentsEvent(
                  commentsReq:
                      CommentsReqModel(foodId: _foodId, userId: _userId)));
            },
            child: Stack(
              children: [
                ListView(),
                BlocBuilder(
                  bloc: BlocProvider.of<CommentsBloc>(context),
                  builder: (context, commentState) => BlocConsumer(
                    bloc: BlocProvider.of<FoodDetailsBloc>(context),
                    builder: (context, foodState) {
                      if (foodState is FoodDetailsLoaded &&
                          commentState is CommentsLoaded) {
                        print(_orderNum);
                        return DetailsBody(
                          food: foodState.food.foodDetails,
                          firebaseFileModel: widget.firebaseFileModel,
                          orderNum: _orderNum,
                          foodExistsInCart: foodState.food.existsInCart,
                          commentsList: commentState.cm.commentsList,
                          found: true,
                          alreadyCommented: commentState.cm.alreadyCommented,
                          commentId: commentState.cm.commentId,
                        );
                      } else if (foodState is FoodDetailsLoaded &&
                          commentState is CommentsNotFoundError) {
                        print('here in fl c n f');
                        return DetailsBody(
                          food: foodState.food.foodDetails,
                          firebaseFileModel: widget.firebaseFileModel,
                          orderNum: _orderNum,
                          foodExistsInCart: foodState.food.existsInCart,
                          commentsList: [],
                          found: false,
                          alreadyCommented: false,
                          commentId: 0,
                        );
                      } else if (foodState is FoodDetailsLoading ||
                          commentState is CommentsLoading) {
                        print('here in ld');
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Container();
                    },
                    listener: (context, foodState) {
                      if (foodState is FoodDetailsError ||
                          commentState is CommentsError) {
                        print('error');
                      }
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

//   } else if (state is GetCommentsLoading) {
//     return Center(child: CircularProgressIndicator());
//   }
//   return Container();
// },
// listener: (BuildContext context, state) {
//   if (state is GetCommentsError) {
//     print('here');
//     showAlertDialog(
//       context: context,
//       msg: state.message,
//       bloc: (c) {
//         BlocProvider.of<FoodDetailsBloc>(c)
//             .add(GetFoodDetailsEvent(foodId: _foodId));
//         Navigator.of(c).pop();
//       },
//     );
//   }
// },
