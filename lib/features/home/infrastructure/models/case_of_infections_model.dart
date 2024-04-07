part of feature.home.infrastructure;

List<CaseOfInfectionsModel> currentCaseOfInfectionsFromJson(String str) =>
    List<CaseOfInfectionsModel>.from(
        json.decode(str).map((x) => CaseOfInfectionsModel.fromJson(x)));

class CaseOfInfectionsModel {
  final int positive;
  final int negative;
  final int pending;
  final int death;
  final int totalTestResults;
  final dynamic recovered;
  final int total;
  final int negativeIncrease;
  final int positiveIncrease;
  final int totalTestResultsIncrease;

  CaseOfInfectionsModel({
    required this.positive,
    required this.negative,
    required this.pending,
    required this.recovered,
    required this.death,
    required this.total,
    required this.negativeIncrease,
    required this.positiveIncrease,
    required this.totalTestResults,
    required this.totalTestResultsIncrease,
  });

  CaseOfInfectionsModel.fromJson(Map<String, dynamic> json)
      : positive = json["positive"],
        negative = json["negative"],
        pending = json["pending"],
        death = json["death"],
        totalTestResults = json["totalTestResults"],
        recovered = json["recovered"],
        total = json["total"],
        negativeIncrease = json["negativeIncrease"],
        positiveIncrease = json["positiveIncrease"],
        totalTestResultsIncrease = json["totalTestResultsIncrease"];
}
