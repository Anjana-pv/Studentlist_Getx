import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_student/bd/db_functions.dart';
import 'package:get_student/const/const.dart';
import 'package:get_student/screens/form.dart';

class Screenprofile extends StatelessWidget {
  const Screenprofile({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final studentDB = Get.put(StudentDB());
    studentDB.showAllDetail();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Card(
              child: Center(
                child: Column(children: [
                  const SizedBox(height: 50),
                  const CircleAvatar(
                    radius: 60,
                    // backgroundImage:
                        // FileImage(File(studentDB.student[index].profile)),
                        
                  ),
                  aheigh,
                  Text(
                    "Name :${studentDB.student[index].name.toUpperCase()}",
                    style: profileTextStyle,
                  ),
                  aheigh,
                  Text(
                    "Email :${studentDB.student[index].email.toLowerCase()}",
                    style: profileTextStyle,
                  ),
                  aheigh,
                  Text(
                    "Age :${studentDB.student[index].age}",
                    style: profileTextStyle,
                  ),
                  aheigh,
                  Text(
                    "Phone Number :${studentDB.student[index].number}",
                    style: profileTextStyle,
                  ),
                  aheigh,
                  ElevatedButton.icon(
                      onPressed: () =>
                          Get.to(Screenform(isEdit: true, index: index)),
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'))
                ]),
              ),
            ),
          )),
    );
  }
}
