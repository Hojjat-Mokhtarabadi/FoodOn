import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:foodon/core/network_connection/network_connection.dart';
import 'package:foodon/core/validator/validator.dart';
import 'package:foodon/src/data/data_source/remote_data_source.dart';
import 'package:foodon/src/data/repository/remote_data_source_repository_impl.dart';
import 'package:foodon/src/domain/usecases/delete_user.dart';
import 'package:foodon/src/domain/usecases/get_categories_list.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_orders_list.dart';
import 'package:foodon/src/domain/usecases/get_popular_foods.dart';
import 'package:foodon/src/domain/usecases/get_special_foods.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';
import 'package:foodon/src/domain/usecases/get_user_info.dart';
import 'package:foodon/src/domain/usecases/post_new_order.dart';
import 'package:foodon/src/domain/usecases/post_new_user.dart';
import 'package:foodon/src/domain/usecases/put_user_info.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/bloc/orderslist_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/post_order_bloc/post_order_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/blocs/home_bloc/home_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/login/blocs/login_bloc/login_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/log_out_bloc/logout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/sign_up/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'src/presentation/ui/pages/profile/blocs/user_info_bloc/user_info_bloc.dart';

final locator = GetIt.instance;
const kBaseUrl = "3c152798dbd0.ngrok.io";

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
  locator.registerFactory(() => OrdersListBloc(ordersList: locator()));
  locator.registerFactory(() => PostOrderBloc(postNewOrder: locator()));
  locator.registerFactory(() => LoginBloc(getUserAuthentication: locator()));
  locator.registerFactory(() => SignUpBloc(postNewUser: locator()));
  locator.registerFactory(() => LogoutBloc(deleteUser: locator()));
  locator.registerFactory(() => UserInfoBloc(getUserInfo: locator()));
  locator.registerFactory(() => UpdateUserInfoBloc(putUserInfo: locator()));

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
  locator.registerLazySingleton(() =>
      GetOrdersList(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      PostNewOrder(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() => GetUserAuthentication(
      repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(
      () => PostNewUser(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(
      () => PutUserInfo(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(
      () => DeleteUser(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(
      () => GetUserInfo(repository: locator<RemoteDataSourceRepositoryImpl>()));

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

  ///  Others
  locator.registerLazySingleton(() => Validator());
}
