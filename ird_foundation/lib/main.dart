import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ird_foundation_task/controller/hadith_controller.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'screen/home/home_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDatabaseFile();
  final dbCon = Get.put(HadithController(), permanent: true);
  await dbCon.initDatabase();
  runApp(const MyApp());

}

setUpDatabaseFile() async{
  try{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, HadithController.database);

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      ByteData data = await rootBundle.load(join('assets', 'database', 'hadith_bn_test.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes);
    }
  }catch(e){
    log('Error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
