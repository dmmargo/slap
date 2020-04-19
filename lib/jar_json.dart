import 'dart:convert';

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
import 'package:http/http.dart' as http;

part 'jar_json.g.dart';
@JsonSerializable()

class jar_json{
  String name;
  final List<String> paper;

  jar_json(this.name, this.paper);


  factory jar_json.fromJson(Map <String, dynamic> json) =>
      _$jar_jsonFromJson(json);

  //jar_json.browse
  static Future<List<jar_json>> browse() async{
    Future _loadAStudentAsset() async {
      http.Response response = await http.get('http://www.mocky.io/v2/5e9a9791330000fcc87b3033');

      await Future.delayed(Duration(seconds:2));

      String content = response.body;
      print(content);
      //String content = await rootBundle.loadString('assets/jar.json');
      List collection = json.decode(content);
      //print(collection);
      List <jar_json> _names = collection.map((json) => jar_json.fromJson(json)).toList();
      print('1');

      return _names;
      //return await rootBundle.loadString('assets/jar.json');
    }
  }
  /**
  jar_json.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        paper = json['paper'];
*/

}


