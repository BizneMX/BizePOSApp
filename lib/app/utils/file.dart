import 'dart:convert';
import 'dart:io';

Future<String> getBase64FormateFile(String path) async {
  File file = File(path);
  final ext = path.split('.')[path.split('.').length - 1];
  List<int> fileInByte = await file.readAsBytes();
  String fileInBase64 = base64Encode(fileInByte);
  return 'data:image/$ext;base64,$fileInBase64';
}
