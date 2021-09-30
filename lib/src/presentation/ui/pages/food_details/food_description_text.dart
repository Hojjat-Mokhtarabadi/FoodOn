import 'package:flutter/material.dart';

class FoodDescriptionText extends StatefulWidget {
  final String txt;
  FoodDescriptionText({this.txt});

  @override
  _FoodDescriptionTextState createState() => _FoodDescriptionTextState();
}

class _FoodDescriptionTextState extends State<FoodDescriptionText> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          showMore = !showMore;
        });
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        child: Text(
          '${widget.txt} ',
          style: TextStyle(fontSize: 14.3),
          textAlign: TextAlign.justify,
          maxLines: showMore ? 20 : 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
