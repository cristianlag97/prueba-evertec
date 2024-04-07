import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathProviderPlugin {
  static Future<File> getLocalFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      return File('${directory.path}/credentials.json');
    } catch (e) {
      print('Error: $e');
      throw Exception();
    }
  }
}
