import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/foods_list.dart';

import '../../../../../constants.dart';
import 'dummy data.dart';

const double kSliverListTopDownPadding = 20.0;

class HomeBodySliver extends StatefulWidget {
  @override
  _HomeBodySliverState createState() => _HomeBodySliverState();
}

class _HomeBodySliverState extends State<HomeBodySliver> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 15.0,
                  children: Dummydata().categoryList),
            ),
          ),
        ),
        SliverToBoxAdapter(child: _buildShowMore('غذاهای محبوب')),
        buildSliverPadding(),
        SliverPadding(
          padding: EdgeInsets.only(top: kSliverListTopDownPadding),
          sliver: SliverToBoxAdapter(
            child: Divider(
              color: Colors.black,
              thickness: 0.5,
              indent: 30.0,
              endIndent: 30.0,
            ),
          ),
        ),
        SliverToBoxAdapter(child: _buildShowMore('پیشنهاد ویژه')),
        buildSliverPadding()
      ],
    );
  }

  Widget _buildShowMore(String txt) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20.0, right: 20.0, top: kSliverListTopDownPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodsListPage(),
            ),
          );
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

  SliverToBoxAdapter buildSliverPadding() {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        //padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: Dummydata().foodsList,
        ),
      ),
    );
  }
}
