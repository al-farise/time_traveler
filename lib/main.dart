import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:time_traveler/controllers/auth_controller.dart';
import 'package:time_traveler/pages/login.dart';
import 'package:time_traveler/pages/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(TimeTravelerApp());
}

class TimeTravelerApp extends StatelessWidget {
  TimeTravelerApp({super.key});

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Traveler',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: controller.userToken.val.isNotEmpty ? const MainMenu() : Login(),
      ),
    );
  }
}
