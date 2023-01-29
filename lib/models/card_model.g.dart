// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      json['id'] as String,
      json['number'] as String,
      json['color'] as String,
      json['is_open'] as bool,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'color': instance.color,
      'is_open': instance.isOpen,
    };
