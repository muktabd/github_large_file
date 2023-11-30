
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'hadith_model.dart';

class HadithController extends GetxController{
  static const String database = 'asset_database.db';
  late final Database db;
  static const hadith = 'hadith';
  List<HadithModel> hadithList = [];
  bool inti = false;

  initDatabase() async{
    try{
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String databasePath = join(appDocDir.path, database);
      db = await openDatabase(databasePath);
      inti = true;
      fetchHadithData();
    } catch(e){
      log('Error: $e');
    }
  }

  Future fetchHadithData() async{
    if(inti){
      // final data = await db.rawQuery('SELECT * FROM $hadith');
      final data = await db.query(hadith, limit: 100);
      hadithList = data.map((e) => HadithModel.fromMap(e)).toList();
      log('===@ Hadith List: ${data.toString()}');
      update();
    }else{
      log('Database is not Ready');
    }
  }
}
