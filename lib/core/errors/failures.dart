import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final properties;
  Failure([this.properties = const <dynamic>[]]) : super();
  @override
  List<Object> get props => properties;
}

class ServerFailure extends Failure {}

class NoConnectionFailure extends Failure {}
