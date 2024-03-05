// To parse this JSON data, do
//
//     final modules = modulesFromJson(jsonString);

import 'dart:convert';

List<Modules> modulesFromJson(String str) =>
    List<Modules>.from(json.decode(str).map((x) => Modules.fromJson(x)));

String modulesToJson(List<Modules> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modules {
  String modNum;
  String modOrder;
  String tNum;
  String modName;
  String modContent;
  String modDescription;
  String modSpecialnote;

  String modExampleExplanation;

  Modules({
    required this.modNum,
    required this.modOrder,
    required this.tNum,
    required this.modName,
    required this.modContent,
    required this.modDescription,
    required this.modSpecialnote,
    required this.modExampleExplanation,
  });

  factory Modules.fromJson(Map<String, dynamic> json) => Modules(
        modNum: json["mod_num"],
        modOrder: json["mod_order"],
        tNum: json["t_num"],
        modName: json["mod_name"],
        modContent: json["mod_content"],
        modDescription: json["mod_description"],
        modSpecialnote: json["mod_specialnote"],
        modExampleExplanation: json["mod_example_explanation"],
      );

  Map<String, dynamic> toJson() => {
        "mod_num": modNum,
        "mod_order": modOrder,
        "t_num": tNum,
        "mod_name": modName,
        "mod_content": modContent,
        "mod_description": modDescription,
        "mod_specialnote": modSpecialnote,
        "mod_example_explanation": modExampleExplanation,
      };
}

enum SlLevel { B }

final slLevelValues = EnumValues({"b": SlLevel.B});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
