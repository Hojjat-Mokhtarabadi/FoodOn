import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/data/models/food/comment_view.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/get_comments_bloc/get_comments_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/comment_card.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/send_comment.dart';
import 'package:foodon/src/presentation/ui/widgets/errors_alert.dart';
import 'package:foodon/src/presentation/ui/widgets/top_header.dart';

class CommentsListPage extends StatelessWidget {
  final String topHeaderName;
  final bool alreadyCommented;
  final commentId;
  final commentText;
  final initialRate;
  CommentsListPage({
    @required this.topHeaderName,
    this.alreadyCommented,
    this.commentId,
    this.commentText,
    this.initialRate,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: kBackgroundImageBox,
        child: BlocConsumer(
          bloc: BlocProvider.of<CommentsBloc>(context),
          builder: (context, state) {
            if (state is CommentsLoaded) {
              final List<CommentView> reversedCm =
                  state.cm.commentsList.reversed.toList();
              return Stack(alignment: Alignment.bottomCenter, children: [
                Column(
                  children: [
                    TopHeader(
                      headerName: this.topHeaderName,
                    ),
                    SizedBox(height: 10.0),
                    Expanded(
                      child: ListView.builder(
                        //reverse: true,
                        padding: EdgeInsets.all(25.0),
                        itemCount: reversedCm.length,
                        itemBuilder: (context, index) => CommentCard(
                            commentView: reversedCm[index], showAll: true),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20.0,
                  child: ElevatedButton(
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
                              alreadyCommented: alreadyCommented,
                              commentId: commentId,
                              commentText: commentText,
                              initialRate: initialRate,
                              popDialog: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 6.0,
                        primary: kPrimaryColor,
                        side: BorderSide(color: kPrimaryColor, width: 2.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 80.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Container(
                        child: Text(
                          state.cm.alreadyCommented
                              ? 'ویــرایــش دیــدگــاه'
                              : 'نـوشــتــن دیــدگــاه',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )),
                ),
              ]);
            } else if (state is CommentsLoading) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.h * 0.3),
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is CommentsNotFoundError) {
              return Center(
                child: Text('دیدگاهی یافت نشد'),
              );
            }
            return Container();
          },
          listener: (context, state) {
            if (state is CommentsError) {
              print('here');
              showAlertDialog(
                context: context,
                msg: state.message,
                bloc: (c) {
                  // BlocProvider.of<FoodDetailsBloc>(c)
                  //     .add(GetFoodDetailsEvent(foodId: _foodId));
                  Navigator.of(c).pop();
                },
              );
            }
          },
        ),
      ),
    ));
  }
}
