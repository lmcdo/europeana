library item;
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Object{

  List<String> title;
  List<String> country;
  @JsonKey(name:"dcCreator", disallowNullValue: false, required: false)
  List<String> creator;
  @JsonKey(name:"dcDescription", disallowNullValue: false, required: false)
  List<String> description;
  @JsonKey(name:"edmPreview", disallowNullValue: false, required: false)
  List<String> preview;
  @JsonKey(name:"provider", disallowNullValue: false, required: false)
  List<String> provider;
  bool favored, isExpanded;

  Item({ this.title,
  this.country, this.creator, this.description, this.preview, this.provider,this.favored, this.isExpanded});
  
  factory Item.fromJson(Map<String, dynamic> parsedItems) => _$ItemFromJson(parsedItems);

}