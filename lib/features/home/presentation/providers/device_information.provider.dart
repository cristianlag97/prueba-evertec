part of feature.home.presentation.providers;

final deviceInfoProvider =
    FutureProvider.family<Map<String, dynamic>, BuildContext>(
        (ref, context) async {
  return await DeviceInfoPlus.getDeviceInfo(context);
});
