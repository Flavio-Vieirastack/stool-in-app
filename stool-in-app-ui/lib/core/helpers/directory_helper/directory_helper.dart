import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DirectoryHelper {
  Future<String> getTemmporaryPath() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    return tempPath;
  }

  Future<String> getDocumentsDirectory() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return appDocPath;
  }
}
