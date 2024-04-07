part of features.states.infrastructure;

List<StatesInfoModel> statesInfoModelFromJson(String str) =>
    List<StatesInfoModel>.from(
        json.decode(str).map((x) => StatesInfoModel.fromJson(x)));

class StatesInfoModel {
  final String state;
  final String notes;
  final String name;
  final String covid19Site;

  StatesInfoModel({
    required this.state,
    required this.notes,
    required this.name,
    required this.covid19Site,
  });

  StatesInfoModel.fromJson(Map<String, dynamic> json)
      : state = json["state"],
        notes = json["notes"],
        name = json["name"],
        covid19Site = json["covid19Site"];

  Map<String, dynamic> toJson() => {
        "state": state,
        "notes": notes,
        "name": name,
        "covid19Site": covid19Site,
      };
}
