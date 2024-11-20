// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LocationDataStruct extends FFFirebaseStruct {
  LocationDataStruct({
    String? organization,
    String? organizationName,
    String? city,
    String? countryCode,
    String? countryCode3,
    String? ip,
    String? continentCode,
    String? region,
    String? latitude,
    String? longitude,
    String? country,
    String? timezone,
    String? areaCode,
    int? asn,
    int? accuracy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _organization = organization,
        _organizationName = organizationName,
        _city = city,
        _countryCode = countryCode,
        _countryCode3 = countryCode3,
        _ip = ip,
        _continentCode = continentCode,
        _region = region,
        _latitude = latitude,
        _longitude = longitude,
        _country = country,
        _timezone = timezone,
        _areaCode = areaCode,
        _asn = asn,
        _accuracy = accuracy,
        super(firestoreUtilData);

  // "organization" field.
  String? _organization;
  String get organization => _organization ?? '';
  set organization(String? val) => _organization = val;

  bool hasOrganization() => _organization != null;

  // "organization_name" field.
  String? _organizationName;
  String get organizationName => _organizationName ?? '';
  set organizationName(String? val) => _organizationName = val;

  bool hasOrganizationName() => _organizationName != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  set countryCode(String? val) => _countryCode = val;

  bool hasCountryCode() => _countryCode != null;

  // "country_code3" field.
  String? _countryCode3;
  String get countryCode3 => _countryCode3 ?? '';
  set countryCode3(String? val) => _countryCode3 = val;

  bool hasCountryCode3() => _countryCode3 != null;

  // "ip" field.
  String? _ip;
  String get ip => _ip ?? '';
  set ip(String? val) => _ip = val;

  bool hasIp() => _ip != null;

  // "continent_code" field.
  String? _continentCode;
  String get continentCode => _continentCode ?? '';
  set continentCode(String? val) => _continentCode = val;

  bool hasContinentCode() => _continentCode != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  set region(String? val) => _region = val;

  bool hasRegion() => _region != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "timezone" field.
  String? _timezone;
  String get timezone => _timezone ?? '';
  set timezone(String? val) => _timezone = val;

  bool hasTimezone() => _timezone != null;

  // "area_code" field.
  String? _areaCode;
  String get areaCode => _areaCode ?? '';
  set areaCode(String? val) => _areaCode = val;

  bool hasAreaCode() => _areaCode != null;

  // "asn" field.
  int? _asn;
  int get asn => _asn ?? 0;
  set asn(int? val) => _asn = val;

  void incrementAsn(int amount) => asn = asn + amount;

  bool hasAsn() => _asn != null;

  // "accuracy" field.
  int? _accuracy;
  int get accuracy => _accuracy ?? 0;
  set accuracy(int? val) => _accuracy = val;

  void incrementAccuracy(int amount) => accuracy = accuracy + amount;

  bool hasAccuracy() => _accuracy != null;

  static LocationDataStruct fromMap(Map<String, dynamic> data) =>
      LocationDataStruct(
        organization: data['organization'] as String?,
        organizationName: data['organization_name'] as String?,
        city: data['city'] as String?,
        countryCode: data['country_code'] as String?,
        countryCode3: data['country_code3'] as String?,
        ip: data['ip'] as String?,
        continentCode: data['continent_code'] as String?,
        region: data['region'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        country: data['country'] as String?,
        timezone: data['timezone'] as String?,
        areaCode: data['area_code'] as String?,
        asn: castToType<int>(data['asn']),
        accuracy: castToType<int>(data['accuracy']),
      );

  static LocationDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'organization': _organization,
        'organization_name': _organizationName,
        'city': _city,
        'country_code': _countryCode,
        'country_code3': _countryCode3,
        'ip': _ip,
        'continent_code': _continentCode,
        'region': _region,
        'latitude': _latitude,
        'longitude': _longitude,
        'country': _country,
        'timezone': _timezone,
        'area_code': _areaCode,
        'asn': _asn,
        'accuracy': _accuracy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'organization': serializeParam(
          _organization,
          ParamType.String,
        ),
        'organization_name': serializeParam(
          _organizationName,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'country_code': serializeParam(
          _countryCode,
          ParamType.String,
        ),
        'country_code3': serializeParam(
          _countryCode3,
          ParamType.String,
        ),
        'ip': serializeParam(
          _ip,
          ParamType.String,
        ),
        'continent_code': serializeParam(
          _continentCode,
          ParamType.String,
        ),
        'region': serializeParam(
          _region,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'timezone': serializeParam(
          _timezone,
          ParamType.String,
        ),
        'area_code': serializeParam(
          _areaCode,
          ParamType.String,
        ),
        'asn': serializeParam(
          _asn,
          ParamType.int,
        ),
        'accuracy': serializeParam(
          _accuracy,
          ParamType.int,
        ),
      }.withoutNulls;

  static LocationDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationDataStruct(
        organization: deserializeParam(
          data['organization'],
          ParamType.String,
          false,
        ),
        organizationName: deserializeParam(
          data['organization_name'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        countryCode: deserializeParam(
          data['country_code'],
          ParamType.String,
          false,
        ),
        countryCode3: deserializeParam(
          data['country_code3'],
          ParamType.String,
          false,
        ),
        ip: deserializeParam(
          data['ip'],
          ParamType.String,
          false,
        ),
        continentCode: deserializeParam(
          data['continent_code'],
          ParamType.String,
          false,
        ),
        region: deserializeParam(
          data['region'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        timezone: deserializeParam(
          data['timezone'],
          ParamType.String,
          false,
        ),
        areaCode: deserializeParam(
          data['area_code'],
          ParamType.String,
          false,
        ),
        asn: deserializeParam(
          data['asn'],
          ParamType.int,
          false,
        ),
        accuracy: deserializeParam(
          data['accuracy'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LocationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationDataStruct &&
        organization == other.organization &&
        organizationName == other.organizationName &&
        city == other.city &&
        countryCode == other.countryCode &&
        countryCode3 == other.countryCode3 &&
        ip == other.ip &&
        continentCode == other.continentCode &&
        region == other.region &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        country == other.country &&
        timezone == other.timezone &&
        areaCode == other.areaCode &&
        asn == other.asn &&
        accuracy == other.accuracy;
  }

  @override
  int get hashCode => const ListEquality().hash([
        organization,
        organizationName,
        city,
        countryCode,
        countryCode3,
        ip,
        continentCode,
        region,
        latitude,
        longitude,
        country,
        timezone,
        areaCode,
        asn,
        accuracy
      ]);
}

LocationDataStruct createLocationDataStruct({
  String? organization,
  String? organizationName,
  String? city,
  String? countryCode,
  String? countryCode3,
  String? ip,
  String? continentCode,
  String? region,
  String? latitude,
  String? longitude,
  String? country,
  String? timezone,
  String? areaCode,
  int? asn,
  int? accuracy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationDataStruct(
      organization: organization,
      organizationName: organizationName,
      city: city,
      countryCode: countryCode,
      countryCode3: countryCode3,
      ip: ip,
      continentCode: continentCode,
      region: region,
      latitude: latitude,
      longitude: longitude,
      country: country,
      timezone: timezone,
      areaCode: areaCode,
      asn: asn,
      accuracy: accuracy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationDataStruct? updateLocationDataStruct(
  LocationDataStruct? locationData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationDataStructData(
  Map<String, dynamic> firestoreData,
  LocationDataStruct? locationData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationData == null) {
    return;
  }
  if (locationData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationDataData =
      getLocationDataFirestoreData(locationData, forFieldValue);
  final nestedData =
      locationDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationDataFirestoreData(
  LocationDataStruct? locationData, [
  bool forFieldValue = false,
]) {
  if (locationData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationData.toMap());

  // Add any Firestore field values
  locationData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationDataListFirestoreData(
  List<LocationDataStruct>? locationDatas,
) =>
    locationDatas?.map((e) => getLocationDataFirestoreData(e, true)).toList() ??
    [];
