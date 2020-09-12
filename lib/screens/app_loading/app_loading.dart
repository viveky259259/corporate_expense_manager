import 'package:corporate_expense_manager/component/atoms/circular_progress_bar.dart';
import 'package:corporate_expense_manager/models/user/user_local.dart';
import 'package:corporate_expense_manager/screens/dashboard/dashboard_screen.dart';
import 'package:corporate_expense_manager/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLoadingScreen extends StatefulWidget {
  @override
  _AppLoadingScreenState createState() => _AppLoadingScreenState();
}

class _AppLoadingScreenState extends State<AppLoadingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  void init() async {
    if (((await UserLocal.instance.getLocalUser()) ?? null) != null) {
      Get.off(DashboardScreen());
    } else
      Get.off(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressBarAtom();
  }
}
