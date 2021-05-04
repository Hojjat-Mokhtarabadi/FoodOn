import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:foodon/core/network_connection/network_connection.dart';
import 'package:foodon/src/data/data_source/remote_data_source.dart';
import 'package:foodon/src/data/repository/remote_data_source_repository.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_popular_foods.dart';
import 'package:foodon/src/domain/usecases/get_special_foods.dart';
import 'package:foodon/src/presentation/ui/pages/home/blocs/home_bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;
void setupLocator() {
  ///  Blocs
  locator.registerFactory(
      () => HomeBloc(getPopularFoods: locator(), getSpecialFoods: locator()));

  ///  Use cases
  locator.registerLazySingleton(() =>
      GetPopularFoods(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      GetSpecialFoods(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() => GetFoodsByCategory(
      repository: locator<RemoteDataSourceRepositoryImpl>()));

  ///  Repository
  locator.registerLazySingleton(() => RemoteDataSourceRepositoryImpl(
      remoteDataSource: locator<RemoteDataSourceImpl>(),
      networkConnection: locator<NetworkConnectionImpl>()));

  ///  DataSource
  locator.registerLazySingleton(() => RemoteDataSourceImpl(client: locator()));

  ///  Packages
  locator.registerLazySingleton(
      () => NetworkConnectionImpl(dataConnectionChecker: locator()));
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
