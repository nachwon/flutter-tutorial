import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CardModel {
  final String id;
  final String number;
  final String color;
  @JsonKey(name: "is_open")
  final bool isOpen;

  CardModel(this.id, this.number, this.color, this.isOpen);

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
