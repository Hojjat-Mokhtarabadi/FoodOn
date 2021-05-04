import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import 'home_body_sliver.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 7.0,
                      shadowColor: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(5.0)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "جستجو برای غذا یا نوشیدنی ...",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.search_sharp,
                                color: Colors.grey.shade400,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 17.0, vertical: 13)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  PhysicalModel(
                    color: Colors.white,
                    elevation: 8.0,
                    shadowColor: kShadowColor,
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    child: Container(
                      child: SizedBox(
                        height: 48.0,
                        width: 48.0,
                        child: Center(
                          child: SvgPicture.asset(
                              'assets/images/icons/adjust.svg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            Expanded(
              child: HomeBodySliver(),
            ),
            SizedBox(
              height: 8.0,
            )
          ],
        ),
      ),
    );
  }
}
