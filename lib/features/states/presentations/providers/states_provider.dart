import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/infrastructure.dart';

final statesCurrentRepositoryProvider =
    Provider((ref) => StatesRepositoryImpl(StatesDatasourceImpl()));

final stateCurrentsProvider = FutureProvider((ref) async {
  final currentCallBack = ref.watch(statesCurrentRepositoryProvider);
  return await currentCallBack.getStateCurrent();
});

final stateInfoProvider = FutureProvider((ref) async {
  final currentCallBack = ref.watch(statesCurrentRepositoryProvider);
  return await currentCallBack.getStateInfo();
});

final stateDetailinfo =
    FutureProviderFamily((FutureProviderRef ref, String state) async {
  final detailState = ref.watch(statesCurrentRepositoryProvider);
  return await detailState.getDEtailOfstate(state);
});
