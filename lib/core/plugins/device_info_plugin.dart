import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeviceInfoPlus {
  static Future<Map<String, String>> getDeviceInfo(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.android) {
      return _getAndroidDeviceInfo(await deviceInfo.androidInfo, context);
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _getIOSDeviceInfo(await deviceInfo.iosInfo);
    }
    return {};
  }

  static Map<String, String> _getAndroidDeviceInfo(
      AndroidDeviceInfo androidInfo, BuildContext context) {
    return {
      'Fecha actual': _getTimeIn12HourFormat(),
      'Nombre del dispositivo': androidInfo.brand,
      'Marca del dispositivo': androidInfo.manufacturer,
      'Tipo de dispositivo': _getDeviceTypeAndroid(androidInfo, context),
      'Modelo de dispositivo': androidInfo.model,
      'Sistema operativo y su versión':
          '${androidInfo.version.release} Android',
    };
  }

  static String _getDeviceTypeAndroid(
      AndroidDeviceInfo androidInfo, BuildContext context) {
    double dpi = MediaQuery.of(context).devicePixelRatio * 160;
    const double tabletThreshold = 600; // DPI
    if (dpi >= tabletThreshold) {
      return 'Tablet';
    } else {
      return 'Teléfono';
    }
  }

  static Map<String, String> _getIOSDeviceInfo(IosDeviceInfo iosInfo) {
    return {
      'Fecha actual': _getTimeIn12HourFormat(),
      'Nombre del dispositivo': iosInfo.name,
      'Marca del dispositivo': 'Apple',
      'Tipo de dispositivo': _getDeviceTypeIos(iosInfo.model),
      'Modelo de dispositivo': iosInfo.model,
      'Sistema operativo y su versión':
          '${iosInfo.systemVersion} ${iosInfo.data['systemName']}',
    };
  }

  static String _getDeviceTypeIos(String iosModel) {
    Map<String, String> deviceTypes = {
      'iPhone': 'Teléfono',
      'iPad': 'iPad',
    };

    String deviceType = 'Desconocido';
    deviceTypes.forEach((modelPattern, type) {
      if (iosModel.contains(modelPattern)) {
        deviceType = type;
      }
    });

    return deviceType;
  }

  static _getTimeIn12HourFormat() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('hh:mm:ssa').format(now);
    return formattedTime;
  }
}
