import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:time_traveler/components/appwrite.dart';
import 'package:time_traveler/pages/login.dart';
import 'package:time_traveler/pages/main_menu.dart';

class AuthController extends GetxController {
  Account? account;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userToken = ''.val('userToken');

  @override
  void onInit() {
    super.onInit();
    account = Account(appwrite());
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future register(Map map) async {
    try {
      final result = await account!.create(
        userId: ID.unique(),
        email: map['email'],
        password: map['password'],
        name: map['name'],
      );
      print("AccountController:: createAccount $result");
      await Get.off(() => Login());
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(
          top: 15,
          bottom: 5,
        ),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(
          top: 5,
          left: 15,
          right: 15,
        ),
      );
    }
  }

  Future login(Map map) async {
    try {
      final result = await account!.createEmailSession(
        email: map['email'],
        password: map['password'],
      );
      print("AccountController:: createEmailSession $result");
      userToken.val = result.providerAccessToken;
      Get.offAll(() => const MainMenu());
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(
          top: 15,
          bottom: 5,
        ),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(
          top: 5,
          left: 15,
          right: 15,
        ),
      );
    }
  }
}
