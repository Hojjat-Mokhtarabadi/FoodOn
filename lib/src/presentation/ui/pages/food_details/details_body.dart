import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/data/models/food/comment_view.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/usecases/get_comments_scores_list.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/comment_card.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/comments_list.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/food_description_text.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/send_comment.dart';
import 'package:foodon/src/presentation/ui/widgets/flush_bar_success.dart';
import 'package:foodon/src/presentation/ui/widgets/loading_progress.dart';
import 'package:foodon/src/presentation/ui/widgets/my_text_button.dart';
import 'package:foodon/src/presentation/ui/widgets/order_count_row.dart';
import 'package:foodon/src/presentation/utils/providers/cart_info.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import 'blocs/get_comments_bloc/get_comments_bloc.dart';
import 'blocs/post_order_bloc/post_order_bloc.dart';

class DetailsBody extends StatefulWidget {
  final Food food;
  final FirebaseFileModel firebaseFileModel;
  final int orderNum;
  final List<CommentView> commentsList;
  final bool found;
  final bool alreadyCommented;
  final bool foodExistsInCart;
  final int commentId;
  DetailsBody({
    this.food,
    this.firebaseFileModel,
    this.orderNum,
    this.commentsList,
    this.found,
    this.foodExistsInCart,
    this.alreadyCommented,
    this.commentId,
  });

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  int _orderNum = 1;
  final _dialogKey = GlobalKey<State>();
  List<CommentView> filteredList;
  String commentText = ' ';
  int initialRate = 3;
  @override
  void initState() {
    super.initState();
    filteredList = widget.commentsList.map((e) {
      if (e.id == widget.commentId) {
        commentText = e.comment;
        initialRate = e.score;
        print(initialRate);
      }
      if (e.comment.isNotEmpty) return e;
    }).toList();
    filteredList = filteredList.reversed.toList();
    _orderNum = widget.orderNum;
    print("in d body");
    print(_orderNum);
  }

  @override
  Widget build(BuildContext context) {
    final cartInfoProv = Provider.of<CartInfoProvider>(context);
    final userInfoProv = Provider.of<UserInfoProvider>(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return;
                },
                child: ListView(
                  // shrinkWrap: true,
                  padding: EdgeInsets.only(
                      left: 35.0, right: 35.0, top: 35.0, bottom: 80.0),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.network(
                          widget.firebaseFileModel.url,
                          fit: BoxFit.cover,
                          //width: SizeConfig.w * 0.8,
                          //height: SizeConfig.h * 0.29,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Text(
                          widget.food.name,
                          style: kHeadingTextStyle.copyWith(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                        Spacer(),
                        Text(
                          '${widget.food.score}',
                          style: kHeadingTextStyle.copyWith(
                              fontSize: 19.0, fontWeight: FontWeight.w800),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      children: [
                        OrdersCountRow(
                          foodId: widget.food.id,
                          orderNumFunction: (num) {
                            _orderNum = num;
                          },
                          initialCount: _orderNum,
                        ),
                        Spacer(),
                        Text(
                          '${widget.food.price}',
                          style: kHeadingTextStyle.copyWith(
                              color: kPrimaryColor, fontSize: 19.0),
                        ),
                        Text(
                          ' تومان',
                          style: kHeadingTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.4,
                    ),
                    SizedBox(height: 10.0),
                    FoodDescriptionText(txt: '${widget.food.detail}'),
                    // Spacer(
                    //   flex: 2,
                    // ),
                    SizedBox(
                      height: 60.0,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            clipBehavior: Clip.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            builder: (context) {
                              return SendComment(
                                alreadyCommented: widget.alreadyCommented,
                                commentId: widget.commentId,
                                commentText: commentText,
                                initialRate: initialRate,
                                cxt: context,
                                popDialog: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          primary: Colors.transparent,
                          side: BorderSide(color: kPrimaryColor, width: 2.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 60.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Container(
                          child: Text(
                            widget.alreadyCommented
                                ? 'ویــرایــش دیــدگــاه'
                                : 'نـوشــتــن دیــدگــاه',
                            style: kFirstGreenTextStyle.copyWith(fontSize: 18),
                          ),
                        )),
                    SizedBox(height: 30.0),
                    Container(
                      child: Center(
                          child: Text(
                        'دیـدگـاه دیــگــران',
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                    SizedBox(height: 5.0),
                    if (widget.found && filteredList.isNotEmpty)
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            filteredList.length > 3 ? 3 : filteredList.length,
                        itemBuilder: (context, index) => CommentCard(
                            commentView: filteredList[index], showAll: false),
                      ),
                    if (!widget.found || filteredList.isEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                          child: Text('دیدگاهی یافت نشد'),
                        ),
                      ),
                    Container(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CommentsListPage(
                                  alreadyCommented: widget.alreadyCommented,
                                  commentId: widget.commentId,
                                  commentText: commentText,
                                  initialRate: initialRate,
                                  topHeaderName: 'دیدگاه دیگران',
                                ),
                              ),
                            );
                            BlocProvider.of<CommentsBloc>(context).add(
                              GetAllCommentsEvent(
                                commentsReq: CommentsReqModel(
                                    foodId: widget.food.id,
                                    userId: userInfoProv.id),
                              ),
                            );
                          },
                          child: Text(
                            'مشـاهـده هـمـه',
                            style: kFirstGreenTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 18.0,
          child: BlocConsumer(
            bloc: BlocProvider.of<SetCartOrderBloc>(context),
            builder: (context, state) {
              return MyTextButton(
                text: widget.foodExistsInCart
                    ? 'ویـــرایـــش  سفـــارش'
                    : 'افــزودن بـه ســبد خــرید ',
                onTap: () {
                  if (widget.foodExistsInCart) {
                    print(_orderNum);
                    if (state is! SetCartOrderLoading)
                      BlocProvider.of<SetCartOrderBloc>(context).add(
                        PutCartOrderEvent(
                          order: CartOrder(
                            (c) => c
                              ..cartId = cartInfoProv.cartId
                              ..foodId = widget.food.id
                              ..count = _orderNum
                              ..price = (_orderNum * widget.food.price),
                          ),
                        ),
                      );
                  } else {
                    if (state is! SetCartOrderLoading) {
                      BlocProvider.of<SetCartOrderBloc>(context).add(
                        PostNewCartOrderEvent(
                          order: CartOrder(
                            (c) => c
                              ..cartId = cartInfoProv.cartId
                              ..foodId = widget.food.id
                              ..count = _orderNum
                              ..price = (_orderNum * widget.food.price),
                          ),
                        ),
                      );
                    }
                  }
                },
              );
            },
            listener: (context, state) {
              if (state is SetCartOrderLoading) {
                showLoadingProgress(
                  context: context,
                  key: _dialogKey,
                );
              } else if (state is SetCartOrderSuccess) {
                Navigator.pop(_dialogKey.currentContext);
                showFlushBar(context: context);
              } else if (state is SetCartOrderError) {
                Navigator.pop(_dialogKey.currentContext);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Error'),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
