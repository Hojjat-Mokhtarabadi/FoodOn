import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sizer/sizer.dart';

import '../../../../constants.dart';

class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            // CommentCard(),
            TextButton(
                onPressed: () {
                  //intl.Intl.defaultLocale = 'fa';
                  intl.DateFormat format = intl.DateFormat.yMd('fa_IR');
                  //DateTime time =
                  //
                  // DateTime time = format.format(DateTime.now());
                  // time.toLocal();
                  // print(time);
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
                        return Sizer(
                          builder: (context, orientation, deviceType) => Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                  height: 70.h,
                                  child: ListView(
                                    //mainAxisSize: MainAxisSize.min,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(25.0),
                                    children: [
                                      Text(
                                        'امتیاز من',
                                        style: TextStyle(fontSize: 14.sp),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            itemSize: 28.sp,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        'دیدگاه من',
                                        style: TextStyle(fontSize: 14.sp),
                                      ),
                                      SizedBox(height: 10.0),
                                      Container(
                                        height: 32.h,
                                        child: TextFormField(
                                          maxLines: null,
                                          minLines: null,
                                          expands: true,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Container(
                                        decoration:
                                            BoxDecoration(color: kPrimaryColor),
                                        child: Icon(
                                          FontAwesomeIcons.comment,
                                          color: Colors.white,
                                        ),
                                        width: 35.0,
                                        height: 35.0,
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
                                left: 45.w,
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  child: Text(
                    'click me',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )),
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('محصول'),
                Text('تعداد'),
                Text('فی'),
                Text('مجموع'),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            // CartOrders(
            //     cartOrder: CartOrdersView((c) => c
            //       ..count = 2
            //       ..price = 65
            //       ..name = 'sadf')),
          ],
        ),
      ),
    ));
  }
}
