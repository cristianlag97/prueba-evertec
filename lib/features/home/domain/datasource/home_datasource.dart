import '../entities/case_of_infections_entity.dart';

abstract class HomeDatasource {
  Future<CaseOfInfectionsEntity> getCasesOfInfect();
}
