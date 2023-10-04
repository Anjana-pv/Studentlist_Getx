import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class Formimage extends GetxController{
final assestAvatar = "lib/assest/img.jpg".obs;
var imgpath =" ".obs;
Future <void>getimage()async{
  final pickedFile=await ImagePicker().pickImage(source: ImageSource.gallery);
  if(pickedFile !=null){
     imgpath.value = pickedFile.path;
  }else{
    Get.snackbar('image not selected', 'Please select an image');
  }
}
}