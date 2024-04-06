import 'dart:convert';

List<StatesCurrentModel> statesCurrentModelFromJson(String str) =>
    List<StatesCurrentModel>.from(
        json.decode(str).map((x) => StatesCurrentModel.fromJson(x)));

class StatesCurrentModel {
  final int positive;
  final int totalTestResults;
  final String lastUpdateEt;

  StatesCurrentModel({
    required this.positive,
    required this.totalTestResults,
    required this.lastUpdateEt,
  });

  StatesCurrentModel.fromJson(Map<String, dynamic> json)
      : positive = json["positive"] ?? 0,
        totalTestResults = json["totalTestResults"] ?? 0,
        lastUpdateEt = json["lastUpdateEt"] ?? '';

  Map<String, dynamic> toJson() => {
        "positive": positive,
        "totalTestResults": totalTestResults,
        "lastUpdateEt": lastUpdateEt,
      };
}
