import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:foodon/core/network_connection/network_connection.dart';
import 'package:foodon/core/validator/validator.dart';
import 'package:foodon/src/data/data_source/firebase_storage.dart';
import 'package:foodon/src/data/data_source/remote_data_source.dart';
import 'package:foodon/src/data/repository/remote_data_source_repository_impl.dart';
import 'package:foodon/src/domain/usecases/clear_cart.dart';
import 'package:foodon/src/domain/usecases/delete_cart_order.dart';
import 'package:foodon/src/domain/usecases/delete_user.dart';
import 'package:foodon/src/domain/usecases/get_bill_details.dart';
import 'package:foodon/src/domain/usecases/get_categories_list.dart';
import 'package:foodon/src/domain/usecases/get_comments_scores_list.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:foodon/src/domain/usecases/get_food_image_by_id.dart';
import 'package:foodon/src/domain/usecases/get_food_images.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_orders_list.dart';
import 'package:foodon/src/domain/usecases/get_popular_foods.dart';
import 'package:foodon/src/domain/usecases/get_special_foods.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';
import 'package:foodon/src/domain/usecases/get_user_bills.dart';
import 'package:foodon/src/domain/usecases/get_user_info.dart';
import 'package:foodon/src/domain/usecases/post_new_bill.dart';
import 'package:foodon/src/domain/usecases/post_new_bill_orders.dart';
import 'package:foodon/src/domain/usecases/post_new_comment.dart';
import 'package:foodon/src/domain/usecases/post_new_order.dart';
import 'package:foodon/src/domain/usecases/post_new_score.dart';
import 'package:foodon/src/domain/usecases/post_new_user.dart';
import 'package:foodon/src/domain/usecases/put_cart_order.dart';
import 'package:foodon/src/domain/usecases/put_comment.dart';
import 'package:foodon/src/domain/usecases/put_score.dart';
import 'package:foodon/src/domain/usecases/put_user_info.dart';
import 'package:foodon/src/presentation/ui/pages/bill/bloc/bill_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/check_out_bloc/checkout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/delete_cart_order/delete_cart_order_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/cart/blocs/get_orders_bloc/orderslist_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/comment_bloc/comment_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/food_details_bloc/food_details_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/get_comments_bloc/get_comments_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/food_details/blocs/post_order_bloc/post_order_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/foods_list/blocs/foods_list_bloc/foods_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/home/blocs/home_bloc/home_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/login/blocs/login_bloc/login_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/my_orders/bloc/bills_list_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/log_out_bloc/logout_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/profile/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:foodon/src/presentation/ui/pages/sign_up/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'src/presentation/ui/pages/profile/blocs/user_info_bloc/user_info_bloc.dart';

final locator = GetIt.instance;
const kBaseUrl = "d9e0665f0578.ngrok.io";
const kHeader = {
  "Accept": "application/json",
  "content-type": "application/json"
};

void setupLocator() {
  ///  Blocs
  //! home
  locator.registerFactory(() => HomeBloc(
      getPopularFoods: locator(),
      getSpecialFoods: locator(),
      getCategoriesList: locator()));
  locator.registerFactory(() => FoodsListBloc(
      getFoodsByCategory: locator(),
      getSpecialFoods: locator(),
      getPopularFoods: locator()));
  //! food details
  locator.registerFactory(() => FoodDetailsBloc(getFoodDetails: locator()));
  //! cart orders
  locator.registerFactory(() => OrdersListBloc(ordersList: locator()));
  locator.registerFactory(
      () => SetCartOrderBloc(postNewOrder: locator(), putCartOrder: locator()));
  locator
      .registerFactory(() => DeleteCartOrderBloc(deleteCartOrder: locator()));
  //! bill
  locator.registerFactory(() => CheckoutBloc(
      postNewBillOrders: locator(),
      postNewBill: locator(),
      clearCart: locator()));
  locator.registerFactory(() => BillDetailsBloc(getBillDetails: locator()));
  locator.registerFactory(() => BillsListBloc(getUserBills: locator()));
  //! user
  locator.registerFactory(() => LoginBloc(getUserAuthentication: locator()));
  locator.registerFactory(() => SignUpBloc(postNewUser: locator()));
  locator.registerFactory(() => LogoutBloc(deleteUser: locator()));
  locator.registerFactory(() => UserInfoBloc(getUserInfo: locator()));
  locator.registerFactory(() => UpdateUserInfoBloc(putUserInfo: locator()));
  //! comment score
  locator.registerFactory(() => CommentsBloc(getCommentsScoresList: locator()));
  locator.registerFactory(() => CommentBloc(
        postNewComment: locator(),
        postNewScore: locator(),
        putComment: locator(),
        putScore: locator(),
      ));

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
  locator.registerLazySingleton(() =>
      DeleteCartOrder(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      PutCartOrder(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(
      () => ClearCart(repository: locator<RemoteDataSourceRepositoryImpl>()));
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
  locator.registerLazySingleton(() =>
      PostNewComment(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      PostNewScore(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(
      () => PutComment(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(
      () => PutScore(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() => GetCommentsScoresList(
      repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(
      () => PostNewBill(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      PostNewBillOrders(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      GetUserBills(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      GetBillDetails(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      GetFoodImages(repository: locator<RemoteDataSourceRepositoryImpl>()));
  locator.registerLazySingleton(() =>
      GetFoodImageById(repository: locator<RemoteDataSourceRepositoryImpl>()));

  ///  Repository
  locator.registerLazySingleton(() => RemoteDataSourceRepositoryImpl(
      remoteDataSource: locator<RemoteDataSourceImpl>(),
      networkConnection: locator<NetworkConnectionImpl>(),
      firebaseStorageApi: locator<FirebaseStorageApiImpl>()));

  ///  DataSource
  locator.registerLazySingleton(
      () => RemoteDataSourceImpl(client: locator(), baseUrl: kBaseUrl));
  locator.registerLazySingleton(() => FirebaseStorageApiImpl());

  ///  Packages
  locator.registerLazySingleton(
      () => NetworkConnectionImpl(dataConnectionChecker: locator()));
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
  // locator.registerLazySingleton(
  //     () => Dio(BaseOptions(baseUrl: kBaseUrl, headers: kHeader)));

  ///  Others
  locator.registerLazySingleton(() => Validator());
}
