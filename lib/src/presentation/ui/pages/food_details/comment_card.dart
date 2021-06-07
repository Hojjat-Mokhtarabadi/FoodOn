import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/src/data/models/food/comment_view.dart';
import 'package:shamsi_date/extensions.dart';

class CommentCard extends StatefulWidget {
  final bool showAll;
  final CommentView commentView;
  CommentCard({this.showAll = true, @required this.commentView});

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  Jalali j;
  @override
  void initState() {
    super.initState();
    j = Jalali.fromDateTime(widget.commentView.date);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${widget.commentView.fname} ${widget.commentView.lname}',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: RatingBar.builder(
                    initialRating: widget.commentView.score.toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.2),
                    itemSize: 14,
                    ignoreGestures: true,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  '${j.year}/${j.month}/${j.day}',
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              child: Text(
                '${widget.commentView.comment}',
                maxLines: !widget.showAll ? 2 : 10,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
