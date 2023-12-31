import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_student/bd/db_functions.dart';
import 'package:get_student/model/studentmodel.dart';

import '../screens/form.dart';

class Formfuctions extends GetxController{
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final ageController =TextEditingController();
  final numbercontroller=TextEditingController();

  final formkey=GlobalKey<FormState>();


Future<void>isupdate(int index)async{
  final studentDB=Get.put(StudentDB());
  await studentDB.showAllDetail();
    imageController.imgpath.value= StudentDB().student[index].profile;
  nameController.text=studentDB.student[index].name;
  emailController.text=studentDB.student[index].email;
  ageController.text=studentDB.student[index].age.toString();
  numbercontroller.text=studentDB.student[index].number.toString();
  }
  void notsuccess(){
    Get.snackbar('image is not added!', 'Please add image of Student');
  }
   Future<void>submitdata()async{
    final studentObject= Studentmodel(
      id:DateTime.now() ,
        profile:imageController.imgpath.value ,
       name: nameController.text.trim(),
        email: emailController.text.trim(), 
        age:int.parse( ageController.text.trim()), 
        number: int.parse(numbercontroller.text.trim()),

    );
    await StudentDB().addAllStudent(studentObject);
    reset();
    final studentDB=Get.put(StudentDB());
    studentDB.showAllDetail();
    Get.back();
   }

   Future<void>updateData(int index)async{
    final studentObject =Studentmodel(
      id:DateTime.now() ,
       name: nameController.text.trim(),
        email: emailController.text.trim(), 
        age:int.parse( ageController.text.trim()), 
        number: int.parse(numbercontroller.text.trim()),
        profile: imageController.imgpath.value
    );
    await StudentDB().edit(index,studentObject);
    final studentDB=Get.put(StudentDB());
    studentDB.showAllDetail();
    Get.back();
  

   }
reset(){
  nameController.text=" ";
  emailController.text=" ";
  ageController.text=" ";
  numbercontroller.text=" ";
}

}