// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      json['connection_id'] as String,
      json['state'] as String,
      json['username'] as String,
      (json['cards'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['last_drawn_card'] as String?,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'connection_id': instance.connectionId,
      'state': instance.state,
      'username': instance.username,
      'cards': instance.cards.map((e) => e.toJson()).toList(),
      'last_drawn_card': instance.lastDrawnCard,
    };
