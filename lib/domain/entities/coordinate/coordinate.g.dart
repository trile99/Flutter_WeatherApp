// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Coordinate _$$_CoordinateFromJson(Map<String, dynamic> json) =>
    _$_Coordinate(
      name: json['name'] as String?,
      localName: json['local_names'] == null
          ? null
          : LocalName.fromJson(json['local_names'] as Map<String, dynamic>),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$_CoordinateToJson(_$_Coordinate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'local_names': instance.localName,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
    };

_$_LocalName _$$_LocalNameFromJson(Map<String, dynamic> json) => _$_LocalName(
      en: json['en'] as String?,
      vi: json['vi'] as String?,
      ko: json['ko'] as String?,
    );

Map<String, dynamic> _$$_LocalNameToJson(_$_LocalName instance) =>
    <String, dynamic>{
      'en': instance.en,
      'vi': instance.vi,
      'ko': instance.ko,
    };
