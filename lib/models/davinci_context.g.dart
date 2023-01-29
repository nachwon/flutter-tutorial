// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'davinci_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DavinciContext _$DavinciContextFromJson(Map<String, dynamic> json) =>
    DavinciContext(
      json['session_id'] as String,
      (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['action'] == null
          ? null
          : Action.fromJson(json['action'] as Map<String, dynamic>),
      json['game'] == null
          ? null
          : DavinciGameModel.fromJson(json['game'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DavinciContextToJson(DavinciContext instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'players': instance.players.map((e) => e.toJson()).toList(),
      'action': instance.action?.toJson(),
      'game': instance.game?.toJson(),
    };
