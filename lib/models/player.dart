import 'package:json_annotation/json_annotation.dart';

import 'card_model.dart';

part 'player.g.dart';

@JsonSerializable(explicitToJson: true)
class Player {
  @JsonKey(name: 'connection_id')
  final String connectionId;
  final String state;
  final String username;
  final List<CardModel> cards;
  @JsonKey(name: "last_drawn_card")
  final String? lastDrawnCard;

  Player(
    this.connectionId,
    this.state,
    this.username,
    this.cards,
    this.lastDrawnCard,
  );

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
