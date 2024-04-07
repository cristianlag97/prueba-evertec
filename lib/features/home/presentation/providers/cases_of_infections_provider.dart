part of feature.home.presentation.providers;

final homeRepositoryProvider =
    Provider((ref) => HomeRepositoryImpl(HomeDatasourceImpl()));

final homeProvider = FutureProvider((ref) async {
  final casesInfoCallback = ref.watch(homeRepositoryProvider);
  return await casesInfoCallback.getCasesOfInfect();
});
