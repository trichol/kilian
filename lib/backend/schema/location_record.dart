import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationRecord extends FirestoreRecord {
  LocationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ip" field.
  String? _ip;
  String get ip => _ip ?? '';
  bool hasIp() => _ip != null;

  // "organization" field.
  String? _organization;
  String get organization => _organization ?? '';
  bool hasOrganization() => _organization != null;

  // "organization_name" field.
  String? _organizationName;
  String get organizationName => _organizationName ?? '';
  bool hasOrganizationName() => _organizationName != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "country_code3" field.
  String? _countryCode3;
  String get countryCode3 => _countryCode3 ?? '';
  bool hasCountryCode3() => _countryCode3 != null;

  // "continent_code" field.
  String? _continentCode;
  String get continentCode => _continentCode ?? '';
  bool hasContinentCode() => _continentCode != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "timezone" field.
  String? _timezone;
  String get timezone => _timezone ?? '';
  bool hasTimezone() => _timezone != null;

  // "area_code" field.
  String? _areaCode;
  String get areaCode => _areaCode ?? '';
  bool hasAreaCode() => _areaCode != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  bool hasLongitude() => _longitude != null;

  // "asn" field.
  int? _asn;
  int get asn => _asn ?? 0;
  bool hasAsn() => _asn != null;

  // "accuracy" field.
  int? _accuracy;
  int get accuracy => _accuracy ?? 0;
  bool hasAccuracy() => _accuracy != null;

  void _initializeFields() {
    _ip = snapshotData['ip'] as String?;
    _organization = snapshotData['organization'] as String?;
    _organizationName = snapshotData['organization_name'] as String?;
    _city = snapshotData['city'] as String?;
    _countryCode = snapshotData['country_code'] as String?;
    _countryCode3 = snapshotData['country_code3'] as String?;
    _continentCode = snapshotData['continent_code'] as String?;
    _region = snapshotData['region'] as String?;
    _country = snapshotData['country'] as String?;
    _timezone = snapshotData['timezone'] as String?;
    _areaCode = snapshotData['area_code'] as String?;
    _latitude = snapshotData['latitude'] as String?;
    _longitude = snapshotData['longitude'] as String?;
    _asn = castToType<int>(snapshotData['asn']);
    _accuracy = castToType<int>(snapshotData['accuracy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('location');

  static Stream<LocationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationRecord.fromSnapshot(s));

  static Future<LocationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationRecord.fromSnapshot(s));

  static LocationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationRecordData({
  String? ip,
  String? organization,
  String? organizationName,
  String? city,
  String? countryCode,
  String? countryCode3,
  String? continentCode,
  String? region,
  String? country,
  String? timezone,
  String? areaCode,
  String? latitude,
  String? longitude,
  int? asn,
  int? accuracy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ip': ip,
      'organization': organization,
      'organization_name': organizationName,
      'city': city,
      'country_code': countryCode,
      'country_code3': countryCode3,
      'continent_code': continentCode,
      'region': region,
      'country': country,
      'timezone': timezone,
      'area_code': areaCode,
      'latitude': latitude,
      'longitude': longitude,
      'asn': asn,
      'accuracy': accuracy,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationRecordDocumentEquality implements Equality<LocationRecord> {
  const LocationRecordDocumentEquality();

  @override
  bool equals(LocationRecord? e1, LocationRecord? e2) {
    return e1?.ip == e2?.ip &&
        e1?.organization == e2?.organization &&
        e1?.organizationName == e2?.organizationName &&
        e1?.city == e2?.city &&
        e1?.countryCode == e2?.countryCode &&
        e1?.countryCode3 == e2?.countryCode3 &&
        e1?.continentCode == e2?.continentCode &&
        e1?.region == e2?.region &&
        e1?.country == e2?.country &&
        e1?.timezone == e2?.timezone &&
        e1?.areaCode == e2?.areaCode &&
        e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude &&
        e1?.asn == e2?.asn &&
        e1?.accuracy == e2?.accuracy;
  }

  @override
  int hash(LocationRecord? e) => const ListEquality().hash([
        e?.ip,
        e?.organization,
        e?.organizationName,
        e?.city,
        e?.countryCode,
        e?.countryCode3,
        e?.continentCode,
        e?.region,
        e?.country,
        e?.timezone,
        e?.areaCode,
        e?.latitude,
        e?.longitude,
        e?.asn,
        e?.accuracy
      ]);

  @override
  bool isValidKey(Object? o) => o is LocationRecord;
}
