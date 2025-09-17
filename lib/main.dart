import 'package:elevate_tech_task/core/di/service_locator.dart';
import 'package:elevate_tech_task/feature/home/presentation/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elevate Task',
      home: HomeView(),
    );
  }
}
