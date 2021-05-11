import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:foodon/core/network_connection/network_connection.dart';
import 'package:foodon/src/data/data_source/remote_data_source.dart';
import 'package:foodon/src/data/repository/remote_data_source_repository_impl.dart';
import 'package:foodon/src/domain/usecases/get_categories_list.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_popular_foods.dart';
import 'package:foodon/src/domain/usecases/get_special_foods.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/blocs/home_bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;
const kBaseUrl = "bb896a6ba08d.ngrok.io";

void setupLocator() {
  ///  Blocs
  locator.registerFactory(() => HomeBloc(
      getPopularFoods: locator(),
      getSpecialFoods: locator(),
      getCategoriesList: locator()));
  locator.registerFactory(() => FoodsListBloc(
      getFoodsByCategory: locator(),
      getSpecialFoods: locator(),
      getPopularFoods: locator()));
  locator.registerFactory(() => FoodDetailsBloc(getFoodDetails: locator()));

  ///  Use cases
  locator.registerLazySingleton(() =>
      GetPopularFoods(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      GetSpecialFoods(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() => GetFoodsByCategory(
      repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      GetFoodDetails(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      GetCategoriesList(repository: locator<RemoteDataSourceRepositoryImpl>()));

  ///  Repository
  locator.registerLazySingleton(() => RemoteDataSourceRepositoryImpl(
      remoteDataSource: locator<RemoteDataSourceImpl>(),
      networkConnection: locator<NetworkConnectionImpl>()));

  ///  DataSource
  locator.registerLazySingleton(
      () => RemoteDataSourceImpl(client: locator(), baseUrl: kBaseUrl));

  ///  Packages
  locator.registerLazySingleton(
      () => NetworkConnectionImpl(dataConnectionChecker: locator()));
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
