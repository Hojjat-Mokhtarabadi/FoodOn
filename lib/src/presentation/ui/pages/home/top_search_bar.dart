import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

import '../../../../../constants.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 17.0, vertical: 13)),
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
                child: SvgPicture.asset(kImageAddress[ImageAddresses.adjust]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
