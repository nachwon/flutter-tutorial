import 'package:json_annotation/json_annotation.dart';
import 'card_model.dart';
import 'player.dart';
import 'action.dart';

part 'davinci_context.g.dart';

@JsonSerializable(explicitToJson: true)
class DavinciContext {
  @JsonKey(name: 'session_id')
  final String sessionId;
  final List<Player> players;
  final Action? action;
  final String state;
  final String turn;
  @JsonKey(name: "unused_cards")
  final List<CardModel> unusedCards;

  DavinciContext(
    this.sessionId,
    this.players,
    this.action,
    this.state,
    this.turn,
    this.unusedCards,
  );

  factory DavinciContext.fromJson(Map<String, dynamic> json) =>
      _$DavinciContextFromJson(json);

  Map<String, dynamic> toJson() => _$DavinciContextToJson(this);
}
