import 'package:path_provider/path_provider.dart';

class PathProvider {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> getFullDirectory(String fileName) async {
    final directory = await localPath;
    return '$directory/$fileName';
  }
}