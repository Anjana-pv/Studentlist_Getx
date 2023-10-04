import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_student/bd/image_form.dart';
import 'package:get_student/bd/student_form.dart';
import 'package:get_student/const/const.dart';

Formimage imageController = Get.put(Formimage());
Formfuctions studentFormController = Get.put(Formfuctions());

class Screenform extends StatelessWidget {
  const Screenform({
    super.key,
    required this.isEdit,
    required this.index,
  });
  final bool isEdit;
  final int index;

  @override
  Widget build(BuildContext context) {
    isEdit
        ? studentFormController.isupdate(index)
        : studentFormController.reset();

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Student Detail' : 'Add Student'),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: studentFormController.formkey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () => imageController.getimage(),
                    child: imageController.imgpath.value == " "
                        ? ClipOval(
                            child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          imageController.assestAvatar.value),
                                      fit: BoxFit.fitHeight,
                                    ))),
                          )
                        : ClipOval(
                            child: Container(
                              width: 200,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      FileImage(File(imageController.imgpath.value)),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          )),
                aheigh,
                TextFormField(
                  controller: studentFormController.nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      studentFormController.nameController.text.isEmpty
                          ? "Please enter your name"
                          : "null",
                ),
                aheigh,
                TextFormField(
                  controller: studentFormController.emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      studentFormController.emailController.text.isEmpty
                          ? "Please enter your email"
                          : "null",
                ),
                aheigh,
                TextFormField(
                  controller: studentFormController.ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Age",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      studentFormController.ageController.text.isEmpty
                          ? "Please enter your Age"
                          : "null",
                ),
                aheigh,
                TextFormField(
                  controller: studentFormController.numbercontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Phone number",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      studentFormController.nameController.text.isEmpty
                          ? "Please enter your name"
                          : "null",
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (studentFormController.formkey.currentState!
                              .validate()) {
                            if (imageController.imgpath.value != " ") {
                              if (isEdit) {
                                await studentFormController.updateData(index);
                              } else {
                                await studentFormController.submitdata();
                              }
                              Get.snackbar(
                                  "Success",
                                  isEdit
                                      ? 'Data update Successfully'
                                      : 'Data Submitted Successfully',
                                  backgroundColor: Colors.green);
                            } else {
                              studentFormController.notsuccess();
                              Get.snackbar(
                                'Edit',
                                "image path is empty",
                                backgroundColor: Colors.red,
                              );
                            }
                          }
                        },
                        child: Text(isEdit ? "Update" : "Submit"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
