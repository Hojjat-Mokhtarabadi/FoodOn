import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodon/constants.dart';

class DetailsPage extends StatefulWidget {
  final double price;
  final double name;
  final double score;
  final double description;
  final double image;

  const DetailsPage({
    Key key,
    @required this.price,
    @required this.name,
    @required this.score,
    @required this.description,
    @required this.image,
  }) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int orderNum = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: kBackgroundImageBox,
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/images/food_images/burger.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Text(
                      'تریپل برگر مخصوص',
                      style: kHeadingTextStyle.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.w800),
                    ),
                    Spacer(),
                    Text(
                      '4.5',
                      style: kHeadingTextStyle.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.w800),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                SizedBox(height: 45.0),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add),
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.symmetric(horizontal: 3.0),
                      splashRadius: 17.0,
                      onPressed: () {
                        setState(() {
                          orderNum++;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.0),
                      child: Text(
                        '$orderNum',
                        style: kHeadingTextStyle.copyWith(fontSize: 17.0),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.minus,
                        size: 18.0,
                      ),
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.symmetric(horizontal: 3.0),
                      splashRadius: 17.0,
                      onPressed: () {
                        setState(() {
                          if (orderNum > 1) orderNum--;
                        });
                      },
                    ),
                    Spacer(),
                    Text(
                      '63000',
                      style: kHeadingTextStyle.copyWith(color: kPrimaryColor),
                    ),
                    Text(
                      ' تومان',
                      style: kHeadingTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.4,
                ),
                SizedBox(height: 10.0),
                Text(
                    'آشپزی یکی از هنرهایی است که عاشق های فراوانی دارد و بر خلاف اینکه همه فکر می کنند خانم ها آشپزهای ماهری هستند، بزرگترین سرآشپزهای جهان آقا هستند و تعداد آشپزهای حرفه ای مرد بیشتر از زن می باشد. در این مطلب متن هایی را آماده کرده ایم که می توانیم در مورد غذا و آشپزی در شبکه های اجتماعی زیر تصاویر غذای خود منتشر کنید یا اینکه اگر در پیج خود در مورد غذاها مطلب ارسال می کنید، می توانید از این تکست های زیبا برای بیو پروفایل خود استفاده کنید'),
                // Spacer(
                //   flex: 2,
                // ),
                SizedBox(
                  height: 60.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 8.0),
                        backgroundColor: kDarkerPrimaryColor,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      child: Text(
                        'افزودن به سبد خرید ',
                        style: kHeadingTextStyle.copyWith(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
