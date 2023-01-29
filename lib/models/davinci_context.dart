import 'package:json_annotation/json_annotation.dart';
import 'davinci_game.dart';
import 'player.dart';
import 'action.dart';

part 'davinci_context.g.dart';

@JsonSerializable(explicitToJson: true)
class DavinciContext {
  @JsonKey(name: 'session_id')
  final String sessionId;
  final List<Player> players;
  final Action? action;
  final DavinciGameModel? game;

  DavinciContext(
    this.sessionId,
    this.players,
    this.action,
    this.game,
  );

  factory DavinciContext.fromJson(Map<String, dynamic> json) =>
      _$DavinciContextFromJson(json);

  Map<String, dynamic> toJson() => _$DavinciContextToJson(this);
}
