


import 'package:get/get.dart';
import 'package:get_student/model/studentmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StudentDB extends GetxController{

  List<Studentmodel>student =<Studentmodel>[].obs;
  
Future<void> addAllStudent( Studentmodel value)async{
final studentDB = await Hive.openBox<Studentmodel>('student_db');
student.add(value);
await studentDB.add(value);

}
Future<void> showAllDetail()async{
  final studentDB =await Hive.openBox<Studentmodel>('student_db');
  student.clear();
  student.addAll(studentDB.values);

}
Future <void> edit(int index,Studentmodel std)async{
  final studentDB=await Hive.openBox<Studentmodel>('student_db');
 await studentDB.putAt(index, std);
  showAllDetail();

}
Future<void>deleteInfo(int index)async{
final studentDB=await Hive.openBox<Studentmodel>('student_db');
await studentDB.deleteAt(index);
showAllDetail();

}
}