// To parse this JSON data, do
//
//     final trailModules = trailModulesFromJson(jsonString);

import 'dart:convert';

List<TrailModules> trailModulesFromJson(String str) => List<TrailModules>.from(
    json.decode(str).map((x) => TrailModules.fromJson(x)));

String trailModulesToJson(List<TrailModules> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrailModules {
  String modNum;
  String modOrder;
  String tNum;
  String modName;
  String modContent;
  String modDescription;
  String modSpecialnote;
  String slLevel;
  String modExampleExplanation;

  TrailModules({
    required this.modNum,
    required this.modOrder,
    required this.tNum,
    required this.modName,
    required this.modContent,
    required this.modDescription,
    required this.modSpecialnote,
    required this.slLevel,
    required this.modExampleExplanation,
  });

  factory TrailModules.fromJson(Map<String, dynamic> json) => TrailModules(
        modNum: json["mod_num"],
        modOrder: json["mod_order"],
        tNum: json["t_num"],
        modName: json["mod_name"],
        modContent: json["mod_content"],
        modDescription: json["mod_description"],
        modSpecialnote: json["mod_specialnote"],
        slLevel: json["sl_level"],
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
        "sl_level": slLevel,
        "mod_example_explanation": modExampleExplanation,
      };
}
