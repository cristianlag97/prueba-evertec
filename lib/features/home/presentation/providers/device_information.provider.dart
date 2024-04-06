import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_evertec/core/plugins/plugins.dart';

final deviceInfoProvider =
    FutureProvider.family<Map<String, dynamic>, BuildContext>(
        (ref, context) async {
  return await DeviceInfoPlus.getDeviceInfo(context);
});
