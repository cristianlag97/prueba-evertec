import 'dart:convert';

List<StatesInfoModel> statesInfoModelFromJson(String str) =>
    List<StatesInfoModel>.from(
        json.decode(str).map((x) => StatesInfoModel.fromJson(x)));

class StatesInfoModel {
  final String state;
  final String notes;
  final String name;

  StatesInfoModel({
    required this.state,
    required this.notes,
    required this.name,
  });

  StatesInfoModel.fromJson(Map<String, dynamic> json)
      : state = json["state"],
        notes = json["notes"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
        "state": state,
        "notes": notes,
        "name": name,
      };
}
