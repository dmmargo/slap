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
