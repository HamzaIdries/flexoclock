import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class Storage{
  Future<String> get LocalPath async{
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get LocalFile async{
    final path = await LocalPath;
    return File('$path/db.txt');
  }

  Future<String> readData() async{
    try{
      final file = await LocalFile;
      String body = await file.readAsString();

      return body;
    } catch(e){
      return e.toString();
    }
  }

  Future<File> writeData(String data) async{
    final file = await LocalFile;
    return file.writeAsString('$data');
  }

}