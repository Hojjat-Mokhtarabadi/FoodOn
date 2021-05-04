import 'package:flutter/material.dart';
import 'package:foodon/src/presentation/ui/pages/home/providers/category_items_provider.dart';
import 'package:foodon/src/presentation/utils/enums.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';

class CategoryItems extends StatefulWidget {
  final String categoryText;
  final CategoryItemsEnum id;
  final double iconSize;

  CategoryItems({
    @required this.categoryText,
    @required this.id,
    this.iconSize = 30.0,
  });
  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryItemsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          categoryProvider.setId(widget.id);
        },
        child: PhysicalModel(
          color:
              widget.id == categoryProvider.id ? kPrimaryColor : Colors.white,
          elevation: 7.0,
          shadowColor: kShadowColor,
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 60.0,
            width: 42.0,
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      kIconsAddress[widget.id],
                      height: widget.iconSize,
                      width: widget.iconSize,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    widget.categoryText,
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w400,
                      color: widget.id == categoryProvider.id
                          ? Colors.white
                          : Colors.black,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
