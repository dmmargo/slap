/**
class jar_json{
  String name;
  final List<String> paper;

  jar_json({
    this.name,
    this.paper,
  });

  factory jar_json.fromJson(Map<String, dynamic> parsedJson){
    return jar_json(
      name: parsedJson['name'],
      paper: parsedJson['paper'],
    );
  }

}
 */
import 'package:json_annotation/json_annotation.dart';

part 'jar_json.g.dart';
@JsonSerializable()

class jar_json{
  String name;
  final List<String> paper;

  jar_json(this.name, this.paper);


  factory jar_json.fromJson(Map <String, dynamic> json) =>
      _$jar_jsonFromJson(json);
  /**
  jar_json.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        paper = json['paper'];
*/

}


