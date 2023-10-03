import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Add details',
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 229, 223, 223)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
          paddingOnly(top: 30),
          CircleAvatar(
            radius: 30,
          ),
        ]),
      ),
    );
  }
}
