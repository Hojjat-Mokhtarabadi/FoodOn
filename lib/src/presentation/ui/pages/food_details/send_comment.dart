import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodon/core/validator/validator.dart';
import 'package:foodon/size_config.dart';
import 'package:foodon/src/data/models/food/comment.dart';
import 'package:foodon/src/data/models/food/score.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/comment_bloc/comment_bloc.dart';
import 'package:foodon/src/presentation/ui/widgets/flush_bar_success.dart';
import 'package:foodon/src/presentation/ui/widgets/loading_progress.dart';
import 'package:foodon/src/presentation/utils/providers/food_info.dart';
import 'package:foodon/src/presentation/utils/providers/user_info.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../locator.dart';

class SendComment extends StatefulWidget {
  final Function() popDialog;
  final bool alreadyCommented;
  final commentId;
  final commentText;
  final int initialRate;
  final BuildContext cxt;
  SendComment(
      {this.popDialog,
      this.alreadyCommented,
      this.commentId,
      this.commentText,
      this.cxt,
      this.initialRate});
  @override
  _SendCommentState createState() => _SendCommentState();
}

class _SendCommentState extends State<SendComment> {
  TextEditingController _commentController;
  final _dialogKey = GlobalKey<State>();
  final _formKey = GlobalKey<FormState>();
  Validator _validator;
  double rate;
  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController(text: widget.commentText);
    _validator = locator<Validator>();
    rate = 3;
    print(widget.initialRate);
  }

  @override
  void dispose() {
    super.dispose();
    _commentController.clear();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context: context);
    final foodInfoProv = Provider.of<FoodInfoProvider>(context);
    final userInfoProv = Provider.of<UserInfoProvider>(context);
    final _userId = userInfoProv.id;
    final _foodId = foodInfoProv.id;
    return BlocConsumer(
      bloc: BlocProvider.of<CommentBloc>(context),
      builder: (context, state) => Stack(
        clipBehavior: Clip.none,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              //height: SizeConfig.h * 0.65,
              child: ListView(
                //mainAxisSize: MainAxisSize.min,
                shrinkWrap: true,
                padding: EdgeInsets.all(25.0),
                children: [
                  Text(
                    'امتیاز من',
                    style: TextStyle(fontSize: 19),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: RatingBar.builder(
                        initialRating: widget.initialRate.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemSize: 33,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          rate = rating;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'دیدگاه من',
                    style: TextStyle(fontSize: 19),
                  ),
                  SizedBox(height: 10.0),
                  Form(
                    key: _formKey,
                    child: Container(
                      //height: SizeConfig.h * 0.35,
                      child: TextFormField(
                        controller: _commentController,
                        maxLines: 5,
                        validator: _validator.validateEmptyFields,
                        // minLines: null,
                        // expands: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        if (widget.alreadyCommented) {
                          BlocProvider.of<CommentBloc>(context).add(
                            PutCommentScoreEvent(
                              score: Score(
                                (c) => c
                                  ..score = rate.toInt()
                                  ..foodId = foodInfoProv.id
                                  ..customerId = userInfoProv.id,
                              ),
                              comment: Comment(
                                (c) => c
                                  ..id = widget.commentId
                                  ..comment = _commentController.text
                                  ..foodId = foodInfoProv.id
                                  ..customerId = userInfoProv.id
                                  ..date = DateTime.now().toUtc(),
                              ),
                            ),
                          );
                        } else {
                          BlocProvider.of<CommentBloc>(context).add(
                            PostNewCommentScoreEvent(
                              score: Score(
                                (c) => c
                                  ..score = rate.toInt()
                                  ..foodId = foodInfoProv.id
                                  ..customerId = userInfoProv.id,
                              ),
                              comment: Comment(
                                (c) => c
                                  ..comment = _commentController.text
                                  ..foodId = foodInfoProv.id
                                  ..customerId = userInfoProv.id
                                  ..date = DateTime.now().toUtc(),
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      margin: EdgeInsets.symmetric(horizontal: 70.0),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          'ثـبـت',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                      // width: 35.0,
                      // height: 35.0,
                    ),
                  ),
                ],
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.end,
              ),
            ),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Icon(
                FontAwesomeIcons.times,
                color: Colors.white,
                size: 18.0,
              ),
              width: 30.0,
              height: 30.0,
            ),
            top: -15.0,
            left: SizeConfig.w * 0.455,
          ),
        ],
      ),
      listener: (context, state) {
        if (state is CommentLoading) {
          // _commentController.dispose();
          showLoadingProgress(
            context: widget.cxt,
            key: _dialogKey,
          );
          widget.popDialog();
        } else if (state is CommentError) {
          Navigator.pop(_dialogKey.currentContext);

          showDialog(
              context: context,
              builder: (context) {
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
                return AlertDialog(
                  title: Text('Error'),
                );
              });
        } else if (state is CommentSuccess) {
          _commentController.clear();
          widget.popDialog();
          Navigator.pop(_dialogKey.currentContext);

          // BlocProvider.of<FoodDetailsBloc>(context).add(
          //   GetFoodDetailsEvent(
          //       fdReq: FoodDetailsReqModel(userId: _userId, foodId: _foodId)),
          // );
          // BlocProvider.of<CommentsBloc>(context).add(GetAllCommentsEvent(
          //     commentsReq: CommentsReqModel(foodId: _foodId, userId: _userId)));
          Future.delayed(Duration(seconds: 1), () {
            showFlushBar(context: context);
          });
        }
      },
    );
  }
}
