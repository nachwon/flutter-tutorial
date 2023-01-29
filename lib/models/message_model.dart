import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/models/davinci_context.dart';

part 'message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageModel {
  @JsonKey(name: "me_pointer")
  final int mePointer;
  final DavinciContext context;

  MessageModel(this.mePointer, this.context);

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
