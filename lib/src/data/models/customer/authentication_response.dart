library authentication_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/customer/customer.dart';

import '../serializers.dart';

part 'authentication_response.g.dart';

abstract class AuthenticationResponse
    implements Built<AuthenticationResponse, AuthenticationResponseBuilder> {
  // fields go here
  Customer get userInfo;

  int get cartId;

  AuthenticationResponse._();

  factory AuthenticationResponse([updates(AuthenticationResponseBuilder b)]) =
      _$AuthenticationResponse;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(AuthenticationResponse.serializer, this));
  }

  static AuthenticationResponse fromJson(String json) {
    return serializers.deserializeWith(
        AuthenticationResponse.serializer, jsonDecode(json));
  }

  static Serializer<AuthenticationResponse> get serializer =>
      _$authenticationResponseSerializer;
}
