import '../entities/case_of_infections_entity.dart';

abstract class HomeRepository {
  Future<CaseOfInfectionsEntity> getCasesOfInfect();
}
