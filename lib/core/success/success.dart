import 'package:equatable/equatable.dart';

class Success extends Equatable {
  final properties;
  Success([this.properties = const <dynamic>[]]) : super();
  @override
  List<Object> get props => properties;
}

class AuthenticationSuccess extends Success {}

class PostSuccess extends Success {}

class PutSuccess extends Success {}

class DeleteSuccess extends Success {}
