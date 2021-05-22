import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/foods_list.dart';
import 'package:foodon/src/presentation/utils/enums.dart';

import '../../../../../constants.dart';

class CategoryItems extends StatefulWidget {
  final String categoryText;
  final CategoryItemsEnum id;
  final double iconSize;
  final int categId;

  CategoryItems({
    @required this.categoryText,
    @required this.id,
    this.categId = 2,
    this.iconSize = 30.0,
  });
  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => FoodsListPage(
                topHeaderName: widget.categoryText,
                blocEvent:
                    GetFoodsListByCategoryEvent(categoryId: widget.categId),
              ),
            ),
          );
          BlocProvider.of<FoodsListBloc>(context)
              .add(GetFoodsListByCategoryEvent(categoryId: widget.categId));
        },
        child: PhysicalModel(
          color: Colors.white,
          //widget.id == categoryProvider.id ? kPrimaryColor : Colors.white,
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
                      kCategoryIconsAddress[widget.id],
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
                        color: Colors.black
                        // widget.id == categoryProvider.id
                        //     ? Colors.white
                        //     : Colors.black,
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
