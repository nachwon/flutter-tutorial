import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/models/card_model.dart';

part 'davinci_game.g.dart';

@JsonSerializable(explicitToJson: true)
class DavinciGameModel {
  final String state;
  final String turn;
  @JsonKey(name: "unused_cards")
  final List<CardModel> unusedCards;

  DavinciGameModel(this.state, this.turn, this.unusedCards);

  factory DavinciGameModel.fromJson(Map<String, dynamic> json) =>
      _$DavinciGameModelFromJson(json);
  Map<String, dynamic> toJson() => _$DavinciGameModelToJson(this);
}
