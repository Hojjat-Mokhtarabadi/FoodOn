library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Food,
  FoodsList,
])
final Serializers serializers = _$serializers;
