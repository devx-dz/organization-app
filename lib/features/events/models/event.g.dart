// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      place: json['place'] as String?,
      datedebut: json['datedebut'] as String?,
      datefin: json['datefin'] as String?,
      state: json['state'] as String? ?? 'inactive',
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'place': instance.place,
      'datedebut': instance.datedebut,
      'datefin': instance.datefin,
      'state': instance.state,
    };
