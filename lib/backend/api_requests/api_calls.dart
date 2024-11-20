import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeoJSLocationCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GeoJSLocation',
      apiUrl: 'https://get.geojs.io/v1/ip/geo.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? latitude(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.latitude''',
      ));
  static String? longitude(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.longitude''',
      ));
  static int? accuracy(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.accuracy''',
      ));
  static String? timezone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timezone''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.country''',
      ));
  static String? organization(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.organization''',
      ));
  static int? asn(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.asn''',
      ));
  static String? ip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ip''',
      ));
  static String? areacode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.area_code''',
      ));
  static String? organizationname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.organization_name''',
      ));
  static String? countrycode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.country_code''',
      ));
  static String? countrycode3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.country_code3''',
      ));
  static String? continentcode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.continent_code''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city''',
      ));
  static String? region(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.region''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
