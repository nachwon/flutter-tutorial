// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'davinci_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DavinciGameModel _$DavinciGameModelFromJson(Map<String, dynamic> json) =>
    DavinciGameModel(
      json['state'] as String,
      json['turn'] as String,
      (json['unused_cards'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DavinciGameModelToJson(DavinciGameModel instance) =>
    <String, dynamic>{
      'state': instance.state,
      'turn': instance.turn,
      'unused_cards': instance.unusedCards.map((e) => e.toJson()).toList(),
    };
